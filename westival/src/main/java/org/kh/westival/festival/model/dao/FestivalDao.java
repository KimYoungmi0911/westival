package org.kh.westival.festival.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.festival.model.vo.Scrap;
import org.kh.westival.festival.model.vo.TicketOption;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("festivalDao")
public class FestivalDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertFestival(Festival festival) {
		int result = 0;
		result = sqlSession.insert("festivalMapper.insertFestival", festival);
		return result;
	}

	public int insertTicketOption(TicketOption ticketOption) {
		int result = 0;
		result = sqlSession.insert("ticketOptionMapper.insertTicketOption", ticketOption);
		return result;
	}

	public List<Festival> locationSearch(Festival festival) {
		Map<Object, Object> param = new HashMap<Object, Object>();
		
		param.put("address", festival.getAddress());
		param.put("start_date", festival.getStart_date());
		param.put("end_date", festival.getEnd_date());
		
		String[] list = festival.getTheme().split(",");
		
		List<String> themeList = new ArrayList<String>();
				
		for(int i=0; i<list.length; i++){
			themeList.add(list[i]);
		}
		param.put("theme_list", themeList);
		
		return (List) sqlSession.selectList("festivalMapper.locationSearch", param);
	}

	public List<Festival> tagSearch(Festival festival) {
		return (List) sqlSession.selectList("festivalMapper.tagSearch", festival);
	}

	public List<Festival> todayFestivalSearch(Date currentDate) {
		return (List) sqlSession.selectList("festivalMapper.todayFestivalSearch", currentDate);
	}

	public List<Festival> top3FestivalSearch() {
		return (List) sqlSession.selectList("festivalMapper.top3FestivalSearch");
	}

	public int insertScrap(Scrap scrap) {
		int result = 0;
		result = sqlSession.insert("festivalMapper.insertScrap", scrap);
		return result;
	}

}
