package org.kh.westival.notice.model.service;

import java.util.ArrayList;

import org.kh.westival.admin.model.vo.Admin;
import org.kh.westival.notice.model.vo.Notice;

public interface NoticeService {
 
	ArrayList<Notice> selectList();

	Notice noticeDetail(int notice_no);

	int noticeInsert(Notice notice);
	
	int noticeInsert2(Notice notice);

	int noticeDelete(int notice_no);

	int noticeUpdate(Notice notice);
	
	int noticeUpdate2(Notice notice);

	Object noticeUpdate(int notice_no);
	
	int getListCount();

	ArrayList<Notice> selectList(int currentPage, int limit);

	//공지전체 페이징 및 뷰
	int nGetListCount();

	ArrayList<Notice> nAllSelectList(int currentPage, int limit);
	
	
	
	//공지검색 페이징 및 뷰
	int nGetSelectListCount(String filter, String searchTF);

	ArrayList<Notice> nSelectList(int currentPage, int limit, String filter, String searchTF);



	


	

	

}
