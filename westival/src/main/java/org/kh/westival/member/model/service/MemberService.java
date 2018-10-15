package org.kh.westival.member.model.service;

import org.kh.westival.member.model.vo.Member;

public interface MemberService {

	//병훈
	Member loginCheck(Member member);

	Member selectMember(Member member);

	Member checkId(Member member);

	//충섭
	//Member selectMember(Member member);
	Member selectMemberInfo(String user_id);
	int updateMemberInfo(Member member);
	int deleteMemberInfo(String user_id);

}
