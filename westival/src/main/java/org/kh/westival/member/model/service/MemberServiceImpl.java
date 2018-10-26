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

	// 병훈
	public MemberServiceImpl() {
	}

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

	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}
	
	// 아이디 비번찾기 10/25
	@Override
	public String searchId(Member member) {
		return memberDao.searchId(member);
	}
	@Override
	public int searchPwd(Member member) {
		return memberDao.searchPwd(member);
	}
	@Override
	public int changePwd(Member member) {
		return memberDao.changePwd(member);
	}
	
	
	
	
	
	
	
	

	// 충섭
	// 회원정보 수정
	@Override
	public int updateMemberInfo(Member member) {
		return memberDao.updateMemberInfo(member);
	}

	// 회원정보 삭제
	@Override
	public int deleteMemberInfo(String user_id) {
		return memberDao.deleteMemberInfo(user_id);
	}

	// 내 게시글 페스티벌 삭제여부 'Y'로 전환
	@Override
	public int updateMyList(ArrayList<Integer> list) {
		return memberDao.updateMyList(list);
	}

	// 내 게시글 페스티벌 전체 조회
	@Override
	public List<Festival> myTotalList(String user_id) {
		return (ArrayList<Festival>) memberDao.MyTotalList(user_id);
	}

	// 내 게시글 페스티벌 날짜 검색
	@Override
	public List<Festival> myListSearch(String start_date, String end_date, Member member) {
		return (ArrayList<Festival>) memberDao.myListSearch(start_date, end_date, member);
	}

	// 내 게시글 페스티벌 날짜 검색(1,3,6개월)
	@Override
	public List<Festival> myListSearchMonth(int month, Member member) {
		return (ArrayList<Festival>) memberDao.myListSearchMonth(month, member);
	}

	// 관심축제 스크랩 삭제
	@Override
	public int deleteMyFesta(ArrayList<Integer> list) {
		return memberDao.deleteMyFesta(list);
	}

	// 관심축제 페스티벌 전체 조회
	@Override
	public List<Festival> myLikeFestaList(String user_id) {
		return (ArrayList<Festival>) memberDao.MyLikeFestaList(user_id);
	}

	// 관심축제 페스티벌 날짜 조회
	@Override
	public List<Festival> myLikeFestaSearch(String start_date, String end_date, Member member) {
		return (ArrayList<Festival>) memberDao.myLikeFestaSearch(start_date, end_date, member);
	}

	// 관심축제 페스티벌 날짜 조회(1,3,6개월)
	@Override
	public List<Festival> myLikeFestaSearchMonth(int month, Member member) {
		return (ArrayList<Festival>) memberDao.myLikeFestaSearchMonth(month, member);
	}

	// 내 예매내역 환불할 티켓 정보 조회
	@Override
	public Ticket myCurrentTicket(String ticket_no) {
		return memberDao.myCurrentTicket(ticket_no);
	}

	// 내 예매내역 환불 처리
	@Override
	public int refundCurrentTicket(String ticket_no) {
		return memberDao.refundCurrentTicket(ticket_no);
	}

	// 내 예매내역 환불 사유 전송
	@Override
	public int updateRefundWhy(String ticket_no, String refund_why) {
		return memberDao.updateRefundWhy(ticket_no, refund_why);
	}

	// 경호
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
	public ArrayList<Ticket> myTicketSearchMonth(int month, Member member) {
		return (ArrayList<Ticket>) memberDao.myTicketSearchMonth(month, member);
	}

}
