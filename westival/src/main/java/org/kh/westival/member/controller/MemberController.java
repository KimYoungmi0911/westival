package org.kh.westival.member.controller;

import org.kh.westival.member.model.service.MemberService;
import org.kh.westival.member.model.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public ModelAndView loginMethod(Member member, ModelAndView mv){
		
		member = memberService.loginCheck(member);
		
		System.out.println(member);
		
		if(member != null){
			
		mv.addObject("member", member);
		
		mv.setViewName("main");
		
		}else if(member == null){
			mv.addObject("member", null);
			mv.setViewName("main");
		}
			
		
		return mv;	
	}
	
	@RequestMapping("logout.do")
	public String logoutMethod(SessionStatus status){
		status.setComplete();
		return "main";
		
	}

}
