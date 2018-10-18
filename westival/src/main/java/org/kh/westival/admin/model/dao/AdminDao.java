package org.kh.westival.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.kh.westival.admin.model.service.AdminFestivalPageServiceImpl;
import org.kh.westival.admin.model.service.AdminTicketPageServiceImpl;
import org.kh.westival.admin.model.vo.Admin;
import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.ticket.model.vo.Ticket;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminDao")
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public AdminDao(){}
	
	//예매 리스트
	/*public ArrayList<Ticket> selectList() {
		System.out.println("selectList dao 실행됨");
		
		List<Ticket> list = (List<Ticket>) sqlSession.selectList("adminMapper.adminTicketList");
		return (ArrayList<Ticket>) list;
	}*/
	
	//페이징 예매
	public int ticketgetListCount() {
		System.out.println("ticketgetListCount 페이징뷰 dao");
		return (int) sqlSession.selectOne("adminMapper.ticketgetListCount");
	}
	//페이징 뷰(예매)
	public ArrayList<Ticket> ticketselectList(int currentPage, int limit) {
		System.out.println("ticketselectList 페이징뷰 dao");
		return (ArrayList<Ticket>) sqlSession.selectList("adminMapper.ticketSelectList", new AdminTicketPageServiceImpl().adminTicketPage(currentPage, limit));
	}
	//검색(예매)
	public ArrayList<Admin> searchList(String filter, String searchTF) {
		System.out.println("searchList dao");
		Map<String, String> map = new HashMap<String, String>();
		map.put("filter", filter);
		map.put("searchTF", searchTF);
		return (ArrayList<Admin>) sqlSession.selectList("adminMapper.searchList", map);
	}
	
	//페이징(축제)
	public int festivalgetListCount() {
		System.out.println("festivalgetListCount 페이징 dao");
		return (int) sqlSession.selectOne("adminMapper.festivalgetListCount");
	}
	//페이징뷰(축제)
	public ArrayList<Festival> festivalSelectList(int currentPage, int limit) {
		System.out.println("festivalSelectList 페이징 dao");
		return (ArrayList<Festival>) sqlSession.selectList("adminMapper.festivalSelectList", new AdminFestivalPageServiceImpl().adminFestivalPage(currentPage, limit));
	}
	
	
	
	//축제관리(집)
	public int fGetListCount() {
		System.out.println("fGetListCount dao");
		return (int) sqlSession.selectOne("adminMapper.festivalgetListCount");
	}

	public ArrayList<Festival> fAllSelectList(int currentPage, int limit) {
		System.out.println("fAllSelectList dao");
		return (ArrayList<Festival>) sqlSession.selectList("adminMapper.festivalSelectList", new AdminFestivalPageServiceImpl().adminFestivalPage(currentPage, limit));
	}
	
	

	


}
