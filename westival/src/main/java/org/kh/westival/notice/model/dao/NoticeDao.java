package org.kh.westival.notice.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.kh.westival.notice.model.service.NoticePageServiceImpl;
import org.kh.westival.notice.model.vo.Notice;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("noticeDao")
public class NoticeDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public NoticeDao(){}

	//공지사항 리스트
	public ArrayList<Notice> selectList() {
		System.out.println("selectList dao 실행됨");
		
		List<Notice> list = (List<Notice>) sqlSession.selectList("noticeMapper.noticeList");
		
		return (ArrayList<Notice>)list;
	}
	
	//공지사항 상세보기
	public Notice noticeDetail(int notice_no) {
		System.out.println("noticeDetail dao");
		
		return (Notice) sqlSession.selectOne("noticeMapper.noticeDetail", notice_no);
	}

	/*//공지사항 등록하기
	public int noticeInsert(Notice notice) {
		System.out.println("noticeInsert dao");
		
		return sqlSession.insert("noticeMapper.noticeInsert", notice);
	}*/
	//공지사항 등록하기1(파일있을때)
		public int noticeInsert(Notice notice) {
			System.out.println("noticeInsert dao");
			
			return sqlSession.insert("noticeMapper.noticeInsert1", notice);
	}
		//공지사항 등록하기2(파일없을때)
		public int noticeInsert2(Notice notice) {
			System.out.println("noticeInsert2 dao");
			return sqlSession.insert("noticeMapper.noticeInsert2", notice);
		}
		
	
	//공지사항 삭제하기
	public int noticeDelete(int notice_no) {
		System.out.println("noticeDelete dao");
		return sqlSession.delete("noticeMapper.noticeDelete", notice_no);
	}
	
	//공지사항 수정하기(파일 있을때)
	public int noticeUpdate(Notice notice) {
		System.out.println("noticeUpdate dao" + notice.getNotice_no() + ", " + notice.getNotice_title() + ", " + notice.getNotice_content() + ", " + notice.getOriginal_filepath());
		
		return sqlSession.update("noticeMapper.noticeUpdate1", notice);
	}
	//공지사항 수정하기(파일없을때)
	public int noticeUpdate2(Notice notice) {
		System.out.println("noticeUpdate dao" + notice.getNotice_no() + ", " + notice.getNotice_title() + ", " + notice.getNotice_content() + ", " + notice.getOriginal_filepath());
		return sqlSession.update("noticeMapper.noticeUpdate2", notice);
	}

	
	//공지사항으로 정보 추가해서 보내기
	public Object noticeUpdate(int notice_no) {
		
		return sqlSession.selectOne("noticeMapper.noticeSelect", notice_no);
	}

	//페이징 뷰
	public int noticegetListCount() {
		System.out.println("getListCount 페이징뷰 dao");
		return (int) sqlSession.selectOne("noticeMapper.getListCount");
	}

	public ArrayList<Notice> selectList(int currentPage, int limit) {
		return (ArrayList<Notice>) sqlSession.selectList("noticeMapper.selectListPage", new NoticePageServiceImpl().noticePage(currentPage, limit));
		
	}

	


	

	

}
