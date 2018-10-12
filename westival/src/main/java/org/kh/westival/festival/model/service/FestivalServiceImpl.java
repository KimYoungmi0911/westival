package org.kh.westival.festival.model.service;

import java.sql.Date;
import java.util.ArrayList;

import org.kh.westival.festival.model.dao.FestivalDao;
import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.festival.model.vo.Scrap;
import org.kh.westival.festival.model.vo.TicketOption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("festivalService")
public class FestivalServiceImpl implements FestivalService {

	@Autowired
	private FestivalDao festivalDao;
	
	@Override
	public int insertFestival(Festival festival) {
		return festivalDao.insertFestival(festival);
	}

	@Override
	public int insertTicketOption(TicketOption ticketOption) {
		return festivalDao.insertTicketOption(ticketOption);
	}

	@Override
	public ArrayList<Festival> locationSearch(Festival festival) {
		return (ArrayList<Festival>)festivalDao.locationSearch(festival);
	}

	@Override
	public ArrayList<Festival> tagSearch(Festival festival) {
		return (ArrayList<Festival>)festivalDao.tagSearch(festival);
	}
	
	@Override
	public ArrayList<Festival> todayFestivalSearch(Date currentDate) {
		return (ArrayList<Festival>)festivalDao.todayFestivalSearch(currentDate);
	}

	@Override
	public ArrayList<Festival> top3FestivalSearch() {
		return (ArrayList<Festival>)festivalDao.top3FestivalSearch();
	}

	@Override
	public int insertScrap(Scrap scrap) {
		return festivalDao.insertScrap(scrap);
	}

}
