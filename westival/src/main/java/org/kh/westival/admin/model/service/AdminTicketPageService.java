package org.kh.westival.admin.model.service;

import org.kh.westival.admin.model.dao.AdminTicketPageDao;
import org.kh.westival.admin.model.vo.AdminTicketPage;

public class AdminTicketPageService {

	public AdminTicketPage adminTicketPage(int currentPage, int limit){
		AdminTicketPage atpage = new AdminTicketPageDao().adminTicketPage(currentPage, limit);
		return atpage;
	}
	
}
