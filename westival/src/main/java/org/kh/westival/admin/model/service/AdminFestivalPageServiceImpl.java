package org.kh.westival.admin.model.service;

import org.kh.westival.admin.model.dao.AdminFestivalPageDao;
import org.kh.westival.admin.model.vo.AdminFestivalPage;
import org.springframework.stereotype.Service;

@Service("adminFestivalService")

public class AdminFestivalPageServiceImpl {

	public AdminFestivalPage adminFestivalPage(int currentPage, int limit){
		AdminFestivalPage afpage = new AdminFestivalPageDao().adminFestivalPage(currentPage, limit);
		return afpage;
	}
}
