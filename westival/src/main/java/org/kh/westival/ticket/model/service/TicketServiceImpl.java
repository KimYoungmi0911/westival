package org.kh.westival.ticket.model.service;

import java.util.Map;

import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.festival.model.vo.TicketOption;
import org.kh.westival.member.model.vo.Member;
import org.kh.westival.ticket.model.dao.TicketDao;
import org.kh.westival.ticket.model.vo.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ticketService")
public class TicketServiceImpl implements TicketService {

	@Autowired
	private TicketDao tDao;

	public TicketServiceImpl() {
	}

	// 결제시 사용할 축제정보
	@Override
	public Festival selectFestival(int no) {
		return tDao.selectFestival(no);
	}

	// 결제시 사용할 회원정보
	@Override
	public Member selectMember(String user_id) {
		return tDao.selectMember(user_id);
	}

	// 결제시 사용할 티켓정보
	@Override
	public TicketOption selectTicketOption(int no) {
		return tDao.selectTicketOption(no);
	}

	// 결제완료시 예매정보 등록
	@Override
	public int insertTicket(Ticket ticket) {
		return tDao.insertTicket(ticket);
	}

	// 결제완료시 사용할 예매정보
	@Override
	public Ticket selectTicket(Ticket ticket) {
		return tDao.selectTicket(ticket);
	}

}
