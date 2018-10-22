package org.kh.westival.community.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.kh.westival.community.model.service.CommunityService;
import org.kh.westival.community.model.vo.Community;
import org.kh.westival.community.model.vo.CommunityPaging;
import org.kh.westival.community.model.vo.CommunityReply;
import org.kh.westival.festival.model.vo.Festival;
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
	@RequestMapping(value="commuPage.do")
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
		mv.setViewName("community/communityView");
		return mv;	
	}
	
	
	
	
	//필터조회
	@RequestMapping(value="commufilter.do", method=RequestMethod.POST)
	public void communityFilterList(
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{

		ArrayList<Community> filterList = new ArrayList<Community>();
		JSONArray jarr = new JSONArray();
		JSONObject job = new JSONObject();
		CommunityPaging communityPaging = new CommunityPaging();
		
		Map map = new HashMap();
		if(request.getParameter("category") != null)
			map.put("category", request.getParameter("category"));
		if(request.getParameter("search") != null)
			map.put("search", request.getParameter("search"));
		if(request.getParameter("keyword") != null)
			map.put("keyword", request.getParameter("keyword"));
		
		communityPaging.setCurrentPage(1);
		communityPaging.setLimit(10);
		
		if(request.getParameter("page") != null){
			communityPaging.setCurrentPage(Integer.parseInt(request.getParameter("page")));
		}
		
		communityPaging.setListCount(communityService.getFilterListCount(map));
		communityPaging.setStartRow((communityPaging.getCurrentPage() - 1) * communityPaging.getLimit() + 1);
		communityPaging.setEndRow(communityPaging.getStartRow() + communityPaging.getLimit() - 1);
	
		map.put("currentPage", communityPaging.getCurrentPage());
		map.put("limit", communityPaging.getLimit());
		map.put("listCount", communityPaging.getListCount());
		map.put("startRow", communityPaging.getStartRow());
		map.put("endRow", communityPaging.getEndRow());
		
		filterList = communityService.selectFilterList(map);
		
		communityPaging.setMaxPage((int) Math.ceil
				(((double)communityPaging.getListCount() / communityPaging.getLimit())));
		communityPaging.setStartPage((((int)((double)
				communityPaging.getCurrentPage() / communityPaging.getLimit() + 0.9)) - 1) 
				* communityPaging.getLimit() + 1);
		communityPaging.setEndPage(communityPaging.getStartPage() + communityPaging.getLimit() - 1);
		
		if(communityPaging.getMaxPage() < communityPaging.getEndPage()) {
			communityPaging.setEndPage(communityPaging.getMaxPage());
		}
		  
		for(Community c : filterList){
			JSONObject json = new JSONObject();
			json.put("community_no", c.getCommunity_no());
			json.put("no", c.getNo());
			json.put("user_id", c.getUser_id());
			json.put("category", URLEncoder.encode(c.getCategory(), "UTF-8"));
			json.put("title", URLEncoder.encode(c.getTitle(), "UTF-8"));
			json.put("content", URLEncoder.encode(c.getContent(), "UTF-8"));
			json.put("read_count", c.getRead_count());
			json.put("community_date", c.getCommunity_date().toString());
			json.put("user_count", c.getUser_count());
			
			if(json.size() > 0)
				jarr.add(json);
		}
		
		job.put("currentPage", communityPaging.getCurrentPage());
		job.put("startPage", communityPaging.getStartPage());
		job.put("endPage", communityPaging.getEndPage());
		job.put("list", jarr);
		//job.put("paging", communityPaging);
		
		System.out.println("list : " + job.toString());
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(job.toJSONString());
		out.flush();
		out.close();
	}
	
	//글쓰기 페이지 이동
	@RequestMapping("commuWriteForm.do")
	public ModelAndView communityWriteFormMethod(ModelAndView mv, ArrayList<Festival> list){
		list = communityService.selectFestivalNameList();
		
		mv.addObject("list", list);
		mv.setViewName("community/communityWriteView");
		
		return mv;
	}
	
	//글쓰기
	@RequestMapping(value="commuInsert.do", method=RequestMethod.POST)
	public String qnaInsertMethod(HttpServletRequest request){
		
		Community community = new Community();
		String result;
		
		if(request.getParameter("no") != null){
			System.out.println("not null");
			community.setNo(Integer.parseInt(request.getParameter("no")));	
			community.setUser_count(Integer.parseInt((String)request.getParameter("user_count")));
		}
		
		community.setUser_id(request.getParameter("user_id"));
		community.setCategory(request.getParameter("category"));
		community.setTitle(request.getParameter("title"));
		community.setContent(request.getParameter("content"));
		
		System.out.println("community : " + community);
		
		if(communityService.insertCommunity(community) > 0){
			System.out.println("성공");
			result = "redirect:/commuPage.do";
		}else{
			System.out.println("실패");
			result = "redirect:/commuWriteForm.do";
		}
		
		return result;
	}
	
	//상세보기
	@RequestMapping("commuDetail.do")
	public ModelAndView CommunityDetail(
			@RequestParam(value="community_no") int community_no, ModelAndView mv,
			HttpServletRequest request){

		if(request.getParameter("category") != null)
			mv.addObject("category", request.getParameter("category"));
		if(request.getParameter("search") != null)
		mv.addObject("search", request.getParameter("search"));
		if(request.getParameter("keyword") != null)
		mv.addObject("keyword", request.getParameter("keyword"));
		if(request.getParameter("page") != null)
		mv.addObject("page", request.getParameter("page"));
		
		//조회수 증가
		if(communityService.updateCommunityReadCount(community_no) > 0)
			System.out.println("조회수 증가 처리 성공");
		else
			System.out.println("조회수 증가 처리 실패");
		
		Community community = communityService.selectCommunity(community_no);
		
		mv.addObject("community", community);
		mv.addObject("festival", communityService.selectFestivalImage(community.getNo()));
		//mv.addObject("replyCount", communityService.selectCommunityReplyCount(community.getCommunity_no()));
		mv.setViewName("community/communityDetailView");
		return mv;
	}

	//댓글작성
	@RequestMapping(value="commuReplyInsert.do", method=RequestMethod.POST)
	public void QnaInsertReplyMethod(HttpServletRequest request, HttpServletResponse response) throws IOException{
		CommunityReply communityReply = new CommunityReply();
	
		communityReply.setUser_id(request.getParameter("user_id"));
		communityReply.setCommunity_no(Integer.parseInt((String)request.getParameter("community_no")));
		communityReply.setComment_content(request.getParameter("comment_content"));
		communityReply.setComment_level(Integer.parseInt((String)request.getParameter("comment_level")));
		//communityReply.setComment_seq(Integer.parseInt((String)request.getParameter("comment_seq")));
		//communityReply.setComment_ref(Integer.parseInt((String)request.getParameter("comment_ref")));
		
		System.out.println(communityReply);
		
		response.setContentType("text/html; charset=utf-8");	
		PrintWriter out = response.getWriter();
		if(communityService.insertCommunityReply(communityReply) > 0){
			out.append("ok");
		}else{
			out.append("fail");
		}
		
		out.close();
	}
	
	//댓글 목록 조회
	@RequestMapping(value="commuReplySelect.do", method=RequestMethod.POST)
	public void selectQnaReplyMethod(@RequestParam(value="no") int no, HttpServletResponse response) throws IOException{		
		ArrayList<CommunityReply> list = communityService.selectCommunityReplyList(no);
		
		System.out.println(list);
		
		JSONArray jarr = new JSONArray();
		
		for(CommunityReply communityReply : list){
			JSONObject juser = new JSONObject();
			juser.put("comment_no", communityReply.getComment_no());
			juser.put("user_id", communityReply.getUser_id());
			juser.put("community_no",communityReply.getCommunity_no());
			juser.put("comment_content",communityReply.getComment_content());
			juser.put("comment_level", communityReply.getComment_level());
			juser.put("comment_seq", communityReply.getComment_seq());
			juser.put("comment_date", communityReply.getComment_date().toString());
			juser.put("comment_ref", communityReply.getComment_ref());
			
			if(juser != null)
				jarr.add(juser);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		sendJson.put("no", no);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		System.out.println(sendJson);
		out.flush();
		out.close();
	}
	
	//게시글 수정페이지로 이동
	@RequestMapping(value="commuupdate.do", method=RequestMethod.POST)
	public ModelAndView updateCommunityMethod(ModelAndView mv, HttpServletRequest request){
		Community community = new Community();
		community.setCommunity_no(Integer.parseInt((String)request.getParameter("community_no")));
		community.setCategory(request.getParameter("category"));
		community.setTitle(request.getParameter("title"));
		community.setContent(request.getParameter("content"));
		community.setUser_count(Integer.parseInt((String)request.getParameter("user_count")));

		mv.addObject("community", community);
		mv.setViewName("community/communityWriteView");
		return mv;
	}
	
	//게시글 삭제
	@RequestMapping(value="commudelete.do", method=RequestMethod.POST)
	public void deleteCommunityMethod(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value="community_no") int community_no) throws IOException{
		System.out.println("delete commu NO : " + community_no);
		
		//int result = communityService.deleteCommunityReply(community_no);
		//if(result > 0)
		//	result = communityService.deleteCommunity(community_no);
		int result = communityService.deleteCommunity(community_no);

		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();
		out.close();
	}
}
