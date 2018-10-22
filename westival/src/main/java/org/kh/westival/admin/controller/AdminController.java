package org.kh.westival.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
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
import org.kh.westival.member.model.vo.Member;
import org.kh.westival.ticket.model.vo.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	//----------------------------------------------------------
	//예매관리페이지
	@RequestMapping("adminticket.do")
	public ModelAndView selectList(ModelAndView mv, HttpServletRequest request){
		int currentPage = 1;
		int limit = 10;
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
	@RequestMapping(value="tpage.do", method=RequestMethod.POST)
	public void ticketList(HttpServletRequest request, HttpServletResponse response) throws IOException{
		JSONObject json = null;
		
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int limit = 10;
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int listCount = adminService.tGetListCount();
		ArrayList<Admin> list = adminService.tAllSelectList(currentPage, limit);
		
		int maxPage = (int) Math.ceil(((double)listCount/limit));
		int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if(maxPage < endPage){
			endPage = maxPage;
		}
		json = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Admin a : list){
			JSONObject job = new JSONObject();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String strdate = sdf.format(a.getTicket_date());
			
			job.put("tusername", URLEncoder.encode(a.getUser_name(), "UTF-8"));
			job.put("tid", URLEncoder.encode(a.getUser_id(), "UTF-8"));
			job.put("tname", URLEncoder.encode(a.getName(), "UTF-8"));
			job.put("tno", URLEncoder.encode(a.getTicket_no(), "UTF-8"));
			job.put("tdate", URLEncoder.encode(strdate, "UTF-8"));
			job.put("tprice", a.getPrice());
			job.put("tcount", a.getTicket_count());
			job.put("tptype", URLEncoder.encode(a.getPay_type(), "UTF-8"));
			job.put("tstate", URLEncoder.encode(a.getState(), "UTF-8"));
			job.put("tano", URLEncoder.encode(a.getAccount_no(), "UTF-8"));
			
			jarr.add(job);
		}
		
		json.put("list", jarr);
		json.put("currentPage", currentPage);
		json.put("maxPage", maxPage);
		json.put("startPage", startPage);
		json.put("endPage", endPage);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(json.toJSONString());
		out.flush();
		out.close();
		
		
		
		
	}
	
	
	
	
	
	@RequestMapping(value="tselectbtn.do", method=RequestMethod.POST)
	public void tSelectBtn(HttpServletResponse response, HttpServletRequest request,
			@RequestParam("filter") String filter, 
			@RequestParam("searchTF") String searchTF) throws IOException{
		
		System.out.println("mSelectBtn 컨트롤러");
		HashMap map = new HashMap();
		map.put("filter", filter);
		map.put("searchTF", searchTF);
		
		int listCount = adminService.tGetSelectListCount(map);
		int currentPage = 1;
		int limit = 10;
		System.out.println("listCount: " + listCount);
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		int maxPage = (int)Math.ceil((double)listCount / limit + 0.9);
		System.out.println("maxPage : " + maxPage);
		int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		
		int endPage = startPage + limit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		ArrayList<Admin> list = adminService.tSelectList(currentPage, limit, filter, searchTF);
		JSONArray jarr = new JSONArray();
		for(Admin a : list){
			JSONObject job = new JSONObject();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String strdate = sdf.format(a.getTicket_date());
			
			job.put("tusername", URLEncoder.encode(a.getUser_name(), "UTF-8"));
			job.put("tid", URLEncoder.encode(a.getUser_id(), "UTF-8"));
			job.put("tname", URLEncoder.encode(a.getName(), "UTF-8"));
			job.put("tno", URLEncoder.encode(a.getTicket_no(), "UTF-8"));
			job.put("tdate", URLEncoder.encode(strdate, "UTF-8"));
			job.put("tprice", a.getPrice());
			job.put("tcount", a.getTicket_count());
			job.put("tptype", URLEncoder.encode(a.getPay_type(), "UTF-8"));
			job.put("tstate", URLEncoder.encode(a.getState(), "UTF-8"));
			job.put("tano", URLEncoder.encode(a.getAccount_no(), "UTF-8"));
			
			jarr.add(job);
	}
		JSONObject json = new JSONObject();
		json.put("list", jarr);
		json.put("currentPage", currentPage);
		json.put("maxPage", maxPage);
		json.put("startPage", startPage);
		json.put("endPage", endPage);
		json.put("filter", filter);
		json.put("searchTF", searchTF);
		json.put("listCount", listCount);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(json.toJSONString());
		System.out.println(json);
		out.flush();
		out.close();
	}
	//------------------------------------------------------------------------------
	//축제관리페이지
	@RequestMapping("adminfestival.do")
	public String adminfestival(){
		return "admin/festivalView";
	}
	
	
	
	@RequestMapping("fpage.do")
	public void festivalList(HttpServletResponse response, HttpServletRequest request) throws IOException{
		JSONObject json = null;
		
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int limit = 10;
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		int listCount =  adminService.fGetListCount();
		ArrayList<Festival> list = adminService.fAllSelectList(currentPage, limit);
		
		int maxPage = (int) Math.ceil(((double)listCount / limit));
		
		int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		
		int endPage = startPage + limit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		json = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Festival f : list){
			JSONObject job = new JSONObject();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String strdate = sdf.format(f.getStart_date());
		
			job.put("fname", URLEncoder.encode(f.getName(), "UTF-8"));
			job.put("faddress", URLEncoder.encode(f.getAddress(), "UTF-8"));
			job.put("fstart", URLEncoder.encode(strdate, "UTF-8"));
			job.put("ftelephone", URLEncoder.encode(f.getTelephone(), "UTF-8"));
			job.put("fmanage", URLEncoder.encode(f.getManage(), "UTF-8"));
			job.put("freadcount", f.getRead_count());
			job.put("frecommend", f.getRecommend());
			job.put("fticket", URLEncoder.encode(f.getTicket(), "UTF-8"));
			
			jarr.add(job);
		}
		System.out.println("jarr : " + jarr.toJSONString());
		json.put("list", jarr);
		json.put("currentPage", currentPage);
		json.put("maxPage", maxPage);
		json.put("startPage", startPage);
		json.put("endPage", endPage);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(json.toJSONString());
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="selectbtn.do", method=RequestMethod.POST)
	public void selectbtn(HttpServletResponse response, HttpServletRequest request) throws IOException{
		System.out.println("selectBtn 컨트롤러");
		JSONObject json = null;
		
		int currentPage = Integer.parseInt(request.getParameter("page"));
		String filter = request.getParameter("filter");
		String searchTF = "";
		
		int limit = 10;
		
		if(request.getParameter("searchTF") != null){
			searchTF = request.getParameter("searchTF");
		}
		
		int listCount = adminService.fGetSelectListCount(filter, searchTF);
		ArrayList<Festival> list = adminService.festivalSelectList(currentPage, limit, filter, searchTF);
		
		int maxPage = (int) Math.ceil(((double)listCount / limit));
		
		int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		
		int endPage = startPage + limit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		json = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Festival f : list){
			JSONObject job = new JSONObject();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String strdate = sdf.format(f.getStart_date());
			
			job.put("fname", URLEncoder.encode(f.getName(), "UTF-8"));
			job.put("faddress", URLEncoder.encode(f.getAddress(), "UTF-8"));
			job.put("fstart", URLEncoder.encode(strdate, "UTF-8"));
			job.put("ftelephone", URLEncoder.encode(f.getTelephone(), "UTF-8"));
			job.put("fmanage", URLEncoder.encode(f.getManage(), "UTF-8"));
			job.put("freadcount", f.getRead_count());
			job.put("frecommend", f.getRecommend());
			job.put("fticket", URLEncoder.encode(f.getTicket(), "UTF-8"));
			
			jarr.add(job);
			
		}
		json.put("list", jarr);
		
		json.put("currentPage", currentPage);
		json.put("maxPage", maxPage);
		json.put("startPage", startPage);
		json.put("endPage", endPage);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(json.toJSONString());
		out.flush();
		out.close();
	}
	
