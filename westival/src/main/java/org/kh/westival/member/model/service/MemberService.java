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

	int insertMember(Member member);
	
	// 아이디 비번찾기 10/25
	String searchId(Member member);
	int searchPwd(Member member);
	int changePwd(Member member);
	
	
	
	
	
	

	// 충섭
	// 회원정보 수정
	int updateMemberInfo(Member member);

	// 회원정보 삭제
	int deleteMemberInfo(String user_id);

	// 내 게시글 페스티벌 삭제여부 'Y'로 전환
	int updateMyList(ArrayList<Integer> list);

	// 내 게시글 페스티벌 전체 조회
	List<Festival> myTotalList(String user_id);

	// 내 게시글 페스티벌 날짜조회
	List<Festival> myListSearch(String start_date, String end_date, Member member);

	// 내 게시글 페스티벌 날짜조회 (1,3,6개월)
	List<Festival> myListSearchMonth(int month, Member member);

	// 관심축제 스크랩 삭제
	int deleteMyFesta(ArrayList<Integer> list);

	// 관심축제 전체 조회
	List<Festival> myLikeFestaList(String user_id);

	// 관심축제 페스티벌 날짜조회
	List<Festival> myLikeFestaSearch(String start_date, String end_date, Member member);

	// 관심축제 페스티벌 날짜조회(1,3,6개월)
	List<Festival> myLikeFestaSearchMonth(int month, Member member);

	// 내 예매내역 환불할 티켓 정보 조회
	Ticket myCurrentTicket(String ticket_no);

	// 내 에매내역 환불 처리
	int refundCurrentTicket(String ticket_no);

	// 내 예매내역 환불 사유 전송
	int updateRefundWhy(String ticket_no, String refund_why);

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
