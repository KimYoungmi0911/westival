package org.kh.westival.admin.model.dao;

import org.kh.westival.admin.model.vo.AdminTicketPage;

public class AdminTicketPageDao {

	public AdminTicketPage adminTicketPage(int currentPage, int limit) {
		int startRow = (currentPage - 1) * limit +1;
		int endRow = startRow + limit -1;
		
		AdminTicketPage atpage = new AdminTicketPage(startRow, endRow);
		return atpage;
	}

}
