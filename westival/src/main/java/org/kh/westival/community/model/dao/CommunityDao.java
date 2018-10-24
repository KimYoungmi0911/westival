package org.kh.westival.community.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.kh.westival.community.model.vo.Community;
import org.kh.westival.community.model.vo.CommunityPaging;
import org.kh.westival.community.model.vo.CommunityReply;
import org.kh.westival.festival.model.vo.Festival;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("communityuDao")
public class CommunityDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//전체조회 페이징
	public int getListCount() {
		return (int) sqlSession.selectOne("communityMapper.selectCount");
	}

	//전체조회
	public ArrayList<Community> selectCommunityList(CommunityPaging communityPaging) {
		return (ArrayList)sqlSession.selectList("communityMapper.selectCommunityList", communityPaging);
	}

	//상세보기
	public Community selectCommunity(int community_no) {
		return (Community) sqlSession.selectOne("communityMapper.selectCommunity", community_no);
	}

	//필터조회 페이징
	public int getFilterListCount(Map map) {
		return (int) sqlSession.selectOne("communityMapper.selectFilterCount", map);
	}

	//필터조회 리스트
	public ArrayList<Community> selectFilterList(Map map) {
		return (ArrayList<Community>) sqlSession.selectList("communityMapper.selectFilterList", map);
	}

	//글쓰기용 축제명 리스트
	public ArrayList<Festival> selectFestivalNameList() {
		return (ArrayList<Festival>) sqlSession.selectList("communityMapper.selectFestivalNameList");
	}

	//글쓰기
	public int insertCommunity(Community community) {
		return sqlSession.insert("communityMapper.insertCommunity", community);
	}

	//조회수 처리용
	public int updateCommunityReadCount(int community_no) {
		return sqlSession.update("communityMapper.updateCommunityReadCount", community_no);
	}

	//상세보기 축제이미지
	public Festival selectFestivalImage(int community_no) {
		return (Festival) sqlSession.selectOne("communityMapper.selectFestivalImage", community_no);
	}

	//댓글등록
	public int insertCommunityReply(CommunityReply communityReply) {
		return sqlSession.insert("communityMapper.insertCommunityReply", communityReply);
	}

	//댓글목록조회
	public ArrayList<CommunityReply> selectCommunityReplyList(int no) {
		return (ArrayList<CommunityReply>) sqlSession.selectList("communityMapper.selectCommunityReplyList", no);
	}

	public int selectCommunityReplyCount(int community_no) {
		return (int) sqlSession.selectOne("communityMapper.selectCommunityReplyCount", community_no);
	}

	//게시글 삭제
	public int deleteCommunity(int community_no) {
		return sqlSession.delete("communityMapper.deleteCommunity", community_no);
	}

	//게시글 수정
	public int updateCommunity(Community community) {
		return sqlSession.update("communityMapper.updateCommunity", community);
	}

	//댓글 삭제
	public int deleteCommunityReply(int comment_no) {
		return sqlSession.delete("communityMapper.deleteCommunityReply", comment_no);
	}

	//댓글 수정
	public int updateCommunityReply(CommunityReply reply) {
		return sqlSession.update("communityMapper.updateCommunityReply", reply);
	}

}
