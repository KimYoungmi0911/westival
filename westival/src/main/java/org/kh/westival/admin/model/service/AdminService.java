package org.kh.westival.admin.model.service;

import java.util.ArrayList;

import org.kh.westival.admin.model.vo.Admin;
import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.ticket.model.vo.Ticket;
import org.springframework.stereotype.Service;

@Service("adminServiceImpl")
public interface AdminService {

	//	ArrayList<Ticket> selectList();

	//페이징(예매관리) 
	int ticketgetListCount();
	//페이징 뷰(예매)
	ArrayList<Ticket> ticketselectList(int currentPage, int limit);
	//검색(예매)
	ArrayList<Admin> searchList(String filter, String searchTF);
	
	//축제관리뷰(페이징)
	int festivalgetListCount();
	//페이징 뷰(축제)
	ArrayList<Festival> festivalSelectList(int currentPage, int limit);

	
	



}
