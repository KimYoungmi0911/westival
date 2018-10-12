package org.kh.westival.notice.model.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.kh.westival.notice.model.dao.NoticeDao;
import org.kh.westival.notice.model.vo.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("noticeServiceImpl")
public class NoticeService implements NoticeServiceImpl{
		
	@Autowired
	private NoticeDao noticeDao;
	
	public NoticeService(){}
		
	@Override
	public ArrayList<Notice> selectList() {
		System.out.println("selectList service 실행됨");
		return noticeDao.selectList();
	}

	@Override
	public Notice noticeDetail(int notice_no) {
		System.out.println("noticeDetail service");
		return noticeDao.noticeDetail(notice_no);
		
	}

	@Override
	public int noticeInsert(Notice notice) {
		System.out.println("noticeInsert service");
		return noticeDao.noticeInsert(notice);
	}
	@Override
	public int noticeInsert2(Notice notice) {
		System.out.println("noticeInsert2 service");
		return noticeDao.noticeInsert2(notice);
	}

	@Override
	public int noticeDelete(int notice_no) {
		System.out.println("noticeDelete service");
		return noticeDao.noticeDelete(notice_no);
	}

	@Override
	public int noticeUpdate(Notice notice) {
		System.out.println("noticeUpdate service");
		return noticeDao.noticeUpdate(notice);
	}
	
	@Override
	public int noticeUpdate2(Notice notice) {
		System.out.println("noticeUpdate2 service");
		return noticeDao.noticeUpdate2(notice);
	}
	
	//정보 보내는 메소드
	@Override
	public Object noticeUpdate(int notice_no) {
		System.out.println("noticeUpdate service 보내기");
		return noticeDao.noticeUpdate(notice_no);
	}
	
	//페이징 뷰
	@Override
	public int getListCount() {
		System.out.println("getListCount 페이징뷰");
		return noticeDao.noticegetListCount();
	}

	@Override
	public ArrayList<Notice> selectList(int currentPage, int limit) {
		System.out.println("selectList 페이징뷰");
		return noticeDao.selectList(currentPage, limit);
	}

	

	

	

	

	

	
}
