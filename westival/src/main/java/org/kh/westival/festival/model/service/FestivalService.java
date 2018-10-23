package org.kh.westival.festival.model.service;

import java.util.ArrayList;
import java.util.List;

import org.kh.westival.festival.model.vo.Age;
import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.festival.model.vo.FestivalReply;
import org.kh.westival.festival.model.vo.Recommend;
import org.kh.westival.festival.model.vo.Scrap;
import org.kh.westival.festival.model.vo.TicketOption;

public interface FestivalService {

	// 경호
	int insertFestival(Festival festival);

	int insertTicketOption(TicketOption ticketOption);

	// 10/18수정
	ArrayList<Festival> locationSearch(Festival festival, int currentPage, int limit);

	// 10/18수정
	ArrayList<Festival> tagSearch(Festival festival, int currentPage, int limit);

	ArrayList<Festival> top3FestivalSearch();

	Scrap selectScrap(Scrap scrap);

	int insertScrap(Scrap scrap);

	int deleteScrap(Scrap scrap);

	// 다혜
	Festival selectFestival(int no);

	int updateCount(int no);

	// int insertScrap(Scrap scrap);

	int scrapCheck(Scrap scrap);

	// int deleteScrap(Scrap scrap);

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

	Age selectAge(int no);

	/* 최경호 : 10/18 통합 이후 추가 */

	// 메인 이달의 축제 페이징처리
	int todayFestivalCount(java.sql.Date currentDate);

	// 메인 이달의 축제 목록
	List<Festival> todayFestivalSearch(java.sql.Date currentDate, int currentPage, int limit);

	// 위치 검색 페이징처리
	int locationSearchCount(Festival festival);

	// 태그 검색 페이징처리
	int tagSearchCount(Festival festival);

}
