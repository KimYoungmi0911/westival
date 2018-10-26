package org.kh.westival.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.member.model.vo.Member;
import org.kh.westival.ticket.model.vo.Ticket;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 병훈
	public Member loginCheck(Member member) {
		return (Member) sqlSession.selectOne("memberMapper.loginCheck", member);
	}

	public Member selectMember(Member member) {
		return (Member) sqlSession.selectOne("memberMapper.selectMember", member);
	}

	public Member checkId(Member member) {
		return (Member) sqlSession.selectOne("memberMapper.checkId", member);
	}

	public int insertMember(Member member) {
		return sqlSession.insert("memberMapper.insertMember", member);
	}
	
	// 아이디,비번찾기 10/25
	public String searchId(Member member) {
		return (String) sqlSession.selectOne("memberMapper.searchId", member);
	}
	public int searchPwd(Member member) {
		return (int) sqlSession.selectOne("memberMapper.searchPwd", member);
	}
	public int changePwd(Member member) {
		return (int) sqlSession.update("memberMapper.changePwd", member);
	}
	
	
	
	
	
	

	// 충섭
	// 회원정보 수정
	public int updateMemberInfo(Member member) {
		return sqlSession.update("memberMapper.updateMemberInfo", member);
	}

	// 회원정보 삭제
	public int deleteMemberInfo(String user_id) {
		return sqlSession.delete("memberMapper.deleteMemberInfo", user_id);
	}

	// 내 게시글 페스티벌 삭제여부 'Y'로 전환
	public int updateMyList(ArrayList<Integer> list) {
		Map<String, ArrayList<Integer>> param = new HashMap<String, ArrayList<Integer>>();
		param.put("list", list);
		return (int) sqlSession.update("memberMapper.updateMyList", param);
	}

	// 내 게시글 페스티벌 전체 조회
	public ArrayList<Festival> MyTotalList(String user_id) {
		if (user_id != null)
			return (ArrayList<Festival>) sqlSession.selectList("memberMapper.myTotalList", user_id);
		else
			return (ArrayList<Festival>) sqlSession.selectList("memberMapper.myTotalListNonLogin");
	}

	// 내 게시글 페스티벌 날짜 조회
	public ArrayList<Festival> myListSearch(String start_date, String end_date, Member member) {
		Map<Object, Object> param = new HashMap<Object, Object>();
		param.put("start_date", start_date);
		param.put("end_date", end_date);
		String user_id = member.getUser_id();
		if (user_id != null) {
			param.put("user_id", user_id);
			return (ArrayList<Festival>) sqlSession.selectList("memberMapper.myListSearch", param);
		} else
			return (ArrayList<Festival>) sqlSession.selectList("memberMapper.myListSearchNonLogin", param);
	}

	// 내 게시글 페스티벌 날짜 조회(1,3,6개월)
	public ArrayList<Festival> myListSearchMonth(int month, Member member) {
		Map<Object, Object> param = new HashMap<Object, Object>();
		param.put("month", month * (-1));
		String user_id = member.getUser_id();
		if (user_id != null) {
			param.put("user_id", user_id);
			return (ArrayList<Festival>) sqlSession.selectList("memberMapper.myListSearchMonth", param);
		} else
			return (ArrayList<Festival>) sqlSession.selectList("memberMapper.myListSearchMonthNonLogin", param);
	}

	// 관심축제 스크랩 삭제
	public int deleteMyFesta(ArrayList<Integer> list) {
		Map<String, ArrayList<Integer>> param = new HashMap<String, ArrayList<Integer>>();
		param.put("list", list);
		return (int) sqlSession.delete("memberMapper.deleteMyFesta", param);
	}

	// 관심축제 페스티벌 전체 조회
	public ArrayList<Festival> MyLikeFestaList(String user_id) {
		if (user_id != null)
			return (ArrayList<Festival>) sqlSession.selectList("memberMapper.myLikeFestaList", user_id);
		else
			return (ArrayList<Festival>) sqlSession.selectList("memberMapper.myLikeFestaListNonLogin");
	}

	// 관심축제 페스티벌 날짜 조회
	public ArrayList<Festival> myLikeFestaSearch(String start_date, String end_date, Member member) {
		Map<Object, Object> param = new HashMap<Object, Object>();
		param.put("start_date", start_date);
		param.put("end_date", end_date);
		String user_id = member.getUser_id();
		if (user_id != null) {
			param.put("user_id", user_id);
			return (ArrayList<Festival>) sqlSession.selectList("memberMapper.myLikeFestaSearch", param);
		} else
			return (ArrayList<Festival>) sqlSession.selectList("memberMapper.myLikeFestaSearchNonLogin", param);
	}

	// 관심축제 페스티벌 날짜 조회(1,3,6개월)
	public ArrayList<Festival> myLikeFestaSearchMonth(int month, Member member) {
		Map<Object, Object> param = new HashMap<Object, Object>();
		param.put("month", month * (-1));
		String user_id = member.getUser_id();
		if (user_id != null) {
			param.put("user_id", user_id);
			return (ArrayList<Festival>) sqlSession.selectList("memberMapper.myLikeFestaSearchMonth", param);
		} else
			return (ArrayList<Festival>) sqlSession.selectList("memberMapper.myLikeFestaSearchMonthNonLogin", param);
	}

	// 내 예매내역 환불할 티켓 정보 조회
	public Ticket myCurrentTicket(String ticket_no) {
		return (Ticket) sqlSession.selectOne("memberMapper.myCurrentTicket", ticket_no);
	}

	// 내 예매내역 환불 처리
	public int refundCurrentTicket(String ticket_no) {
		return (int) sqlSession.update("memberMapper.refundCurrentTicket", ticket_no);
	}

	// 내 예매내역 환불 사유 전송
	public int updateRefundWhy(String ticket_no, String refund_why) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("ticket_no", ticket_no);
		param.put("refund_why", refund_why);
		return (int) sqlSession.update("memberMapper.updateRefundWhy", param);
	}

	// 경호
	// 내 티켓 조회
	public List<Ticket> recommendList(String user_id) {
		if (user_id != null)
			return (List<Ticket>) sqlSession.selectList("ticketMapper.recommendList", user_id);
		else
			return (List<Ticket>) sqlSession.selectList("ticketMapper.recommendListNonLogin");
	}

	// 축제명 갖고오기
	public String selectFestivalName(int no) {
		return (String) sqlSession.selectOne("festivalMapper.selectFestivalName", no);
	}

	// 내 예매내역 티켓 날짜조회
	public List<Ticket> myTicketSearch(String start_date, String end_date, Member member) {
		Map<Object, Object> param = new HashMap<Object, Object>();
		param.put("start_date", start_date);
		param.put("end_date", end_date);
		String user_id = member.getUser_id();
		if (user_id != null) {
			param.put("user_id", user_id);
			return (List<Ticket>) sqlSession.selectList("ticketMapper.myTicketSearch", param);
		} else
			return (List<Ticket>) sqlSession.selectList("ticketMapper.myTicketSearchNonLogin", param);
	}

	// 내 예매내역 티켓 날짜조회 (1,3,6개월)
	public List<Ticket> myTicketSearchMonth(int month, Member member) {
		Map<Object, Object> param = new HashMap<Object, Object>();
		param.put("month", month * (-1));
		String user_id = member.getUser_id();
		if (user_id != null) {
			param.put("user_id", user_id);
			return (List<Ticket>) sqlSession.selectList("ticketMapper.myTicketSearchMonth", param);
		} else
			return (List<Ticket>) sqlSession.selectList("ticketMapper.myTicketSearchMonthNonLogin", param);
	}
}
