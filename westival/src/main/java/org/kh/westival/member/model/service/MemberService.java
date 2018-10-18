package org.kh.westival.member.model.service;

import java.util.ArrayList;

import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.member.model.vo.Member;

public interface MemberService {

	//병훈
	Member loginCheck(Member member);

	Member selectMember(Member member);

	Member checkId(Member member);

	//충섭
	Member selectMemberInfo(String user_id);
	int updateMemberInfo(Member member);
	int deleteMemberInfo(String user_id);
	ArrayList<Festival> selectMyList(Member member);
	int deleteMyList(Member member);

}
