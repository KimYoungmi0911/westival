package org.kh.westival.notice.model.dao;

import org.kh.westival.notice.model.vo.NoticePage;

public class NoticePageDao {

	public NoticePage noticePage(int currentPage, int limit) {
		int startRow = (currentPage - 1) * limit +1;
		int endRow = startRow + limit -1;
		 
		NoticePage npage = new NoticePage(startRow, endRow);
		return npage;
	}

}
