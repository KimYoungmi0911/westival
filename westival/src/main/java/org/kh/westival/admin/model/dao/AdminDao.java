package org.kh.westival.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.kh.westival.admin.model.service.AdminFestivalPageServiceImpl;
import org.kh.westival.admin.model.service.AdminTicketPageServiceImpl;
import org.kh.westival.admin.model.vo.Admin;
import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.festival.model.vo.TicketOption;
import org.kh.westival.member.model.vo.Member;
import org.kh.westival.ticket.model.vo.Ticket;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("adminDao")
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public AdminDao(){}
	
	//----------------------------------------------------
	//예매관리
	
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
	//예매관리(페이징)
	public int tGetListCount() {
		System.out.println("tGetListCOunt dao)");
		return (int) sqlSession.selectOne("adminMapper.tGetListCount");
	}
	//예매관리(리스트)
	public ArrayList<Admin> tAllSelectList(int currentPage, int limit) {
		System.out.println("tAllSelectList");
		HashMap map = new HashMap();
		int startRow = (currentPage - 1) * limit +1;
		int endRow = startRow + limit -1;
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return (ArrayList<Admin>) sqlSession.selectList("adminMapper.tAllSelectList", map);
	}

	
	//검색(예매)
	public ArrayList<Admin> searchList(String filter, String searchTF) {
		System.out.println("searchList dao");
		Map<String, String> map = new HashMap<String, String>();
		map.put("filter", filter);
		map.put("searchTF", searchTF);
		return (ArrayList<Admin>) sqlSession.selectList("adminMapper.searchList", map);
	}
	//예매관리(검색)(페이징)
	public int tGetSelectListCount(HashMap map) {
		System.out.println("tGetSelectListCount dao");
		
		return (int) sqlSession.selectOne("adminMapper.tGetSelectListCount", map);
	}
	//예매관리(검색)(리스트)
	public ArrayList<Admin> testivalSelectList(int currentPage, int limit, String filter, String searchTF) {
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		HashMap map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("filter", filter);
		map.put("searchTF", searchTF);
		return  (ArrayList<Admin>) sqlSession.selectList("adminMapper.tSelectList", map);
	}
	
//-------------------------------------------------
	//축제관리
	
	
	
	//축제관리(페이징 및 리스트)
	public int fGetListCount() {
		System.out.println("fGetListCount dao");
		return (int) sqlSession.selectOne("adminMapper.festivalgetListCount");
	}

	public ArrayList<Festival> fAllSelectList(int currentPage, int limit) {
		System.out.println("fAllSelectList dao");
		return (ArrayList<Festival>) sqlSession.selectList("adminMapper.festivalSelectList", new AdminFestivalPageServiceImpl().adminFestivalPage(currentPage, limit));
	}

	//축제관리(검색)(페이징 및 리스트)
	public int fGetSelectListCount(String filter, String searchTF) {
		System.out.println("fGetSelectListCount dao");
		HashMap map = new HashMap();
		map.put("filter", filter);
		map.put("searchTF", searchTF);
		return (int) sqlSession.selectOne("adminMapper.festivalgetSelectListCount", map);
	}
	public ArrayList<Festival> festivalSelectList(int currentPage, int limit, String filter, String searchTF) {
		System.out.println("festivalSelectList dao");
		HashMap map = new HashMap();
		int startRow = (currentPage - 1) * limit +1;
		int endRow = startRow + limit -1;
		map.put("filter", filter);
		map.put("searchTF", searchTF);
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		return (ArrayList<Festival>) sqlSession.selectList("adminMapper.fsearchList", map);
	}

	//축제 디테일
	public Festival festivalDetail(int fno) {
		System.out.println("festivalDetail dao");
		return (Festival) sqlSession.selectOne("adminMapper.festivalDetail", fno);
	}
	
	/*//축제 수정(축제)
	public int updateFestival(Festival festival) {
		System.out.println("updateFestival dao");
		return sqlSession.update("adminMapper.updateFestival", festival);
	}
	//축제 수정(티켓)
	public int updateTicketOption(TicketOption ticketOption) {
		System.out.println("updateTicketOption dao");
		return sqlSession.update("adminMapper.updateTicketOption", ticketOption);
	}
	*/
	
	
	//-------------------------------------------------------------------
	//회원관리
	
	//회원리스트
	/*public Object adminMemberView() {
		System.out.println("adminMemberView dao");
		return sqlSession.selectList("adminMapper.adminMemberView");
	}*/
	public int getListCount() {
		System.out.println("getListCount dao");
		return (int) sqlSession.selectOne("adminMapper.getListCount");
	}

	public ArrayList<Member> selectList(int currentPage, int limit) {
		System.out.println("selectList dao");
		
		HashMap map = new HashMap();
		int startRow = (currentPage - 1) * limit +1;
		int endRow = startRow + limit -1;
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return (ArrayList<Member>) sqlSession.selectList("adminMapper.selectList", map);
	}
	
	//회원관리뷰(페이징 및 리스트)
	public int mGetListCount() {
		System.out.println("mGetListCount dao");
		return (int) sqlSession.selectOne("adminMapper.mGetListCount");
	}

	public ArrayList<Member> mAllSelectList(int currentPage, int limit) {
		System.out.println("mAllselectList dao");
		HashMap map = new HashMap();
		int startRow = (currentPage - 1) * limit +1;
		int endRow = startRow + limit -1;
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return (ArrayList<Member>) sqlSession.selectList("adminMapper.mAllSelectList", map);
	}

	//회원관리(검색)(페이징 및 리스트)
	public int mGetSelectListCount(HashMap map) {
		System.out.println("mGetSelectListCount dao");
		
		return (int) sqlSession.selectOne("adminMapper.mGetSelectListCount", map);
	} 
 
	public ArrayList<Member> mSelectList(int currentPage, int limit, String filter, String searchTF) {
		System.out.println("mSelectList dao");
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		HashMap map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("filter", filter);
		map.put("searchTF", searchTF);
		return (ArrayList<Member>) sqlSession.selectList("adminMapper.mSelectList", map);
	}

	//회원 삭제
	public Object amdelete(String mid) {
		System.out.println("amdelete dao");
		
		return sqlSession.delete("adminMapper.amdelete", mid);
	}

	

	

	

	

	
	
	

	


}
