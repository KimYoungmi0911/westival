package org.kh.westival.festival.model.service;

import java.sql.Date;
import java.util.ArrayList;

import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.festival.model.vo.FestivalReply;
import org.kh.westival.festival.model.vo.Recommend;
import org.kh.westival.festival.model.vo.Scrap;
import org.kh.westival.festival.model.vo.TicketOption;

public interface FestivalService {

	//경호
	int insertFestival(Festival festival);

	int insertTicketOption(TicketOption ticketOption);

	ArrayList<Festival> locationSearch(Festival festival);

	ArrayList<Festival> tagSearch(Festival festival);

	ArrayList<Festival> todayFestivalSearch(Date currentDate);

	ArrayList<Festival> top3FestivalSearch();
	
	Scrap selectScrap(Scrap scrap);

	int insertScrap(Scrap scrap);

	int deleteScrap(Scrap scrap);
	
	//다혜
	Festival selectFestival(int no);

	int updateCount(int no);

	//int insertScrap(Scrap scrap);

	int scrapCheck(Scrap scrap);

	//int deleteScrap(Scrap scrap);

	int recommendCheck(Recommend recommend);

	int insertRecommend(Recommend recommend);

	int deleteRecommend(Recommend recommend);

	ArrayList<FestivalReply> selectFestivalReply(int no, int currentPage, int limit);

	int selectlistCount(int no);

	int insertReply(FestivalReply festivalReply);

	int updateReply(FestivalReply festivalReply);

	int deleteReply(int reply_no);

	int selectTotalValue(int no);

	int selectMaleValue(int no);

	int selectFemaleValue(int no);

}
