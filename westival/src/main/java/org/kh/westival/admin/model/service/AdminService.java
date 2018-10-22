package org.kh.westival.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.kh.westival.admin.model.vo.Admin;
import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.member.model.vo.Member;
import org.kh.westival.ticket.model.vo.Ticket;

public interface AdminService {
//--------------------------------------
	//예매관리 
	
	//페이징(예매관리) 
	int ticketgetListCount();
	//페이징 뷰(예매)
	ArrayList<Ticket> ticketselectList(int currentPage, int limit);
	
	//예매관리 페이징 및 리스트
	int tGetListCount();
	ArrayList<Admin> tAllSelectList(int currentPage, int limit);
	
	//검색(예매)
	ArrayList<Admin> searchList(String filter, String searchTF);

	//예매관리(검색)(페이징 및 리스트)
	int tGetSelectListCount(HashMap map);
	ArrayList<Admin> tSelectList(int currentPage, int limit, String filter, String searchTF);
	
//---------------------------------------
	//축제관리
	
	//축제관리뷰(페이징 및 리스트)
	int fGetListCount();
	ArrayList<Festival> fAllSelectList(int currentPage, int limit);
	
	//축제관리뷰(검색)(페이징 및 리스트)
	int fGetSelectListCount(String filter, String searchTF);
	ArrayList<Festival> festivalSelectList(int currentPage, int limit, String filter, String searchTF);
//------------------------------------------------------------------	
	//회원관리
	
	//회원리스트
	//Object adminMemberView();
	int getListCount();
	ArrayList<Member> selectList(int currentPage, int limit);
	
	//회원관리뷰(페이징 및 리스트) 
	int mGetListCount();
	ArrayList<Member> mAllSelectList(int currentPage, int limit);
	 
	//회원관리뷰(검색)(페이징 및 리스트)
	int mGetSelectListCount(HashMap map);
	ArrayList<Member> mSelectList(int currentPage, int limit, String filter, String searchTF);
	
	//회원 삭제
	Object amdelete(String mid);
	
	
	
	
	
	
	
	
	
	



}
