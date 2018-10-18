package org.kh.westival.community.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.kh.westival.community.model.service.CommunityService;
import org.kh.westival.community.model.vo.Community;
import org.kh.westival.community.model.vo.CommunityPaging;
import org.kh.westival.community.model.vo.CommunityReply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService communityService;

	//커뮤니티 게시판 호출시
	@RequestMapping(value="commuPage.do", method=RequestMethod.POST)
	public ModelAndView commnunityForwordMethod(ModelAndView mv, 
			CommunityPaging communityPaging, 
			HttpServletRequest request,
			ArrayList<Community> list){
		
		communityPaging.setCurrentPage(1);
		communityPaging.setLimit(10);
		
		if(request.getParameter("page") != null){
			communityPaging.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		
		communityPaging.setListCount(communityService.getListCount());
		communityPaging.setStartRow((communityPaging.getCurrentPage() - 1) * communityPaging.getLimit() + 1);
		communityPaging.setEndRow(communityPaging.getStartRow() + communityPaging.getLimit() - 1);
		
		list = communityService.selectCommunityList(communityPaging);
		
		communityPaging.setMaxPage((int) Math.ceil
				(((double)communityPaging.getListCount() / communityPaging.getLimit())));
		communityPaging.setStartPage((((int)((double)
				communityPaging.getCurrentPage() / communityPaging.getLimit() + 0.9)) - 1) 
				* communityPaging.getLimit() + 1);
		communityPaging.setEndPage(communityPaging.getStartPage() + communityPaging.getLimit() - 1);
		
		if(communityPaging.getMaxPage() < communityPaging.getEndPage()) {
			communityPaging.setEndPage(communityPaging.getMaxPage());
		}
		
		mv.addObject("paging", communityPaging);
		mv.addObject("list", list);
		mv.setViewName("community/commnunityView");
		return mv;	
	}
	
	
	//게시글 상세보기
	@RequestMapping(value="commuDetail.do", method=RequestMethod.POST)
	public ModelAndView communityDetailMethod(ModelAndView mv, 
			Community community, CommunityReply communityReply,
			@RequestParam(value="community_no") int community_no){
		
		community = communityService.selectCommunity(community_no);
		communityReply = communityService.selectCommunityReply(community_no);
		
		mv.addObject("communityReply", communityReply);
		mv.addObject("community", community);
		mv.setViewName("community/communityDetailView");
		
		return mv;
	}
	
	//필터조회
	public ModelAndView communityFilterList(ModelAndView mv, 
			ArrayList<Community> filterlist,
			@RequestParam(value="filter") String filter, 
			@RequestParam(value="value") String value,
			Map<String, String> map){
		
		map.put("filter", value);
		map.put("value", value);
		
		//communityService.selectFilterList(map);
		
		mv.addObject("filterList", filterlist);
		mv.setViewName("community/commnunityView");
		
		return mv;
	}

}
