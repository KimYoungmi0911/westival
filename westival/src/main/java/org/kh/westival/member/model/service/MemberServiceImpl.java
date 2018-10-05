package org.kh.westival.member.model.service;

import org.kh.westival.member.model.dao.MemberDao;
import org.kh.westival.member.model.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	public MemberServiceImpl(){}

	@Override
	public Member loginCheck(Member member) {
		return memberDao.loginCheck(member);
	}
	
	

}
