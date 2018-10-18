package org.kh.westival.festival.model.service;

import java.sql.Date;
import java.util.ArrayList;

import org.kh.westival.festival.model.dao.FestivalDao;
import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.festival.model.vo.FestivalReply;
import org.kh.westival.festival.model.vo.Recommend;
import org.kh.westival.festival.model.vo.Scrap;
import org.kh.westival.festival.model.vo.TicketOption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("festivalService")
public class FestivalServiceImpl implements FestivalService {

	@Autowired
	private FestivalDao festivalDao;
	 
	//경호
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
	public Scrap selectScrap(Scrap scrap) {
		return festivalDao.selectScrap(scrap);
	}
	
	@Override
	public int insertScrap(Scrap scrap) {
		return festivalDao.insertScrap(scrap);
	}

	@Override
	public int deleteScrap(Scrap scrap) {
		return festivalDao.deleteScrap(scrap);
		
	}
	
	//다혜
	@Override
	public Festival selectFestival(int no) {
		System.out.println("상세페이지 서비스");
		return festivalDao.selectFestival(no);
	}

	@Override
	public int updateCount(int no) {
		System.out.println("조회수 증가 서비스");
		return festivalDao.updateCount(no);
	}

	/*@Override
	public int insertScrap(Scrap scrap) {
		return festivalDao.insertScrap(scrap);
	}*/

	@Override
	public int scrapCheck(Scrap scrap) {
		return festivalDao.scrapCheck(scrap);
	}

	/*@Override
	public int deleteScrap(Scrap scrap) {
		return festivalDao.deleteScrap(scrap);
	}*/

	@Override
	public int recommendCheck(Recommend recommend) {
		return festivalDao.recommendCheck(recommend);
	}

	@Override
	public int insertRecommend(Recommend recommend) {
		return festivalDao.insertRecommend(recommend);
		
	}

	@Override
	public int deleteRecommend(Recommend recommend) {
		return festivalDao.deleteRecommend(recommend);
	}

	@Override
	public ArrayList<FestivalReply> selectFestivalReply(int no, int currentPage, int limit) {
		System.out.println("댓글 불러오기 service");
		return festivalDao.selectFestivalReply(no,currentPage,limit);
	}

	@Override
	public int selectlistCount(int no) {
		return festivalDao.selectlistCount(no);
	}

	@Override
	public int insertReply(FestivalReply festivalReply) {
		return festivalDao.insertReply(festivalReply);
	}

	@Override
	public int updateReply(FestivalReply festivalReply) {
		return festivalDao.updateReply(festivalReply);
	}

	@Override
	public int deleteReply(int reply_no) {
		return festivalDao.deleteReply(reply_no);
	}



}
