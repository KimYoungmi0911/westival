package org.kh.westival.ticket.controller;

import java.sql.Date;

import org.kh.westival.ticket.model.service.TicketService;
import org.kh.westival.ticket.model.vo.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("ticket")
public class TicketController {

	@Autowired
	private TicketService tService;

	@RequestMapping("ticketPage.do")
	public String ticketViewMethod() {
		return "/ticket/ticketView";
	}

	// 예매하기 메소드 호출시
	// no, user_id, ticket_date, ticket_count, price 받아옴
	@RequestMapping(value = "ticketing.do")
	public ModelAndView ticketing(ModelAndView mv, Ticket ticket, @RequestParam(value = "user_id") String user_id,
			@RequestParam(value = "no") int no, @RequestParam(value = "ticket_date") Date ticket_date,
			@RequestParam(value = "ticket_count") int ticket_count, @RequestParam(value = "price") int price) {

		ticket.setUser_id(user_id);
		ticket.setNo(no);
		ticket.setTicket_date(ticket_date);
		ticket.setTicket_count(ticket_count);
		ticket.setPrice(price);

		mv.addObject("member", tService.selectMember(user_id));
		mv.addObject("festival", tService.selectFestival(no));
		mv.addObject("ticket", ticket);
		mv.setViewName("ticket/ticketView");
		
		return mv;
	}

	// 결제 완료시
	@RequestMapping(value = "ticketComplete.do", method=RequestMethod.POST)
	public ModelAndView ticketComplete(ModelAndView mv, Ticket ticket, 
			@RequestParam(value="no") int no,
			@RequestParam(value="ticket_date") Date ticket_date,
			@RequestParam(value="ticket_count") int ticket_count,
			@RequestParam(value="price") int price,
			@RequestParam(value="user_id") String user_id,
			@RequestParam(value="pay_type") String pay_type,
			@RequestParam(value="state") String state, 
			@RequestParam(value="import_uid") String import_uid) {
		
		ticket.setNo(no);
		ticket.setUser_id(user_id);
		ticket.setTicket_date(ticket_date);
		ticket.setTicket_count(ticket_count);
		ticket.setPay_type(pay_type);
		ticket.setPrice(price);
		ticket.setState(state);
		ticket.setImport_uid(import_uid);
		
		int result = tService.insertTicket(ticket);
		if(result > 0)
			ticket = tService.selectTicket(ticket);
		
		mv.addObject("member", tService.selectMember(user_id));
		mv.addObject("festival", tService.selectFestival(no));
		mv.addObject("ticket", ticket);
		mv.setViewName("ticket/ticketCompleteView");
		
		return mv;
	}
}
