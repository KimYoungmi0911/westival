package org.kh.westival.qna.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.kh.westival.festival.model.vo.FestivalReply;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadFiles/qnaFile");
		
		String originalFileName = null;
		try {
			originalFileName = file.getOriginalFilename();
			qna.setFile_name(originalFileName);
			
			file.transferTo(new File(savePath + "\\" + originalFileName));
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
	
	//qna 게시글 보기
	@RequestMapping("qnaDetail.do")
	public ModelAndView qnaDetailViewMethod(@RequestParam(value="no") int qna_no, 
											@RequestParam(value="page") int currentPage,ModelAndView mv){
		System.out.println("게시글 보기 컨트롤러");
		
		//조회수 증가
		if(qnaService.updateCount(qna_no) > 0){
			System.out.println("조회수 증가 처리 성공");
		}else{
			System.out.println("조회수 증가 처리 실패");
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
	
	//댓글 등록
	@RequestMapping(value="QnaInsertReply.do", method=RequestMethod.POST)
	public void QnaInsertReplyMethod(QnaReply qnaReply, HttpServletResponse response) throws IOException{
		System.out.println(qnaReply);
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		if(qnaService.insertQnaReply(qnaReply) > 0){
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
}









