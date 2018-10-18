package org.kh.westival.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.kh.westival.admin.model.dao.AdminDao;
import org.kh.westival.admin.model.vo.Admin;
import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.member.model.vo.Member;
import org.kh.westival.ticket.model.vo.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao adminDao;

	
//----------------------------------------------
	//--예매관리
	
	//페이징(예매)
	@Override
	public int ticketgetListCount() {
		System.out.println("ticketgetListCount 페이징 뷰");
		return adminDao.ticketgetListCount();
	}
	//페이징뷰(예매)
	@Override
	public ArrayList<Ticket> ticketselectList(int currentPage, int limit) {
		System.out.println("ticketselectList 페이징뷰");
		return adminDao.ticketselectList(currentPage, limit);
	}
	//검색(예매)
	@Override
	public ArrayList<Admin> searchList(String filter, String searchTF) {
		System.out.println("searhList serviceImpl");
		return adminDao.searchList(filter, searchTF);
	}
	//-------------------------------------------------------
	//축제관리
	
	//축제관리(페이징 및 리스트)
	@Override
	public int fGetListCount() {
		 System.out.println("fGetListCount serviceImpl");
		return adminDao.fGetListCount();
	}
	@Override
	public ArrayList<Festival> fAllSelectList(int currentPage, int limit) {
		System.out.println("fAllSelectList serviceImple");
		return adminDao.fAllSelectList(currentPage, limit);
	}
	
	//축제관리(검색)(페이징 및 리스트)
	@Override
	public int fGetSelectListCount(String filter, String searchTF) {
		System.out.println("fGetSelectListCount serviceImpl");
		return adminDao.fGetSelectListCount(filter, searchTF);
	}
	@Override
	public ArrayList<Festival> festivalSelectList(int currentPage, int limit, String filter, String searchTF) {
		System.out.println("festivalSelectList serviceImpl ");
		return adminDao.festivalSelectList(currentPage, limit, filter, searchTF);
	}
	//----------------------------------------------------------
	//회원관리
	
	//회원관리(페이징 및 리스트)
	@Override
	public int mGetListCount() {
		System.out.println("mGetListCount serviceImpl");
		return adminDao.mGetListCount();
	}
	@Override
	public ArrayList<Member> mAllSelectList(int currentPage, int limit) {
		System.out.println("mAllSelectList serviceImpl");
		return adminDao.mAllSelectList(currentPage, limit);
	}
	
	//회원관리(검색)(페이징 및 리스트)
	@Override
	public int mGetSelectListCount(HashMap map) {
		System.out.println("mGetSelectListCount serviceImpl");
		return adminDao.mGetSelectListCount(map);
	}
	@Override
	public ArrayList<Member> mSelectList(int currentPage, int limit, String filter, String searchTF) {
		System.out.println("mSelectList serviceImpl");
		return adminDao.mSelectList(currentPage, limit, filter, searchTF);
	}
	
	
	


	

	



}
