package org.kh.westival.admin.model.dao;

import org.kh.westival.admin.model.vo.AdminFestivalPage;

public class AdminFestivalPageDao {
	public AdminFestivalPage adminFestivalPage(int currentPage, int limit){
		int startRow = (currentPage - 1) * limit +1;
		int endRow = startRow + limit -1;
		
		AdminFestivalPage afpage = new AdminFestivalPage(startRow, endRow);
		return afpage;
	}

}
