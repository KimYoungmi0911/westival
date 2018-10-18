package org.kh.westival.member.controller;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.member.model.service.MemberService;
import org.kh.westival.member.model.vo.Member;
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
	
	@RequestMapping(value="recommendList.do")
	public String recommendList() {
		return "member/recommendList";
	}
	
	@RequestMapping(value="likeFesta.do")
	public String likeFesta() {
		return "member/likeFesta";
	}
	
	@RequestMapping(value="myList.do")
	public String myList() {
		return "member/myList";
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
	
	
	@RequestMapping(value="selectMyList.do", method=RequestMethod.GET)
	public ModelAndView selectMyList(ModelAndView mv, Member member) {
		ArrayList<Festival> list = memberService.selectMyList(member);
		
		mv.addObject("list", list);
		mv.setViewName("member/myList");
		return mv;
	}
	
	@RequestMapping(value="deleteMyList.do", method=RequestMethod.POST)
	public String selectLikeFesta(ModelAndView mv, Member member) {
		mv.addObject(memberService.deleteMyList(member));
		return "member/myList";
	}

}
