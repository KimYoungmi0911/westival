package org.kh.westival.notice.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.kh.westival.notice.model.vo.Notice;
import org.springframework.stereotype.Service;

@Service("noticeService")
public interface NoticeServiceImpl {

	ArrayList<Notice> selectList();

	Notice noticeDetail(int notice_no);

	int noticeInsert(Notice notice);
	
	int noticeInsert2(Notice notice);

	int noticeDelete(int notice_no);

	int noticeUpdate(Notice notice);
	
	int noticeUpdate2(Notice notice);

	Object noticeUpdate(int notice_no);
	
	//페이징 뷰
	int getListCount();

	ArrayList<Notice> selectList(int currentPage, int limit);

	


	

	

}
