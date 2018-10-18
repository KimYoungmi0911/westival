package org.kh.westival.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.member.model.vo.Member;
import org.kh.westival.ticket.model.vo.Ticket;

public interface MemberService {

	// 병훈
	Member loginCheck(Member member);

	Member selectMember(Member member);

	Member checkId(Member member);

	// 충섭
	Member selectMemberInfo(String user_id);

	int updateMemberInfo(Member member);

	int deleteMemberInfo(String user_id);

	ArrayList<Festival> selectMyList(Member member);

	int deleteMyList(Member member);

	// 경호
	// 마이페이지 내 예매내역
	List<Ticket> recommendList(String user_id);

	// 축제명 갖고오기
	String selectFestivalName(int no);

	// 내 예매내역 티켓 날짜조회
	List<Ticket> myTicketSearch(String start_date, String end_date, Member member);

	// 내 예매내역 티켓 날짜조회 (1,3,6개월)
	List<Ticket> myTicketSearchMonth(int month, Member member);

}
