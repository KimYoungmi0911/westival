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
	public Object noticeUpdate(int notice_no) {
		System.out.println("noticeUpdate service 보내기");
		return noticeDao.noticeUpdate(notice_no);
	}

	

	

	
}
