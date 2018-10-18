package org.kh.westival.ticket.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.kh.westival.ticket.model.service.TicketService;
import org.kh.westival.ticket.model.vo.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TicketController {

	@Autowired
	private TicketService tService;

	@RequestMapping("ticketPage.do")
	public String ticketViewMethod() {
		return "/ticket/ticketView";
	}

	// 예매하기 호출시
	@RequestMapping(value = "ticketing.do")
	public ModelAndView ticketing(ModelAndView mv, Ticket ticket, 
			@RequestParam(value = "user_id") String user_id,
			@RequestParam(value = "no") int no) {
		
		mv.addObject("member", tService.selectMember(user_id));
		mv.addObject("festival", tService.selectFestival(no));
		mv.addObject("ticketOption", tService.selectTicketOption(no));

		mv.setViewName("ticket/ticketView");
		
		return mv;
	}

	// 결제 완료시
	@RequestMapping(value = "ticketComplete.do", method=RequestMethod.POST)
	public ModelAndView ticketComplete(ModelAndView mv, Ticket ticket,
			HttpServletRequest request,
			@RequestParam(value="no") int no,
			@RequestParam(value="user_id") String user_id,
			@RequestParam(value="ticket_date") Date ticket_date,
			@RequestParam(value="ticket_count") int ticket_count,
			@RequestParam(value="pay_type") String pay_type,
			@RequestParam(value="price") int price,
			@RequestParam(value="state") String state, 
			@RequestParam(value="import_uid") String import_uid
			//@ModelAttribute //,
			//@RequestParam(value="paid_at") Long paid_at	
			) throws ParseException{
		
		
		// = date.parse(request.getParameter("vbank_date"));
		if(pay_type == "가상계좌"){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyy-mm-dd hh:mm:ss");
			java.util.Date date = new java.util.Date();	
			date = sdf.parse(request.getParameter("vbank_date"));
			java.sql.Date sDate = new java.sql.Date(date.getTime());
			
			ticket.setVbank_num(request.getParameter("vbank_num"));
			ticket.setVbank_name(request.getParameter("vbank_name"));
			ticket.setVbank_holder(request.getParameter("vbank_holder"));
			ticket.setVbank_date(sDate);
		}
		
		ticket.setNo(no);
		ticket.setUser_id(user_id);
		ticket.setTicket_date(ticket_date);
		ticket.setTicket_count(ticket_count);
		ticket.setPay_type(pay_type);
		ticket.setPrice(price);
		ticket.setState(state);
		ticket.setImport_uid(import_uid);		
		
		System.out.println("ticket : " + ticket);
		//System.out.println("paid_at : " + paid_at);
		/*SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");		
		java.util.Date date = new java.util.Date();
		//date.setTime(paid_at * 1000);
		java.sql.Date sDate = new java.sql.Date(date.getTime());
		ticket.setPay_date(sDate);*/
		//System.out.println(sdf.parse(sDate));
		
		
		//ticket.setPay_date(sDate);
		
		
		int result = tService.insertTicket(ticket);
		if(result > 0){
			ticket = tService.selectTicket(ticket);
		}
		
		mv.addObject("festival", tService.selectFestival(ticket.getNo()));
		mv.addObject("ticket", ticket);
		mv.setViewName("ticket/ticketCompleteView");
		
		return mv;
	}
}
