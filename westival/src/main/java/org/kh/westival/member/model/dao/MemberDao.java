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
	
	
	// 충섭
	public Member selectMemberInfo(String user_id) {
		return (Member) sqlSession.selectOne("memberMapper.selectMemberInfo", user_id);
	}

	public int updateMemberInfo(Member member) {
		return sqlSession.update("memberMapper.updateMemberInfo", member);
	}

	public int deleteMemberInfo(String user_id) {
		return sqlSession.delete("memberMapper.deleteMemberInfo", user_id);
	}

	public ArrayList<Festival> selectMyList(Member member) {
		return (ArrayList<Festival>) sqlSession.selectList("memberMapper.selectMemberTicketInfo", member);
	}

	public int deleteMyList(Member member) {
		return sqlSession.delete("memberMapper.deleteMyList", member);
	}

	// 경호
	// 내 티켓 조회
	public List<Ticket> recommendList(String user_id) {
		return (List<Ticket>) sqlSession.selectList("ticketMapper.recommendList", user_id);
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
		param.put("user_id", member.getUser_id());
		return (List<Ticket>) sqlSession.selectList("ticketMapper.myTicketSearch", param);
	}

	// 내 예매내역 티켓 날짜조회 (1,3,6개월)
	public List<Ticket> myTicketSearchMonth(int month, Member member) {
		Map<Object, Object> param = new HashMap<Object, Object>();
		param.put("user_id", member.getUser_id());
		param.put("month", month * (-1));
		return (List<Ticket>) sqlSession.selectList("ticketMapper.myTicketSearchMonth", param);
	}



}
