package org.kh.westival.qna.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.kh.westival.qna.model.dao.QnaDao;
import org.kh.westival.qna.model.vo.Qna;
import org.kh.westival.qna.model.vo.QnaReply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaDao qnaDao;
	
	public QnaServiceImpl(){}

	@Override
	public ArrayList<Qna> selectQnaList(int currentPage, int limit) {
		System.out.println("qna service");
		return qnaDao.selectQnaList(currentPage, limit);
	}

	@Override
	public int selectListCount() {
		System.out.println("selectListCount Service");
		return qnaDao.selectListCount();
	}

	@Override
	public int insertQna(Qna qna) {
		return qnaDao.insertQna(qna);
	}

	@Override
	public Qna selectQna(int qna_no) {
		return qnaDao.selectQna(qna_no);
	}

	@Override
	public int updateCount(int qna_no) {
		return qnaDao.updateCount(qna_no);
	}
	
	@Override
	public ArrayList<Qna> selectSearchQna(String category1, String category2, String keyword, int currentPage,
			int limit) {
		return qnaDao.selectSearchQna(category1, category2, keyword, currentPage, limit);
	}

	@Override
	public int selectSearchListCount(HashMap params) {
		return qnaDao.selectSearchListCount(params);
	}

	@Override
	public int insertQnaReply(QnaReply qnaReply) {
		return qnaDao.insertQnaReply(qnaReply);
	}

	@Override
	public ArrayList<QnaReply> selectQnaReply(int no) {
		return qnaDao.selectQnaReply(no);
	}
	
}
