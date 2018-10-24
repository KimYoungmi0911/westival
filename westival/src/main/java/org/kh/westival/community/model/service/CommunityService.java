package org.kh.westival.community.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.kh.westival.community.model.vo.Community;
import org.kh.westival.community.model.vo.CommunityPaging;
import org.kh.westival.community.model.vo.CommunityReply;
import org.kh.westival.festival.model.vo.Festival;

public interface CommunityService {

	int getListCount();

	ArrayList<Community> selectCommunityList(CommunityPaging communityPaging);

	Community selectCommunity(int community_no);

	int getFilterListCount(Map map);

	ArrayList<Community> selectFilterList(Map map);

	ArrayList<Festival> selectFestivalNameList();

	int insertCommunity(Community community);

	int updateCommunityReadCount(int community_no);

	Festival selectFestivalImage(int community_no);

	int insertCommunityReply(CommunityReply communityReply);

	ArrayList<CommunityReply> selectCommunityReplyList(int no);

	int selectCommunityReplyCount(int community_no);

	int deleteCommunity(int community_no);

	int updateCommunity(Community community);

	int deleteCommunityReply(int comment_no);

	int updateCommunityReply(CommunityReply reply);

}
