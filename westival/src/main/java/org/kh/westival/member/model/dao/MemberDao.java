package org.kh.westival.member.model.dao;

import org.kh.westival.member.model.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//병훈
	public Member loginCheck(Member member) {
		
		System.out.println(member);
		return (Member) sqlSession.selectOne("memberMapper.loginCheck", member);
	}

	public Member selectMember(Member member) {
		return (Member) sqlSession.selectOne("memberMapper.selectMember", member);
	}
	
	public Member checkId(Member member){
		return (Member) sqlSession.selectOne("memberMapper.checkId", member);
	}
	 
	//충섭
	public Member selectMemberInfo(String user_id) {
		return (Member)sqlSession.selectOne("memberMapper.selectMemberInfo", user_id);
	}

	public int updateMemberInfo(Member member) {
		return sqlSession.update("memberMapper.updateMemberInfo", member);
	}

	public int deleteMemberInfo(String user_id) {
		return sqlSession.delete("memberMapper.deleteMemberInfo", user_id);
	}   

}
