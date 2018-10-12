package org.kh.westival.festival.model.service;

import java.sql.Date;
import java.util.ArrayList;

import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.festival.model.vo.Scrap;
import org.kh.westival.festival.model.vo.TicketOption;

public interface FestivalService {

	int insertFestival(Festival festival);

	int insertTicketOption(TicketOption ticketOption);

	ArrayList<Festival> locationSearch(Festival festival);

	ArrayList<Festival> tagSearch(Festival festival);

	ArrayList<Festival> todayFestivalSearch(Date currentDate);

	ArrayList<Festival> top3FestivalSearch();

	int insertScrap(Scrap scrap);

}
