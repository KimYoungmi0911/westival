package org.kh.westival.community.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.kh.westival.community.model.dao.CommunityDao;
import org.kh.westival.community.model.vo.Community;
import org.kh.westival.community.model.vo.CommunityPaging;
import org.kh.westival.community.model.vo.CommunityReply;
import org.kh.westival.festival.model.vo.Festival;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	private CommunityDao communityDao;
	
	public CommunityServiceImpl (){}

	//전체조회 페이징
	@Override
	public int getListCount() {
		return communityDao.getListCount();
	}

	//전체조회
	@Override
	public ArrayList<Community> selectCommunityList(CommunityPaging communityPaging) {
		return communityDao.selectCommunityList(communityPaging);
	}

	//상세보기
	@Override
	public Community selectCommunity(int community_no) {
		return communityDao.selectCommunity(community_no);
	}

	//필터조회 페이징
	@Override
	public int getFilterListCount(Map map) {
		return communityDao.getFilterListCount(map);
	}

	//필터조회 리스트
	@Override
	public ArrayList<Community> selectFilterList(Map map) {
		return communityDao.selectFilterList(map);
	}

	//글쓰기용 축제 네임 리스트
	@Override
	public ArrayList<Festival> selectFestivalNameList() {
		return communityDao.selectFestivalNameList();
	}

	//글쓰기
	@Override
	public int insertCommunity(Community community) {
		return communityDao.insertCommunity(community);
	}

	//조회수 증가
	@Override
	public int updateCommunityReadCount(int community_no) {
		return communityDao.updateCommunityReadCount(community_no);
	}

	//상세보기 축제이미지
	@Override
	public Festival selectFestivalImage(int community_no) {
		return communityDao.selectFestivalImage(community_no);
	}

	//댓글등록
	@Override
	public int insertCommunityReply(CommunityReply communityReply) {
		return communityDao.insertCommunityReply(communityReply);
	}

	//댓글 목록 조회
	@Override
	public ArrayList<CommunityReply> selectCommunityReplyList(int no) {
		return communityDao.selectCommunityReplyList(no);
	}

	//댓글 카운팅
	@Override
	public int selectCommunityReplyCount(int community_no) {
		return communityDao.selectCommunityReplyCount(community_no);
	}

	//게시글 삭제
	@Override
	public int deleteCommunity(int community_no) {
		return communityDao.deleteCommunity(community_no);
	}

	//게시글 수정
	@Override
	public int updateCommunity(Community community) {
		return communityDao.updateCommunity(community);
	}

	//댓글삭제
	@Override
	public int deleteCommunityReply(int comment_no) {
		return communityDao.deleteCommunityReply(comment_no);
	}

	//댓글수정
	@Override
	public int updateCommunityReply(CommunityReply reply) {
		return communityDao.updateCommunityReply(reply);
	}
}
