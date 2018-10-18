package org.kh.westival.festival.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.kh.westival.festival.exception.FestivalException;
import org.kh.westival.festival.model.service.FestivalService;
import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.festival.model.vo.FestivalReply;
import org.kh.westival.festival.model.vo.Recommend;
import org.kh.westival.festival.model.vo.Scrap;
import org.kh.westival.festival.model.vo.TicketOption;
import org.kh.westival.member.model.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FestivalController {
	
	@Autowired
	private FestivalService festivalService;

	//경호
	// 축제 등록창으로 이동
	@RequestMapping("insertFestivalPage.do")
	public ModelAndView insertFestivalMethod(ModelAndView mv){
		mv.setViewName("festival/insertFestival");
		
		return mv;
	}
	
	// 축제 검색창으로 이동
	@RequestMapping("searchFestivalPage.do")
	public ModelAndView searchFestivalMethod(ModelAndView mv){
		
		mv.setViewName("festival/searchFestival");
		
		return mv;
	}	

	// 축제 등록 (+티켓)
	@RequestMapping(value="insertFestival.do", method=RequestMethod.POST)
	public ModelAndView insertFestival(ModelAndView mv, HttpServletRequest request,
			Festival festival, @RequestParam(name="img_name") MultipartFile img_name, 
			@RequestParam(name="attached") MultipartFile attached){
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		
		TicketOption ticketOption = new TicketOption();
				
		festival.setReg_user(member.getUser_id());		
		
		// 파일 저장 폴더 지정하기
		String imgSavePath = request.getSession().getServletContext().getRealPath("resources/uploadFiles/festivalImg");
		String attSavePath = request.getSession().getServletContext().getRealPath("resources/uploadFiles/festivalAtt");
	
		// 이미지 파일 처리
		try {				
			String originalFileName = img_name.getOriginalFilename();
			String renameFileName = null;
			
			if(originalFileName != null){
				SimpleDateFormat sdf = 
					new SimpleDateFormat("yyyyMMddHHmmss");
				renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))
						+ "." + originalFileName.substring(originalFileName.lastIndexOf(".") + 1);

				img_name.transferTo(new File(imgSavePath + "\\" + img_name.getOriginalFilename()));				

				File originFile = new File(imgSavePath + "\\" + originalFileName);
				File renameFile = new File(imgSavePath + "\\" + renameFileName);

				if(!originFile.renameTo(renameFile)){
					int read = -1;
					byte[] buf = new byte[1024];
					
					FileInputStream fin = new FileInputStream(originFile);
					FileOutputStream fout =	new FileOutputStream(renameFile);
					
					while((read = fin.read(buf, 0, buf.length)) != -1){
						fout.write(buf, 0, read);
					}					
					fin.close();
					fout.close();					
				}	
			}
			festival.setOriginal_img_name(originalFileName);
			festival.setNew_img_name(renameFileName);
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}	

		// 첨부 파일 처리
		if(attached.getOriginalFilename()!=""){ // 첨부파일 있을 때 이름 바꿔서 넣기
			try {	
				String originalFileName = attached.getOriginalFilename();
				String renameFileName = null;
				
				if(originalFileName != null){
					SimpleDateFormat sdf = 
						new SimpleDateFormat("yyyyMMddHHmmss");
					renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))
							+ "." + originalFileName.substring(originalFileName.lastIndexOf(".") + 1);

					attached.transferTo(new File(attSavePath + "\\" + attached.getOriginalFilename()));				
					
					//파일명 바꾸려면 File 객체의 renameTo() 사용함
					File originFile = new File(attSavePath + "\\" + originalFileName);
					File renameFile = new File(attSavePath + "\\" + renameFileName);
				
					//파일 이름바꾸기 실행 >> 실패할 경우 직접 바꾸기함
					//새 파일만들고 원래 파일 내용 읽어서 복사하고
					//복사가 끝나면 원래 파일 삭제함
					if(!originFile.renameTo(renameFile)){
						int read = -1;
						byte[] buf = new byte[1024];
						
						FileInputStream fin = new FileInputStream(originFile);
						FileOutputStream fout =	new FileOutputStream(renameFile);
						
						while((read = fin.read(buf, 0, buf.length)) != -1){
							fout.write(buf, 0, read);
						}						
						fin.close();
						fout.close();					
					}	
				}				
				festival.setFile_name(renameFileName);				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
			
		if(request.getParameter("ticket_name").length()!=0){
			festival.setTicket("Y");			
			ticketOption.setTicket_name(request.getParameter("ticket_name"));
			ticketOption.setTicket_price(Integer.parseInt(request.getParameter("ticket_price")));
			ticketOption.setTicket_quantity(Integer.parseInt(request.getParameter("ticket_quantity")));
			ticketOption.setCompany_name(request.getParameter("company_name"));
			ticketOption.setCeo_name(request.getParameter("ceo_name"));
			ticketOption.setCompany_no(Integer.parseInt(request.getParameter("company_no")));
			ticketOption.setPhone(request.getParameter("phone"));
			ticketOption.setBank_name(request.getParameter("bank_name"));
			ticketOption.setAccount_holder_name(request.getParameter("account_holder_name"));
			ticketOption.setAccount_no(Integer.parseInt(request.getParameter("account_no")));			
		} else{
			festival.setTicket("N");
		}	
		
		try{
			// 축제 등록
			if(festivalService.insertFestival(festival) <= 0)
				throw new FestivalException("축제 등록 에러");
			
			// 아이디 넣어줌
			//ticketOption.setNo(festival.getNo());
			ticketOption.setUser_id(festival.getReg_user());
			
			if(festival.getTicket().equals("Y")) {
				if(festivalService.insertTicketOption(ticketOption) <= 0)
					throw new FestivalException("티켓 등록 에러");
			}
		} catch(Exception e){
			throw new FestivalException(e.getMessage());
		}
		
		mv.setViewName("festival/searchFestival");
		return mv;
	}
	
	// 지역 별 축제 검색
	@RequestMapping(value="locationSearch.do", method=RequestMethod.POST)
	public void locationSearchMethod(HttpServletResponse response, HttpServletRequest request, Festival festival) throws IOException {
		
		String user_id = null;
		if( (request.getSession().getAttribute("member")) != null )
			user_id = ((Member)request.getSession().getAttribute("member")).getUser_id();
				
		List<Festival> list = festivalService.locationSearch(festival);
		
		JSONArray jarr = new JSONArray(); // json 배열 객체 생성		
		for(Festival fest : list){
			JSONObject job = new JSONObject();
			job.put("no", fest.getNo()); //축제번호
			job.put("name", fest.getName()); // 축제명
			job.put("new_img_name", fest.getNew_img_name()); // 축제사진
			job.put("address", fest.getAddress()); // 장소
			job.put("start_date", fest.getStart_date().toString()); // date 형 받아올 때 toString 해줌
			job.put("end_date", fest.getEnd_date().toString());
			job.put("theme", fest.getTheme());
			job.put("tag", fest.getTag());
			job.put("recommend", fest.getRecommend());
			
			if(user_id==null){
				job.put("scrap", 2);
			} else {
				Scrap scrap = new Scrap(user_id, fest.getNo()); 
				if(festivalService.selectScrap(scrap)==null){
					job.put("scrap", 0);
				} else{
					job.put("scrap", 1);
				}
			}
			jarr.add(job); // json배열에 객체 저장
		}
		
		JSONObject sendJson = new JSONObject(); // 전송용 객체
		sendJson.put("list", jarr); // 전송용 객체에 저장
		
		// 직접 요청자에게 내보내기
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	
	// 태그 별 축제 검색
	@RequestMapping(value="tagSearch.do", method=RequestMethod.POST)
	public void tagSearchMethod(HttpServletResponse response, HttpServletRequest request, Festival festival) throws IOException {
		
		String user_id = null;
		if( (request.getSession().getAttribute("member")) != null )
			user_id = ((Member)request.getSession().getAttribute("member")).getUser_id();

		List<Festival> list = festivalService.tagSearch(festival);
		
		JSONArray jarr = new JSONArray(); // json 배열 객체 생성		
		for(Festival fest : list){
			JSONObject job = new JSONObject();
			job.put("no", fest.getNo()); //축제번호
			job.put("name", fest.getName()); // 축제명
			job.put("new_img_name", fest.getNew_img_name()); // 축제사진
			job.put("address", fest.getAddress()); // 장소
			job.put("start_date", fest.getStart_date().toString()); // date 형 받아올 때 toString 해줌
			job.put("end_date", fest.getEnd_date().toString());
			job.put("theme", fest.getTheme());
			job.put("tag", fest.getTag());
			job.put("recommend", fest.getRecommend());
			
			if(user_id==null){
				job.put("scrap", 2);
			} else {
				Scrap scrap = new Scrap(user_id, fest.getNo()); 
				if(festivalService.selectScrap(scrap)==null){
					job.put("scrap", 0);
				} else{
					job.put("scrap", 1);
				}
			}

			jarr.add(job); // json배열에 객체 저장
		}
		
		JSONObject sendJson = new JSONObject(); // 전송용 객체
		sendJson.put("list", jarr); // 전송용 객체에 저장
		
		// 직접 요청자에게 내보내기
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	
	// 이달의 축제 (메인)
	@RequestMapping(value="todayFestival.do", method=RequestMethod.POST)
	public void todayFestivalMethod(HttpServletResponse response) throws IOException {
	
		Date date = new Date();
		java.sql.Date currentDate = new java.sql.Date(date.getTime());
		
		List<Festival> list = festivalService.todayFestivalSearch(currentDate);
		
		JSONArray jarr = new JSONArray(); // json 배열 객체 생성		
		for(Festival fest : list){
			JSONObject job = new JSONObject();
			job.put("no", fest.getNo()); //축제번호
			job.put("name", fest.getName()); // 축제명
			job.put("new_img_name", fest.getNew_img_name()); // 축제사진
			job.put("address", fest.getAddress()); // 장소
			job.put("start_date", fest.getStart_date().toString()); // date 형 받아올 때 toString 해줌
			job.put("end_date", fest.getEnd_date().toString());
			job.put("theme", fest.getTheme());
			job.put("tag", fest.getTag());

			jarr.add(job); // json배열에 객체 저장
		}
		
		JSONObject sendJson = new JSONObject(); // 전송용 객체
		sendJson.put("list", jarr); // 전송용 객체에 저장
		
		// 직접 요청자에게 내보내기
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	
	// 인기 축제 (메인)
	@RequestMapping(value="top3Festival.do", method=RequestMethod.POST)
	public void top3FestivalMethod(HttpServletResponse response) throws IOException {
		
		List<Festival> list = festivalService.top3FestivalSearch();
		
		JSONArray jarr = new JSONArray(); // json 배열 객체 생성		
		for(Festival fest : list){
			JSONObject job = new JSONObject();
			job.put("no", fest.getNo()); //축제번호
			job.put("name", fest.getName()); // 축제명
			job.put("new_img_name", fest.getNew_img_name()); // 축제사진
			job.put("address", fest.getAddress()); // 장소
			job.put("start_date", fest.getStart_date().toString()); // date 형 받아올 때 toString 해줌
			job.put("end_date", fest.getEnd_date().toString());
			job.put("theme", fest.getTheme());
			job.put("tag", fest.getTag());

			jarr.add(job); // json배열에 객체 저장
		}
		
		JSONObject sendJson = new JSONObject(); // 전송용 객체
		sendJson.put("list", jarr); // 전송용 객체에 저장
		
		// 직접 요청자에게 내보내기
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();		  
	}
	
	// scrap 체크 후 추가/취소
	@RequestMapping(value="scrapCheck.do", method=RequestMethod.POST)
	public void scrapCheck(HttpServletResponse response, Scrap scrap) throws IOException {
		PrintWriter out = response.getWriter();
		
		scrap.setUser_id("user01"); // 세션 아이디
		
		if(festivalService.selectScrap(scrap)==null){
			festivalService.insertScrap(scrap);
			out.append("insert");
			out.flush();
		
		} else{
			festivalService.deleteScrap(scrap);
			out.append("delete");
			out.flush();
		}

	}
	
	//다혜
	@RequestMapping(value="Info.do")
	public ModelAndView InfoMethod(ModelAndView mv, @RequestParam(value="no") int no,
										HttpServletRequest request){
		System.out.println("상세페이지 로드 컨트롤러");
		
		if(festivalService.updateCount(no)>0){
			System.out.println("조회수 증가 성공");
		}else{
			System.out.println("조회수 증가 실패");
		}
		
		/*Festival festival = festivalService.selectFestival(no);
		festivalReply = festivalService.selectFestivalReply(no);
		System.out.println(festival);
		System.out.println(festivalReply);*/
		
		int totalCount = festivalService.selectlistCount(no);
		int currentPage = 1;
		int limit = 5;
		
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		int maxPage = (int)((double)totalCount / limit + 0.9);
		int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if(maxPage < endPage)
			endPage = maxPage;
		
		//System.out.println(festivalService.selectFestivalReply(no,currentPage,limit));
		mv.addObject("festival", festivalService.selectFestival(no));
		mv.addObject("reply", festivalService.selectFestivalReply(no,currentPage,limit));
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("totalCount", totalCount);
		mv.setViewName("festival/fesInfoView");
		
		return mv;
	}
	
	@RequestMapping(value="insertReply.do", method=RequestMethod.POST)
	public void insertReplyMethod(FestivalReply festivalReply, HttpServletResponse response) throws IOException{
		System.out.println(festivalReply);
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		if(festivalService.insertReply(festivalReply) > 0){
			out.append("ok");
		}else{
			out.append("fail");
		}
		
		out.close();
	}
	
	
	@RequestMapping(value="selectReply.do", method=RequestMethod.POST)
	public void festivalReplyListMethod(@RequestParam(value="no") int no, @RequestParam(value="page") int page,
										HttpServletResponse response) throws IOException{
		System.out.println("댓글 ajax 컨트롤러");
		
		int totalCount = festivalService.selectlistCount(no);
		int currentPage = page;
		int limit = 5;
		
		int maxPage = (int)((double)totalCount / limit + 0.9);
		int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if(maxPage < endPage)
			endPage = maxPage;
		
		
		ArrayList<FestivalReply> list = festivalService.selectFestivalReply(no,currentPage,limit);
		
		//System.out.println(list);
		
		JSONArray jarr = new JSONArray();
		
		for(FestivalReply festivalReply : list){
			JSONObject juser = new JSONObject();
			juser.put("reply_no", festivalReply.getReply_no());
			juser.put("reply_user_id", festivalReply.getReply_user_id());
			juser.put("reply_content", festivalReply.getReply_content());
			juser.put("reply_date", festivalReply.getReply_date().toString());
			juser.put("festival_no", festivalReply.getFestival_no());
			juser.put("reply_seq", festivalReply.getreply_seq());
			
			jarr.add(juser);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		sendJson.put("currentPage", currentPage);
		sendJson.put("no", no);
		sendJson.put("startPage", startPage);
		sendJson.put("endPage", endPage);
		sendJson.put("totalCount", totalCount);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		System.out.println(sendJson);
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="updateReply.do", method=RequestMethod.POST)
	public void updateReplyMethod(FestivalReply festivalReply, HttpServletResponse response) throws IOException{
		System.out.println(festivalReply);
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		if(festivalService.updateReply(festivalReply) > 0){
			out.append("ok");
		}else{
			out.append("faile");
		}
		
		out.close();
		
	}
	
	@RequestMapping(value="deleteReply.do", method=RequestMethod.POST)
	public void deleteReplyMethod(@RequestParam(value="reply_no") int reply_no, HttpServletResponse response) throws IOException{
		System.out.println(reply_no);
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		if(festivalService.deleteReply(reply_no) > 0){
			out.append("ok");
		}else{
			out.append("faile");
		}
		
		out.close();
	}
	
	@RequestMapping(value="updateRecommend.do", method=RequestMethod.POST)
	@ResponseBody
	public String updateRecommendMethod(Recommend recommend, HttpServletResponse response) throws IOException{
		System.out.println("추천 컨트롤러");
		
		response.setContentType("application/json; charset=utf-8");
		
		JSONObject job = new JSONObject();
		
		if(festivalService.recommendCheck(recommend) > 0){
			festivalService.deleteRecommend(recommend);
			job.put("result", "fail");
			job.put("recommend", festivalService.selectFestival(recommend.getNo()).getRecommend());
		}else{
			festivalService.insertRecommend(recommend);
			job.put("result", "ok");
			job.put("recommend", festivalService.selectFestival(recommend.getNo()).getRecommend());
		}
		
		return job.toJSONString();
	}
	
	@RequestMapping(value="selectScrap.do", method=RequestMethod.POST)
	public void selectScrapMethod(Scrap scrap, HttpServletResponse response) throws IOException{
		System.out.println("상세페이지 스크랩 체크 컨트롤러");
		
		//클라이언트와 출력스트림 만들기
		response.setContentType("text/html; charset=utf-8");
				
		PrintWriter out = response.getWriter();
		
		if(festivalService.scrapCheck(scrap) > 0){
			out.append("ok");
		}else{
			out.append("fail");
		}
		
	}
	
	@RequestMapping(value="updateScrap.do", method=RequestMethod.POST)
	public void updateScrapMethod(Scrap scrap, HttpServletResponse response) throws IOException{
		System.out.println("찜 컨트롤러");
		System.out.println(scrap);
		
		//클라이언트와 출력스트림 만들기
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		System.out.println(festivalService.scrapCheck(scrap));
		
		if(festivalService.scrapCheck(scrap) > 0){
			festivalService.deleteScrap(scrap);
			out.append("fail");
		}else{
			festivalService.insertScrap(scrap);
			out.append("ok");
		}

		out.flush();
		out.close();
	}
}
