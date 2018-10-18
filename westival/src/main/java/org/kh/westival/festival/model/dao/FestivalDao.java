package org.kh.westival.festival.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.kh.westival.festival.model.vo.Festival;
import org.kh.westival.festival.model.vo.FestivalReply;
import org.kh.westival.festival.model.vo.Recommend;
import org.kh.westival.festival.model.vo.Scrap;
import org.kh.westival.festival.model.vo.TicketOption;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("festivalDao")
public class FestivalDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//경호
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

	public Scrap selectScrap(Scrap scrap) {
		return (Scrap) sqlSession.selectOne("scrapMapper.selectScrap", scrap);
	}
	
	public int insertScrap(Scrap scrap) {
		int result = 0;
		result = sqlSession.insert("scrapMapper.insertScrap", scrap);
		return result;
	}

	public int deleteScrap(Scrap scrap) {
		int result = 0;
		result = sqlSession.delete("scrapMapper.deleteScrap", scrap);
		return result;
	}

	//다혜
	public Festival selectFestival(int no) {
		System.out.println("상세페이지 dao");
		return (Festival)sqlSession.selectOne("festivalMapper.infoFestival", no);
	}

	public int updateCount(int no) {
		System.out.println("조회수증가 dao");
		return sqlSession.update("festivalMapper.updateCount", no);
	}

	/*public int insertScrap(Scrap scrap) {
		return sqlSession.insert("festivalMapper.insertScrap", scrap);
	}*/

	public int scrapCheck(Scrap scrap) {
		return (int) sqlSession.selectOne("festivalMapper.scrapCheck", scrap);
	}

	/*public int deleteScrap(Scrap scrap) {
		return sqlSession.delete("festivalMapper.deleteScrap", scrap);
	}*/

	public int recommendCheck(Recommend recommend) {
		return (int)sqlSession.selectOne("festivalMapper.recommendCheck", recommend);
	}

	public int insertRecommend(Recommend recommend) {
		return sqlSession.insert("festivalMapper.insertRecommend", recommend);
	}

	public int deleteRecommend(Recommend recommend) {
		return sqlSession.delete("festivalMapper.deleteRecommend", recommend);
	}

	public ArrayList<FestivalReply> selectFestivalReply(int no, int currentPage, int limit) {
		System.out.println("댓글 불러오기 dao");
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		HashMap params = new HashMap();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		params.put("no", no);
		
		return (ArrayList)sqlSession.selectList("festivalMapper.selectReplyList", params);
	}

	public int selectlistCount(int no) {
		return (int) sqlSession.selectOne("festivalMapper.listCount", no);
	}

	public int insertReply(FestivalReply festivalReply) {
		return (int) sqlSession.insert("festivalMapper.insertReply", festivalReply);
	}

	public int updateReply(FestivalReply festivalReply) {
		return (int) sqlSession.update("festivalMapper.updateReply", festivalReply);
	}

	public int deleteReply(int reply_no) {
		return (int) sqlSession.delete("festivalMapper.deleteReply", reply_no);
	}


}
