package org.kh.westival.qna.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.kh.westival.qna.model.vo.Qna;
import org.kh.westival.qna.model.vo.QnaReply;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("qnaDao")
public class QnaDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public QnaDao(){}
	
	public ArrayList<Qna> selectQnaList(int currentPage, int limit){
		System.out.println("qna dao");
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		HashMap params = new HashMap();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		
		return (ArrayList)sqlSession.selectList("qnaMapper.selectListQna", params);
	}

	public int selectListCount() {
		System.out.println("selectListCount Dao");
		return (int) sqlSession.selectOne("qnaMapper.listCountQna");
	}

	public int insertQna(Qna qna) {
		return (int) sqlSession.insert("qnaMapper.insertQna", qna);
	}

	public Qna selectQna(int qna_no) {
		return (Qna) sqlSession.selectOne("qnaMapper.selectQna", qna_no);
	}

	public int updateCount(int qna_no) {
		return (int) sqlSession.update("qnaMapper.updateCountQna", qna_no);
	}
	
	public ArrayList<Qna> selectSearchQna(String category1, String category2, String keyword, int currentPage,
			int limit) {
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		HashMap params = new HashMap();
		params.put("startRow", startRow);
		params.put("endRow", endRow);
		params.put("category1", category1);
		params.put("category2", category2);
		params.put("keyword", keyword);
		
		return (ArrayList) sqlSession.selectList("qnaMapper.selectListSearchQna", params);
	}

	public int selectSearchListCount(HashMap params) {
		return (int) sqlSession.selectOne("qnaMapper.searchListCountQna", params);
	}

	public int insertQnaReply(QnaReply qnaReply) {
		return (int) sqlSession.insert("qnaMapper.insertQnaReply", qnaReply);
	}

	public ArrayList<QnaReply> selectQnaReply(int no) {
		return (ArrayList) sqlSession.selectList("qnaMapper.selectQnaReplyList", no);
	}
}
