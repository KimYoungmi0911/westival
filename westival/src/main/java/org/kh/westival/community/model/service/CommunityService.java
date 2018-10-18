package org.kh.westival.community.model.service;

import java.util.ArrayList;

import org.kh.westival.community.model.vo.Community;
import org.kh.westival.community.model.vo.CommunityPaging;
import org.kh.westival.community.model.vo.CommunityReply;

public interface CommunityService {

	int getListCount();

	ArrayList<Community> selectCommunityList(CommunityPaging communityPaging);

	Community selectCommunity(int community_no);

	CommunityReply selectCommunityReply(int community_no);

}
