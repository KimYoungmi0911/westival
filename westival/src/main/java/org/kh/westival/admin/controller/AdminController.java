package org.kh.westival.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.kh.westival.admin.model.service.AdminService;
import org.kh.westival.admin.model.vo.Admin;
import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.ticket.model.vo.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
/*	@RequestMapping("adminticket.do")
	public ModelAndView selectList(ModelAndView mv){
		ArrayList<Ticket> list = adminService.selectList();
		
		mv.addObject("list", list);
	
		mv.setViewName("admin/ticketView");
		System.out.println("ticketView 컨트롤러");
		return mv;
	}*/
	@RequestMapping("adminticket.do")
	public ModelAndView selectList(ModelAndView mv, HttpServletRequest request){
		int currentPage = 1;
		int limit = 9;
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int listCount = adminService.ticketgetListCount();
		ArrayList<Ticket> list = adminService.ticketselectList(currentPage, limit);
		int maxPage = (int) Math.ceil(((double)listCount / limit));
		int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit -1;
		if(maxPage < endPage)
			endPage = maxPage;
		
		mv.addObject("list", list);
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("listCount", listCount);
	
		mv.setViewName("admin/ticketView");
		System.out.println("ticketView 컨트롤러");
		return mv;
	
	
	}
	
	@RequestMapping(name="search.do", method=RequestMethod.POST)
	public ModelAndView search(ModelAndView mv, @RequestParam("filter") String filter, @RequestParam("searchTF") String searchTF){
		
		ArrayList<Admin> list =  adminService.searchList(filter, searchTF);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("filter", filter);
		map.put("searchTF", searchTF);
		mv.addObject("map", map);
		mv.setViewName("admin/searchTicket");
		
		
		return mv;
		
	}
	
	@RequestMapping("adminfestival.do")
	public String adminfestival(){
		return "admin/festivalView";
	}
	
	@RequestMapping(value="allchk.do", method=RequestMethod.POST)
	public void allChk(HttpServletResponse response, HttpServletRequest request) throws IOException{
		int currentPage = 1;
		int limit = 9;
		
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		ArrayList<Festival> list = null;
		JSONObject json = null;
		JSONArray jarr = null;
		
		int listCount;
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = adminService.festivalgetListCount();
		list = adminService.festivalSelectList(currentPage, limit);
	    maxPage = (int) Math.ceil(((double)listCount / limit));
		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		endPage = startPage + limit -1;
		
		if(maxPage < endPage)
			endPage = maxPage;
		
		json = new JSONObject();
		jarr = new JSONArray();
		
		for(Festival f : list){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String strdate = sdf.format(f.getStart_date());
			JSONObject job = new JSONObject();
			job.put("fname", URLEncoder.encode(f.getName(), "UTF-8"));
			job.put("faddress", URLEncoder.encode(f.getAddress(), "UTF-8"));
			job.put("fstartdate", URLEncoder.encode(strdate, "UTF-8"));
			job.put("ftelephone", URLEncoder.encode(f.getTelephone(), "UTF-8"));
			job.put("fmanage", URLEncoder.encode(f.getManage(), "UTF-8"));
			job.put("freadcount", f.getRead_count());
			job.put("frecommend", f.getRecommend());
			job.put("fticket", f.getTicket());
			
		
			jarr.add(job);
			
			
		}
		json.put("list", jarr);
		json.put("currentPage", currentPage);
		json.put("maxPage", maxPage);
		json.put("startPage", startPage);
		json.put("endPage", endPage);
		json.put("listCount", listCount);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(json.toJSONString());
		out.flush();
		out.close();
		
		System.out.println("allChk 컨트롤러");
		
	}
	
	
	
}
