package org.kh.westival.member.model.dao;

import org.kh.westival.member.model.vo.Member;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Member loginCheck(Member member) {
		
		System.out.println(member + "1");
		return (Member) sqlSession.selectOne("memberMapper.loginCheck", member);
	}

}
