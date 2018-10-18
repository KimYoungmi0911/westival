package org.kh.westival.community.model.dao;

import java.util.ArrayList;

import org.kh.westival.community.model.vo.Community;
import org.kh.westival.community.model.vo.CommunityPaging;
import org.kh.westival.community.model.vo.CommunityReply;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("communityuDao")
public class CommunityDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		return (int) sqlSession.selectOne("communityMapper.selectCount");
	}

	public ArrayList<Community> selectCommunityList(CommunityPaging communityPaging) {
		return (ArrayList)sqlSession.selectList("communityMapper.selectCommunityList", communityPaging);
	}

	public Community selectCommunity(int community_no) {
		return (Community) sqlSession.selectOne("communityMapper.selectCommunity", community_no);
	}

	public CommunityReply selectCommunityReply(int community_no) {
		return (CommunityReply) sqlSession.selectOne("communityMapper.selectCommunityReply", community_no);
	}

}
