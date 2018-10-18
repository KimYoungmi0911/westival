package org.kh.westival.admin.model.service;

import org.kh.westival.admin.model.dao.AdminTicketPageDao;
import org.kh.westival.admin.model.vo.AdminTicketPage;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service("adminTicketService")

public class AdminTicketPageServiceImpl {

	public AdminTicketPage adminTicketPage(int currentPage, int limit){
		AdminTicketPage atpage = new AdminTicketPageDao().adminTicketPage(currentPage, limit);
		return atpage;
	}
	
}
