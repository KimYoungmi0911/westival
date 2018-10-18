package org.kh.westival.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.member.model.service.MemberService;
import org.kh.westival.member.model.vo.Member;
import org.kh.westival.ticket.model.vo.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("member")
public class MemberController {

	@Autowired
	private MemberService memberService;
 
	//병훈
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public void loginMethod(Member member, 
			@RequestParam(value="user_id") String user_id,
			@RequestParam(value="user_pwd") String user_pwd, HttpServletResponse response) throws Exception{
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		member.setUser_id(user_id);
		member.setUser_pwd(user_pwd);
		member = memberService.loginCheck(member);
		
		System.out.println(member);
		
		
		if(member != null){
			out.print(1);
		}else if(member == null){
			out.print(0);
		}
		
		out.flush();
		out.close();

	}

	@RequestMapping("logout.do")
	public String logoutMethod(SessionStatus status) {
		status.setComplete();
		return "main";

	}
	
	@RequestMapping("loginSuc.do")
	public ModelAndView loginSuccess (ModelAndView mv, Member member){
		System.out.println("suc : " + member);
		
		member= memberService.selectMember(member);
		
		mv.addObject("member", member);
		mv.setViewName("main");
		return mv;
	}
	
	@RequestMapping(value="checkid.do", method=RequestMethod.POST)
	public void checkidMethod(Member member, 
			@RequestParam(value="user_id") String user_id,
			HttpServletResponse response) throws Exception{
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("user_id : " + user_id);
		member.setUser_id(user_id);
		
		member = memberService.checkId(member);
		
		System.out.println(member);
		
		
		if(member != null){
			out.print(1);
		}else if(member == null){
			out.print(0);
		}
		
		out.flush();
		out.close();

	}
	
	//충섭
	@RequestMapping(value="memberInfo.do")
	public String memberInfo() {
		return "member/memberInfo";
	}
	
	// 페이지 이동처리만 담당
	@RequestMapping(value="recommendList.do")
	public String recommendList(ModelAndView mv, Member member){
		return "member/recommendList";		
	}
	
	// 내 예매내역
	@RequestMapping(value="myTicketList.do", method=RequestMethod.POST)
	public void myTicketList(Member member, HttpServletResponse response) throws IOException {
		
		List<Ticket> list = memberService.recommendList(member.getUser_id());
		
		JSONArray jarr = new JSONArray();
		
		for(Ticket ticket : list){
			JSONObject job = new JSONObject();

			job.put("ticket_no", ticket.getTicket_no());
			job.put("ticket_date", ticket.getTicket_date().toString());
			job.put("festival_name", memberService.selectFestivalName(ticket.getNo()));
			job.put("ticket_count", ticket.getTicket_count());
			job.put("price", ticket.getPrice());
			
			jarr.add(job);
		}
		JSONObject sendJson = new JSONObject(); // 전송용 객체
		sendJson.put("list", jarr); // 전송용 객체에 저장
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	
	// 내 예매내역 티켓 날짜조회
	@RequestMapping(value="myTicketSearch.do", method=RequestMethod.POST)
	public void myTicketSearch(Member member, HttpServletRequest request, HttpServletResponse response) throws IOException {

		String start_date = (String)(request.getParameter("start_date"));
		String end_date = (String)(request.getParameter("end_date"));
		
		List<Ticket> list = memberService.myTicketSearch(start_date, end_date, member);
		
		JSONArray jarr = new JSONArray();
		
		for(Ticket ticket : list){
			JSONObject job = new JSONObject();

			job.put("ticket_no", ticket.getTicket_no());
			job.put("ticket_date", ticket.getTicket_date().toString());
			job.put("festival_name", memberService.selectFestivalName(ticket.getNo()));
			job.put("ticket_count", ticket.getTicket_count());
			job.put("price", ticket.getPrice());
			
			jarr.add(job);
		}
		JSONObject sendJson = new JSONObject(); // 전송용 객체
		sendJson.put("list", jarr); // 전송용 객체에 저장
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}
	
	// 내 예매내역 티켓 날짜조회 (1, 3, 6개월)
	@RequestMapping(value="myTicketSearchMonth.do", method=RequestMethod.POST)
	public void myTicketSearchMonth(Member member, HttpServletRequest request, HttpServletResponse response) throws IOException {

		int month = Integer.parseInt((String)request.getParameter("month"));
		
		List<Ticket> list = memberService.myTicketSearchMonth(month, member);
		
		JSONArray jarr = new JSONArray();
		
		for(Ticket ticket : list){
			JSONObject job = new JSONObject();

			job.put("ticket_no", ticket.getTicket_no());
			job.put("ticket_date", ticket.getTicket_date().toString());
			job.put("festival_name", memberService.selectFestivalName(ticket.getNo()));
			job.put("ticket_count", ticket.getTicket_count());
			job.put("price", ticket.getPrice());
			
			jarr.add(job);
		}
		JSONObject sendJson = new JSONObject(); // 전송용 객체
		sendJson.put("list", jarr); // 전송용 객체에 저장
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}	
	
	@RequestMapping(value="likeFesta.do")
	public String likeFesta() {
		return "member/likeFesta";
	}
	
	@RequestMapping(value="selectMyList.do", method=RequestMethod.GET)
	public ModelAndView selectMyList(ModelAndView mv, Member member) {
		ArrayList<Festival> list = memberService.selectMyList(member);
		
		mv.addObject("list", list);
		mv.setViewName("member/myList");
		return mv;
	}
	
	@RequestMapping(value="updateMemberInfo.do", method=RequestMethod.POST)
	public ModelAndView updateMemberInfo(ModelAndView mv, Member member) {
		mv.addObject(memberService.updateMemberInfo(member));
		mv.setViewName("member/memberInfo");
		return mv;
	}
	
	@RequestMapping(value="deleteMemberInfo.do", method=RequestMethod.GET)
	public String deleteMemberInfo(ModelAndView mv, @RequestParam(value="user_id") String user_id) {
		mv.addObject(memberService.deleteMemberInfo(user_id));
		return "redirect:/logout.do";
	}

}
