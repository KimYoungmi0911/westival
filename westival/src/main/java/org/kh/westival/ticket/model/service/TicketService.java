package org.kh.westival.ticket.model.service;

import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.member.model.vo.Member;
import org.kh.westival.ticket.model.vo.Ticket;


public interface TicketService {

	int insertTicket(Ticket ticket);
	
	Festival selectFestival(int no);

	Member selectMember(String user_id);
	
	Ticket selectTicket(Ticket ticket);
	

}
