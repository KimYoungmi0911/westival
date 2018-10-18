package org.kh.westival.community.model.service;

import java.util.ArrayList;

import org.kh.westival.community.model.dao.CommunityDao;
import org.kh.westival.community.model.vo.Community;
import org.kh.westival.community.model.vo.CommunityPaging;
import org.kh.westival.community.model.vo.CommunityReply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("communityService")
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	private CommunityDao communityDao;
	
	public CommunityServiceImpl (){}

	@Override
	public int getListCount() {
		return communityDao.getListCount();
	}

	@Override
	public ArrayList<Community> selectCommunityList(CommunityPaging communityPaging) {
		return communityDao.selectCommunityList(communityPaging);
	}

	@Override
	public Community selectCommunity(int community_no) {
		return communityDao.selectCommunity(community_no);
	}

	@Override
	public CommunityReply selectCommunityReply(int community_no) {
		return communityDao.selectCommunityReply(community_no);
	}
}
