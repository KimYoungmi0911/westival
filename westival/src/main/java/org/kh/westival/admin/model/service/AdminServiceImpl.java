package org.kh.westival.admin.model.service;

import java.util.ArrayList;

import org.kh.westival.admin.model.dao.AdminDao;
import org.kh.westival.admin.model.vo.Admin;
import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.ticket.model.vo.Ticket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDao adminDao;

	/*@Override
	public ArrayList<Ticket> selectList() {
		System.out.println("selectList service");
		return adminDao.selectList();
	}*/

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
	
	//페이징(축제)
	@Override
	public int festivalgetListCount() {
		System.out.println("festivalgetListCount serviceImpl");
		return adminDao.festivalgetListCount();
	}
	//페이징 뷰(축제)
	@Override
	public ArrayList<Festival> festivalSelectList(int currentPage, int limit) {
		System.out.println("festivalSelectList serviceImpl");
		return adminDao.festivalSelectList(currentPage, limit);
	}
	
	
	


	

	



}
