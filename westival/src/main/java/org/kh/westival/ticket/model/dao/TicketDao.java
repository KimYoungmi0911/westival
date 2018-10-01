package org.kh.westival.ticket.model.dao;

import java.util.Map;

import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.member.model.vo.Member;
import org.kh.westival.ticket.model.vo.Ticket;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("ticketDao")
public class TicketDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	//예매번호 생성
	public int insertTicket(Ticket ticket) {
		System.out.println("생성왜안?");
		return sqlSession.insert("insertTicket", ticket);
	}
	
	//결제시 사용할 축제정보
	public Festival selectFestival(int no) {
		return (Festival)sqlSession.selectOne("selectFestival", no);
	}

	//결제시 사용할 회원정보
	public Member selectMember(String user_id) {
		return (Member)sqlSession.selectOne("selectMember", user_id);
	}
	
	//결제시 사용할 예매정보
	public Ticket selectTicket(Ticket ticket) {
		return (Ticket)sqlSession.selectOne("selectTicket", ticket);
	}
	
	/*//결제완료시
	public int updateTicket(Ticket ticket) {
		return sqlSession.update("updateTicket", ticket);
	}
	
	//예매완료에서 사용할 예매정보
	public Ticket selectTicketComplete(String ticket_no) {
		return (Ticket)sqlSession.selectOne("selectTicketComplete", ticket_no);
	}*/

}
