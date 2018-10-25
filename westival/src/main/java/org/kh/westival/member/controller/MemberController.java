package org.kh.westival.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

	// 병훈 (10/23수정)
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public ModelAndView loginMethod(Member member, @RequestParam(value = "user_id") String user_id,
			@RequestParam(value = "user_pwd") String user_pwd, HttpServletResponse response, ModelAndView mv)
			throws Exception {

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		member.setUser_id(user_id);
		member.setUser_pwd(user_pwd);
		member = memberService.loginCheck(member);

		System.out.println("확인 : " + member);

		if (member != null) {
			out.print(1);
		} else if (member == null) {
			out.print(0);
		}

		out.flush();
		out.close();

		mv.addObject("member", member);
		return mv;
	}

	@RequestMapping("logout.do")
	public String logoutMethod(SessionStatus status) {
		status.setComplete();
		return "main";

	}

	@RequestMapping("loginSuc.do")
	public ModelAndView loginSuccess(ModelAndView mv, Member member) {
		System.out.println("suc : " + member);

		member = memberService.selectMember(member);

		mv.addObject("member", member);
		mv.setViewName("main");
		return mv;
	}

	@RequestMapping(value = "checkid.do", method = RequestMethod.POST)
	public void checkidMethod(Member member, @RequestParam(value = "user_id") String user_id,
			HttpServletResponse response) throws Exception {

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("user_id : " + user_id);
		member.setUser_id(user_id);

		member = memberService.checkId(member);

		System.out.println(member);

		if (member != null) {
			out.print(1);
		} else if (member == null) {
			out.print(0);
		}

		out.flush();
		out.close();
	}

	// 10/23 로그인, 회원가입
	@RequestMapping(value = "loginPage.do")
	public String loginPage() {
		return "login";
	}

	@RequestMapping(value = "registerPage.do")
	public String registerPage() {
		return "register";
	}

	@RequestMapping(value = "register.do", method = RequestMethod.POST)
	public String registerMethod(Member member) {

		// 예외처리

		int result = memberService.insertMember(member);
		return "main";

	}
	
	@RequestMapping(value = "ipsearch.do")
	public String ipsearchPage() {
		return "ipsearch";
	}

	// 페이지 이동처리만 담당
	@RequestMapping(value = "memberInfo.do")
	public String memberInfo() {
		return "member/memberInfo";
	}

	// 페이지 이동처리만 담당
	@RequestMapping(value = "recommendList.do")
	public String recommendList() {
		return "member/recommendList";
	}

	// 페이지 이동처리만 담당
	@RequestMapping(value = "likeFesta.do")
	public String likeFesta() {
		return "member/likeFesta";
	}

	// 페이지 이동처리만 담당
	@RequestMapping(value = "myList.do")
	public String myList() {
		return "member/myList";
	}

	// 회원정보 수정
	@RequestMapping(value = "updateMemberInfo.do", method = RequestMethod.POST)
	public ModelAndView updateMemberInfo(ModelAndView mv, Member member) {
		mv.addObject(memberService.updateMemberInfo(member));
		mv.setViewName("member/memberInfo");
		return mv;
	}

	// 회원정보 삭제
	@RequestMapping(value = "deleteMemberInfo.do", method = RequestMethod.GET)
	public String deleteMemberInfo(ModelAndView mv, @RequestParam(value = "user_id") String user_id) throws Exception {
		mv.addObject(memberService.deleteMemberInfo(user_id));
		return "redirect:/logout.do";
	}

	// 내 게시글 페스티벌 삭제여부 'Y'로 전환
	@RequestMapping(value = "updateMyList.do", method = RequestMethod.GET)
	public String updateMyList(ModelAndView mv, HttpServletRequest request) {
		String check = request.getParameter("checkList");
		String[] checkArr = check.split(" ");
		ArrayList<Integer> list = new ArrayList<Integer>();

		for (String checkItem : checkArr)
			list.add(new Integer(checkItem));

		mv.addObject(memberService.updateMyList(list));
		return "member/myList";
	}

	// 내 게시글 페스티벌 전체 조회
	@RequestMapping(value = "myTotalList.do", method = RequestMethod.POST)
	public void myTotalList(Member member, HttpServletResponse response, HttpServletRequest request,
			HttpSession session) throws IOException {
		JSONArray jarr = new JSONArray();

/*		int currentPage = 1;
		int limit = 10;
		if (request.getParameter("page") != null) {
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
*/
		List<Festival> list = memberService.myTotalList(member.getUser_id());
/*		int listCount = memberService.FestivalgetListCount(member.getUser_id());
		int maxPage = (int) Math.ceil(((double) listCount / limit));
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if (maxPage < endPage) {
			endPage = maxPage;
		}*/
		/*for (int i = limit * (currentPage - 1); i < limit * currentPage; i++) {*/
		for (Festival festival : list) {
			JSONObject job = new JSONObject();

			job.put("new_img_name", festival.getNew_img_name());
			job.put("no", new Integer(festival.getNo()).toString());
			job.put("start_date", new SimpleDateFormat("yyyy-MM-dd").format(festival.getStart_date()));
			job.put("end_date", new SimpleDateFormat("yyyy-MM-dd").format(festival.getEnd_date()));
			job.put("name", festival.getName());
			job.put("manage", festival.getManage());
			job.put("address", festival.getAddress());
			job.put("content", festival.getContent());

			jarr.add(job);
		}

		/*System.out.println(limit * (currentPage - 1) + (listCount % limit));*/

		JSONObject sendJson = new JSONObject(); // 전송용 객체
		sendJson.put("list", jarr); // 전송용 객체에 저장
/*		sendJson.put("currentPage", currentPage);
		sendJson.put("maxPage", maxPage);
		sendJson.put("startPage", startPage);
		sendJson.put("endPage", endPage);*/
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}

	// 내 게시글 페스티벌 날짜 검색
	@RequestMapping(value = "myListSearch.do", method = RequestMethod.POST)
	public void myListSearch(Member member, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		String start_date = (String) (request.getParameter("start_date"));
		String end_date = (String) (request.getParameter("end_date"));

		List<Festival> list = memberService.myListSearch(start_date, end_date, member);

		JSONArray jarr = new JSONArray();

		for (Festival festival : list) {
			JSONObject job = new JSONObject();

			job.put("new_img_name", festival.getNew_img_name());
			job.put("no", new Integer(festival.getNo()).toString());
			job.put("start_date", new SimpleDateFormat("yyyy-MM-dd").format(festival.getStart_date()));
			job.put("end_date", new SimpleDateFormat("yyyy-MM-dd").format(festival.getEnd_date()));
			job.put("name", festival.getName());
			job.put("manage", festival.getManage());
			job.put("address", festival.getAddress());
			job.put("content", festival.getContent());

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

	// 내 게시글 페스티벌 날짜검색(1,3,6개월)
	@RequestMapping(value = "myListSearchMonth.do", method = RequestMethod.POST)
	public void myListSearchMonth(Member member, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		int month = Integer.parseInt((String) request.getParameter("month"));

		List<Festival> list = memberService.myListSearchMonth(month, member);

		JSONArray jarr = new JSONArray();

		for (Festival festival : list) {
			JSONObject job = new JSONObject();

			job.put("new_img_name", festival.getNew_img_name());
			job.put("no", new Integer(festival.getNo()).toString());
			job.put("start_date", new SimpleDateFormat("yyyy-MM-dd").format(festival.getStart_date()));
			job.put("end_date", new SimpleDateFormat("yyyy-MM-dd").format(festival.getEnd_date()));
			job.put("name", festival.getName());
			job.put("manage", festival.getManage());
			job.put("address", festival.getAddress());
			job.put("content", festival.getContent());

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

	// 관심축제 스크랩 삭제
	@RequestMapping(value = "deleteMyFesta.do", method = RequestMethod.GET)
	public String deleteMyFesta(ModelAndView mv, HttpServletRequest request) {
		String check = request.getParameter("checkList");
		String[] checkArr = check.split(" ");
		ArrayList<Integer> list = new ArrayList<Integer>();

		for (String checkItem : checkArr)
			list.add(new Integer(checkItem));

		mv.addObject(memberService.deleteMyFesta(list));
		return "member/likeFesta";
	}

	// 관심축제 페스티벌 전체 조회
	@RequestMapping(value = "myLikeFestaList.do", method = RequestMethod.POST)
	public void myLikeFestaList(Member member, HttpServletResponse response) throws IOException {
		List<Festival> list = memberService.myLikeFestaList(member.getUser_id());

		JSONArray jarr = new JSONArray();

		for (Festival festival : list) {
			JSONObject job = new JSONObject();

			job.put("new_img_name", festival.getNew_img_name());
			job.put("no", new Integer(festival.getNo()).toString());
			job.put("start_date", new SimpleDateFormat("yyyy-MM-dd").format(festival.getStart_date()));
			job.put("end_date", new SimpleDateFormat("yyyy-MM-dd").format(festival.getEnd_date()));
			job.put("name", festival.getName());
			job.put("manage", festival.getManage());
			job.put("address", festival.getAddress());
			job.put("content", festival.getContent());

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

	// 관심축제 페스티벌 날짜 검색
	@RequestMapping(value = "myLikeFestaSearch.do", method = RequestMethod.POST)
	public void myLikeFestaSearch(Member member, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		String start_date = (String) (request.getParameter("start_date"));
		String end_date = (String) (request.getParameter("end_date"));

		List<Festival> list = memberService.myLikeFestaSearch(start_date, end_date, member);

		JSONArray jarr = new JSONArray();

		for (Festival festival : list) {
			JSONObject job = new JSONObject();

			job.put("new_img_name", festival.getNew_img_name());
			job.put("no", new Integer(festival.getNo()).toString());
			job.put("start_date", new SimpleDateFormat("yyyy-MM-dd").format(festival.getStart_date()));
			job.put("end_date", new SimpleDateFormat("yyyy-MM-dd").format(festival.getEnd_date()));
			job.put("name", festival.getName());
			job.put("manage", festival.getManage());
			job.put("address", festival.getAddress());
			job.put("content", festival.getContent());

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

	// 관심축제 페스티벌 날짜검색(1,3,6개월)
	@RequestMapping(value = "myLikeFestaSearchMonth.do", method = RequestMethod.POST)
	public void myLikeFestaSearchMonth(Member member, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		int month = Integer.parseInt((String) request.getParameter("month"));

		List<Festival> list = memberService.myLikeFestaSearchMonth(month, member);

		JSONArray jarr = new JSONArray();

		for (Festival festival : list) {
			JSONObject job = new JSONObject();

			job.put("new_img_name", festival.getNew_img_name());
			job.put("no", new Integer(festival.getNo()).toString());
			job.put("start_date", new SimpleDateFormat("yyyy-MM-dd").format(festival.getStart_date()));
			job.put("end_date", new SimpleDateFormat("yyyy-MM-dd").format(festival.getEnd_date()));
			job.put("name", festival.getName());
			job.put("manage", festival.getManage());
			job.put("address", festival.getAddress());
			job.put("content", festival.getContent());

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

	// 내 예매내역 환불할 티켓 정보 조회
	@RequestMapping(value = "myCurrentTicket.do", method = RequestMethod.POST)
	public void myCurrentTicket(Member member, HttpServletResponse response, String ticket_no) throws IOException {
		Ticket ticket = memberService.myCurrentTicket(ticket_no);

		JSONArray jarr = new JSONArray();
		JSONObject job = new JSONObject();

		job.put("ticket_no", ticket.getTicket_no());
		job.put("ticket_date", new SimpleDateFormat("yyyy-MM-dd").format(ticket.getTicket_date()));
		job.put("festival_name", memberService.selectFestivalName(ticket.getNo()));
		job.put("ticket_count", new Integer(ticket.getTicket_count()).toString());
		job.put("price", new Integer(ticket.getPrice()).toString());

		jarr.add(job);

		JSONObject sendJson = new JSONObject(); // 전송용 객체
		sendJson.put("list", jarr); // 전송용 객체에 저장
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}

	// 내 예매내역 환불 처리
	@RequestMapping(value = "refundCurrentTicket.do", method = RequestMethod.POST)
	public void refundCurrentTicket(HttpServletResponse response, String ticket_no, String refund_why)
			throws Exception {
		memberService.refundCurrentTicket(ticket_no);
		memberService.updateRefundWhy(ticket_no, refund_why);
	}

	// 경호
	// 내 예매내역
	@RequestMapping(value = "myTicketList.do", method = RequestMethod.POST)
	public void myTicketList(Member member, HttpServletResponse response) throws IOException {
		List<Ticket> list = memberService.recommendList(member.getUser_id());

		JSONArray jarr = new JSONArray();

		for (Ticket ticket : list) {
			JSONObject job = new JSONObject();

			job.put("ticket_no", ticket.getTicket_no());
			job.put("ticket_date", ticket.getTicket_date().toString());
			job.put("festival_name", memberService.selectFestivalName(ticket.getNo()));
			job.put("ticket_count", ticket.getTicket_count());
			job.put("price", ticket.getPrice());
			job.put("state", ticket.getState());

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
	@RequestMapping(value = "myTicketSearch.do", method = RequestMethod.POST)
	public void myTicketSearch(Member member, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		String start_date = (String) (request.getParameter("start_date"));
		String end_date = (String) (request.getParameter("end_date"));

		List<Ticket> list = memberService.myTicketSearch(start_date, end_date, member);

		JSONArray jarr = new JSONArray();

		for (Ticket ticket : list) {
			JSONObject job = new JSONObject();

			job.put("ticket_no", ticket.getTicket_no());
			job.put("ticket_date", ticket.getTicket_date().toString());
			job.put("festival_name", memberService.selectFestivalName(ticket.getNo()));
			job.put("ticket_count", ticket.getTicket_count());
			job.put("price", ticket.getPrice());
			job.put("state", ticket.getState());

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
	@RequestMapping(value = "myTicketSearchMonth.do", method = RequestMethod.POST)
	public void myTicketSearchMonth(Member member, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		int month = Integer.parseInt((String) request.getParameter("month"));

		List<Ticket> list = memberService.myTicketSearchMonth(month, member);

		JSONArray jarr = new JSONArray();

		for (Ticket ticket : list) {
			JSONObject job = new JSONObject();

			job.put("ticket_no", ticket.getTicket_no());
			job.put("ticket_date", ticket.getTicket_date().toString());
			job.put("festival_name", memberService.selectFestivalName(ticket.getNo()));
			job.put("ticket_count", ticket.getTicket_count());
			job.put("price", ticket.getPrice());
			job.put("state", ticket.getState());

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
}