//---------------------------------------------------------------------	
//회원관리 페이지
	
	@RequestMapping("adminmember.do")
	public String adminMemberView(){
		return "admin/memberView";
	}
	/*@RequestMapping("adminmember.do")
	public ModelAndView adminMemberView(ModelAndView mv, HttpServletRequest request){
		int currentPage = 1;
		int limit=10;
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int listCount = adminService.getListCount();
		ArrayList<Member> list = adminService.selectList(currentPage, limit);
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
		mv.setViewName("admin/memberView");
		System.out.println("adminMemverView 컨트롤러");
		
		return mv;
	}*/
	
	@RequestMapping("mpage.do")
	public void memberList(HttpServletRequest request, HttpServletResponse response) throws IOException{
		JSONObject json = null;
		
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int limit = 10;
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		int listCount = adminService.mGetListCount();
		ArrayList<Member> list = adminService.mAllSelectList(currentPage, limit);
		
		int maxPage = (int) Math.ceil(((double)listCount/limit));
		int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if(maxPage < endPage){
			endPage = maxPage;
		}
		json = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Member m : list){
			JSONObject job = new JSONObject();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String strdate = sdf.format(m.getUser_birth());
			
			job.put("mid", URLEncoder.encode(m.getUser_id(), "UTF-8"));
			job.put("mname", URLEncoder.encode(m.getUser_name(), "UTF-8"));
			job.put("mbirth", URLEncoder.encode(strdate, "UTF-8"));
			job.put("maddress", URLEncoder.encode(m.getUser_address(), "UTF-8"));
			job.put("mphone", URLEncoder.encode(m.getUser_phone(), "UTF-8"));
			job.put("memail", URLEncoder.encode(m.getUser_email(), "UTF-8"));
			job.put("mgender", URLEncoder.encode(m.getUser_gender(), "UTF-8"));
		
			
			jarr.add(job);
		}
		json.put("list", jarr);
		json.put("currentPage", currentPage);
		json.put("maxPage", maxPage);
		json.put("startPage", startPage);
		json.put("endPage", endPage);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(json.toJSONString());
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="mselectbtn.do", method=RequestMethod.POST)
	public void mSelectBtn(HttpServletResponse response, HttpServletRequest request,
			@RequestParam("filter") String filter, 
			@RequestParam("searchTF") String searchTF) throws IOException{
		System.out.println("mSelectBtn 컨트롤러");
		HashMap map = new HashMap();
		map.put("filter", filter);
		map.put("searchTF", searchTF);
 
		 
		/*int listCount = adminService.mGetSelectListCount(filter, searchTF);*/
		int listCount = adminService.mGetSelectListCount(map);
		int currentPage = 1;
		int limit = 10;
		System.out.println("listCount: " + listCount);
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		
		int maxPage = (int)Math.ceil((double)listCount / limit + 0.9);
		System.out.println("maxPage : " + maxPage);
		int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		
		int endPage = startPage + limit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
	
		ArrayList<Member> list = adminService.mSelectList(currentPage, limit, filter, searchTF);
		
		
		
		JSONArray jarr = new JSONArray();
		
		for(Member m : list){
			JSONObject job = new JSONObject();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String strdate = sdf.format(m.getUser_birth());
			
			job.put("mid", URLEncoder.encode(m.getUser_id(), "UTF-8"));
			job.put("mname", URLEncoder.encode(m.getUser_name(), "UTF-8"));
			job.put("mbirth", URLEncoder.encode(strdate, "UTF-8"));
			job.put("maddress", URLEncoder.encode(m.getUser_address(), "UTF-8"));
			job.put("mphone", URLEncoder.encode(m.getUser_phone(), "UTF-8"));
			job.put("memail", URLEncoder.encode(m.getUser_email(), "UTF-8"));
			job.put("mgender", URLEncoder.encode(m.getUser_gender(), "UTF-8"));
			
			
			jarr.add(job);
		}
		JSONObject json = new JSONObject();
		json.put("list", jarr);
		json.put("currentPage", currentPage);
		json.put("maxPage", maxPage);
		json.put("startPage", startPage);
		json.put("endPage", endPage);
		json.put("filter", filter);
		json.put("searchTF", searchTF);
		json.put("listCount", listCount);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.print(json.toJSONString());
		System.out.println(json);
		out.flush();
		out.close();
		
	}
	
	/*@RequestMapping(value="amdelete.do", method=RequestMethod.POST)
	public void amDelete(HttpServletResponse response, HttpServletRequest request, String mid) throws IOException{
		Member member = (Member) adminService.amdelete(mid);
		JSONArray jarr = new JSONArray();
		JSONObject job = new JSONObject();
		
		job.put("mid", member.getUser_id());
		job.put("mname", member.getUser_name());
		job.put("mbirth", new SimpleDateFormat("yyyy-MM-dd").format(member.getUser_birth()));
		job.put("maddress", member.getUser_address());
		job.put("mphone", member.getUser_phone());
		job.put("memail", member.getUser_email());
		job.put("mgender", member.getUser_gender());
		
		
		jarr.add(job);
		JSONObject sendJson = new JSONObject(); // 전송용 객체
		sendJson.put("list", jarr); // 전송용 객체에 저장
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	}*/
	@RequestMapping(value="amdelete.do", method=RequestMethod.POST)
	public String amDelete(HttpServletResponse response, HttpServletRequest request, String mid, ModelAndView mv) throws IOException{
		
		mv.addObject(adminService.amdelete(mid));
	
		System.out.println("amDelete 컨트롤러");
		return "redirect:/adminmember.do";
	
	}
	
	
	
	
	
}
