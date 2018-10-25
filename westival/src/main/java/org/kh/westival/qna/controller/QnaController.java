package org.kh.westival.qna.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.kh.westival.qna.model.service.QnaService;
import org.kh.westival.qna.model.vo.Qna;
import org.kh.westival.qna.model.vo.QnaReply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("qna")
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	//qna게시판 리스트
	@RequestMapping("qnaBoard.do")
	public ModelAndView qnaBoardMethod(ModelAndView mv, ArrayList<Qna> list,
								HttpServletRequest request){
		System.out.println("qna컨트롤러");
		
		int totalCount = qnaService.selectListCount();
		int currentPage = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		int maxPage = (int)((double)totalCount / limit + 0.9);
		int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if(maxPage < endPage)
			endPage = maxPage;
	
		mv.addObject("list", qnaService.selectQnaList(currentPage, limit));
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("qna/qna");
		
		return mv;
	}
	
	//qna 글쓰기
	@RequestMapping("qnaWriteForm.do")
	public String qnaWriteFormMethod(){
		System.out.println("글쓰기 컨트롤러");
		
		return "qna/qnaWrite";
	}
	
	//qna 글등록(파일x)
	@RequestMapping(value="qnaInsert.do", method=RequestMethod.POST)
	public String qnaInsertMethod(Qna qna){
		System.out.println("글등록 컨트롤러");
		System.out.println(qna);
		String result;
		
		if(qnaService.insertQna(qna) > 0){
			System.out.println("성공");
			result = "redirect:/qnaBoard.do";
		}else{
			System.out.println("실패");
			result = "redirect:/qnaWriteForm.do";
		}
		
		return result;
	}
	
	//qna 글등록(파일ㅇ)
	@RequestMapping(value="qnaFileInsert.do", method=RequestMethod.POST)
	public String qnaFileInsertMethod(HttpServletRequest request, @RequestParam(name="file_name") MultipartFile file,
							@RequestParam(name="category") String category,
							@RequestParam(name="subject") String subject, @RequestParam(name="content") String content,
							@RequestParam(name="user_id") String user_id){
		System.out.println("글등록 파일 컨트롤러");
		
		Qna qna = new Qna();
		
		qna.setCategory(category);
		qna.setSubject(subject);
		qna.setContent(content);
		qna.setUser_id(user_id);
		
		if(request.getParameter("active") == null){
			qna.setActive("Y");
		}else{
			qna.setActive(request.getParameter("active"));
		}
		
		String result;
		
		//파일 저장 폴더
		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadFiles/QnaFile");
		
		String originalFileName = null;
		String renameFileName = null;
		//디스크 상 경로 설정할때는 \\ 웹상에서는 // 써도 상관 없음
		try {
			//파일명을 'yyyyMMddhhmmss.확장자'로 변경함
			//변경된 파일명이 폴더에 저장되게 함
			String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
			Date today = new Date();
			SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddhhmmss");
			
			System.out.println(extension);
			System.out.println(sd.format(today));
			
			originalFileName = file.getOriginalFilename();
			renameFileName = sd.format(today).toString() +"."+ extension; 
			
			file.transferTo(new File(savePath + "\\" + renameFileName));
			
			qna.setFile_name(originalFileName);
			qna.setRename_file_name(renameFileName);
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		if(qnaService.insertQna(qna) > 0){
			System.out.println("성공");
			result = "redirect:/qnaBoard.do";
		}else{
			System.out.println("실패");
			result = "redirect:/qnaWriteForm.do";
		}
		
		return result;
	}
	
	//파일 다운로드
	@RequestMapping("fileDownload.do")
	public ModelAndView fileDownMethod(ModelAndView mv, HttpServletRequest request,
														@RequestParam(name="ofile") String originalFileName,
														@RequestParam(name="rfile") String renameFileName){
		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadFiles/QnaFile");
		File readFile = new File(savePath + "\\" + renameFileName);
		File originFile = new File(originalFileName);
		
		mv.setViewName("filedownQna");
		mv.addObject("readFile", readFile);
		mv.addObject("downFile", originFile);
		
		return mv;
	}
	
	//qna 게시글 보기
	@RequestMapping("qnaDetail.do")
	public ModelAndView qnaDetailViewMethod(@RequestParam(value="no") int qna_no, 
											@RequestParam(value="page") int currentPage,ModelAndView mv,
											HttpServletRequest request){
		System.out.println("게시글 보기 컨트롤러");
		
		//조회수 증가
		if(qnaService.updateCount(qna_no) > 0){
			System.out.println("조회수 증가 처리 성공");
		}else{
			System.out.println("조회수 증가 처리 실패");
		}
		
		if(request.getParameter("keyword") != null){
			mv.addObject("category1", request.getParameter("category1"));
			mv.addObject("category2", request.getParameter("category2"));
			mv.addObject("keyword", request.getParameter("keyword"));
		}
		
		mv.addObject("qna", qnaService.selectQna(qna_no));
		mv.addObject("currentPage", currentPage);
		mv.setViewName("qna/qnaDetail");
		return mv;
	}
	
	//qna 검색
	@RequestMapping(value="qnaSearch.do")
	public void qnaSearchMethod(@RequestParam(value="category") String category1, @RequestParam(value="search") String category2,
											@RequestParam(value="skeyword") String keyword, HttpServletResponse response,
											HttpServletRequest request) throws IOException{
		
		/*String category1 = "";
		
		if(request.getParameter("category") != null){
			category1 = request.getParameter("category");
		}
		*/
		HashMap params = new HashMap();
		params.put("category1", category1);
		params.put("category2", category2);
		params.put("keyword", keyword);
		
		int totalCount = qnaService.selectSearchListCount(params);
		int currentPage = 1;
		int limit = 10;
		
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		int maxPage = (int)((double)totalCount / limit + 0.9);
		int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if(maxPage < endPage)
			endPage = maxPage;
		
		
		ArrayList<Qna> list = qnaService.selectSearchQna(category1, category2, keyword, currentPage, limit);
		
		for(Qna nqa : list){
			System.out.println(nqa);
		}
		
		JSONArray jarr = new JSONArray();
		
		for(Qna qna : list){
			JSONObject juser = new JSONObject();
			
			juser.put("qna_no", qna.getQna_no());
			juser.put("user_id", qna.getUser_id());
			juser.put("category", qna.getCategory());
			juser.put("state", qna.getState());
			juser.put("qna_date", qna.getQna_date().toString());
			juser.put("subject", qna.getSubject());
			juser.put("content", qna.getContent());
			juser.put("read_count", qna.getRead_count());
			juser.put("file_name", qna.getFile_name());
			juser.put("active", qna.getActive());

			
			jarr.add(juser);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		sendJson.put("currentPage", currentPage);
		sendJson.put("startPage", startPage);
		sendJson.put("endPage", endPage);
		sendJson.put("totalCount", totalCount);
		sendJson.put("category", category1);
		sendJson.put("search", category2);
		sendJson.put("skeyword", keyword);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		System.out.println(sendJson);
		out.flush();
		out.close();
		
	}
	
	//qna 글 삭제
	@RequestMapping(value="deleteQna.do", method=RequestMethod.POST)
	public void deleteQnaMethod(@RequestParam(value="no") int qna_no, HttpServletResponse response) throws IOException{
		System.out.println("qna 삭제 컨트롤러");

		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		if(qnaService.deleteQna(qna_no) > 0){
			out.append("ok");
		}else{
			out.append("fail");
		}
	}
	
	//qna 글 수정 뷰
	@RequestMapping(value="qnaUpdateView")
	public ModelAndView qnaUpdateViewMethod(@RequestParam(value="no") int qna_no, ModelAndView mv){
		System.out.println("글 수정 뷰 컨트롤러");
		
		mv.addObject("qna", qnaService.selectQna(qna_no));
		mv.setViewName("qna/qnaUpdate");
		
		return mv;
	}
	
	//qna 글 수정 컨트롤러
	@RequestMapping(value="qnaUpdate.do", method=RequestMethod.POST)
	public String updateQnaMethod(Qna qna, HttpServletResponse response, HttpServletRequest request,
											@RequestParam(name="upfile") MultipartFile file,
											@RequestParam(name="category") String category,
											@RequestParam(name="subject") String subject,
											@RequestParam(name="content") String content,
											@RequestParam(name="qna_no") int qna_no) throws IOException{
		System.out.println("qna 수정 컨트롤러");
		
		
		qna.setCategory(category);
		qna.setSubject(subject);
		qna.setContent(content);
		qna.setQna_no(qna_no);
		
		if(request.getParameter("active") == null){
			qna.setActive("Y");
		}else{
			qna.setActive(request.getParameter("active"));
		}
		
		String result = "";
		
		if(file != null){
			//파일 저장 폴더
			String savePath = request.getSession().getServletContext().getRealPath("resources/uploadFiles/QnaFile");
			
			String originalFileName = null;
			String renameFileName = null;
			//디스크 상 경로 설정할때는 \\ 웹상에서는 // 써도 상관 없음
			try {
				//파일명을 'yyyyMMddhhmmss.확장자'로 변경함
				//변경된 파일명이 폴더에 저장되게 함
				String extension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
				Date today = new Date();
				SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddhhmmss");
				
				System.out.println(extension);
				System.out.println(sd.format(today));
				
				originalFileName = file.getOriginalFilename();
				renameFileName = sd.format(today).toString() +"."+ extension; 
				
				file.transferTo(new File(savePath + "\\" + renameFileName));
				
				qna.setFile_name(originalFileName);
				qna.setRename_file_name(renameFileName);
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println(qna);
		
		if(qnaService.updateQna(qna) > 0){
			System.out.println("성공");
			result = "forward:/qnaDetail.do";
		}
		
		return result;
	}
	
	//댓글 등록
	@RequestMapping(value="QnaInsertReply.do", method=RequestMethod.POST)
	public void QnaInsertReplyMethod(QnaReply qnaReply, HttpServletResponse response) throws IOException{
		System.out.println(qnaReply);
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		if(qnaService.insertQnaReply(qnaReply) > 0){
			if(qnaReply.getReply_user_id().equals("admin"))
				qnaService.updateQnaState(qnaReply.getQna_no(), "답변완료");
			
			out.append("ok");
		}else{
			out.append("fail");
		}
		
		out.close();
	}
	
	//댓글 목록
	@RequestMapping(value="selectQnaReply.do", method=RequestMethod.POST)
	public void selectQnaReplyMethod(@RequestParam(value="no") int no, HttpServletResponse response) throws IOException{
		System.out.println("qna 댓글 컨트롤러");
		
		ArrayList<QnaReply> list = qnaService.selectQnaReply(no);

		System.out.println(list);
		
		JSONArray jarr = new JSONArray();
		
		if(list.size() == 0 && qnaService.selectQna(no).getState().equals("답변완료")){
			qnaService.updateQnaState(no, "답변대기");
		}
		
		for(QnaReply qnaReply : list){
			JSONObject juser = new JSONObject();
			juser.put("reply_no", qnaReply.getReply_no());
			juser.put("reply_user_id", qnaReply.getReply_user_id());
			juser.put("qna_no", qnaReply.getQna_no());
			juser.put("reply_content", qnaReply.getReply_content());
			juser.put("reply_level", qnaReply.getReply_level());
			juser.put("reply_seq", qnaReply.getReply_seq());
			juser.put("reply_date", qnaReply.getReply_date().toString());
			juser.put("reply_ref", qnaReply.getReply_ref());
			
			if(qnaService.selectQna(no).getState().equals("답변완료") && !qnaReply.getReply_user_id().equals("admin")){
				qnaService.updateQnaState(no, "답변대기");
			}else if(qnaService.selectQna(no).getState().equals("답변대기") && qnaReply.getReply_user_id().equals("admin")){
				qnaService.updateQnaState(no, "답변완료");
			}
			
			jarr.add(juser);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		sendJson.put("no", no);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		System.out.println(sendJson);
		out.flush();
		out.close();
	}
	
	//댓글 수정
	@RequestMapping(value="updateQnaReply.do", method=RequestMethod.POST)
	public void updateQnaReplyMethod(QnaReply qnaReply, 
													HttpServletResponse response) throws IOException{
		System.out.println(qnaReply);

		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();

		if (qnaService.updateQnaReply(qnaReply) > 0) {
			out.append("ok");
		} else {
			out.append("faile");
		}
		out.close();
	}
	
	//댓글 삭제
	@RequestMapping(value="deleteQnaReply.do", method=RequestMethod.POST)
	public void deleteQnaReplyMethod(@RequestParam(value = "reply_no") int reply_no, 
													HttpServletResponse response) throws IOException{
		System.out.println(reply_no);

		response.setContentType("text/html; charset=utf-8");

		PrintWriter out = response.getWriter();

		if (qnaService.deleteQnaReply(reply_no) > 0) {
			out.append("ok");
		} else {
			out.append("faile");
		}
		out.close();
	}
}









