package org.kh.westival.qna.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.kh.westival.qna.model.vo.Qna;
import org.kh.westival.qna.model.vo.QnaReply;

public interface QnaService {
	ArrayList<Qna> selectQnaList(int currentPage, int limit);

	int selectListCount();

	int insertQna(Qna qna);

	Qna selectQna(int qna_no);

	int updateCount(int qna_no);
	
	ArrayList<Qna> selectSearchQna(String category1, String category2, String keyword, int currentPage, int limit);

	int selectSearchListCount(HashMap params);

	int insertQnaReply(QnaReply qnaReply);

	ArrayList<QnaReply> selectQnaReply(int no);

	int updateQnaState(int qna_no, String string);

	int deleteQna(int qna_no);

	int updateQna(Qna qna);

	int updateQnaReply(QnaReply qnaReply);

	int deleteQnaReply(int reply_no);

}
