package org.kh.westival.member.model.service;

import java.util.ArrayList;

import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.member.model.dao.MemberDao;
import org.kh.westival.member.model.vo.Member;
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

	@Override
	public int deleteMyList(Member member) {
		return memberDao.deleteMyList(member);
	}

}
