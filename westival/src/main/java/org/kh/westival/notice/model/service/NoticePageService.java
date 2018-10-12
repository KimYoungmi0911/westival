package org.kh.westival.notice.model.service;


import org.kh.westival.notice.model.dao.NoticePageDao;
import org.kh.westival.notice.model.vo.NoticePage;

public class NoticePageService {
	
	public NoticePage noticePage(int currentPage, int limit){
		
		NoticePage npage = new NoticePageDao().noticePage(currentPage, limit);
		return npage;
		
	}

}
