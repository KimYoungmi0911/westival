package org.kh.westival.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.member.model.dao.MemberDao;
import org.kh.westival.member.model.vo.Member;
import org.kh.westival.ticket.model.vo.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	//병훈
	public MemberServiceImpl(){}

	@Override
	public Member loginCheck(Member member) {
		return memberDao.loginCheck(member);
	}
	 
	@Override
	public Member checkId(Member member) {
		return memberDao.checkId(member);
	}

	@Override
	public Member selectMember(Member member) {
		return memberDao.selectMember(member);
	}
	
	//충섭
	/*@Override
	public Member selectMember(Member member) {
		return memberDao.selectMember(member);
	}*/
	
	@Override
	public Member selectMemberInfo(String user_id) {
		return memberDao.selectMemberInfo(user_id);
	}

	@Override
	public int updateMemberInfo(Member member) {
		return memberDao.updateMemberInfo(member);
	}

	@Override
	public int deleteMemberInfo(String user_id) {
		return memberDao.deleteMemberInfo(user_id);
	}
	
	@Override
	public ArrayList<Festival> selectMyList(Member member) {
		return memberDao.selectMyList(member);
	}

	// 내 티켓 조회
	@Override
	public ArrayList<Ticket> recommendList(String user_id) {
		return (ArrayList<Ticket>) memberDao.recommendList(user_id);
	}
	// 축제명 갖고오기
	@Override
	public String selectFestivalName(int no) {
		return memberDao.selectFestivalName(no);
	}
	
	// 내 예매내역 티켓 날짜조회
	@Override
	public ArrayList<Ticket> myTicketSearch(String start_date, String end_date, Member member) {
		return (ArrayList<Ticket>) memberDao.myTicketSearch(start_date, end_date, member);
	}
	// 내 예매내역 티켓 날짜조회 (1,3,6개월)
	@Override
	public  ArrayList<Ticket> myTicketSearchMonth(int month, Member member) {
		return (ArrayList<Ticket>) memberDao.myTicketSearchMonth(month, member);
	}



}
