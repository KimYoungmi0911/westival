package org.kh.westival.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.kh.westival.notice.model.service.NoticeService;
import org.kh.westival.notice.model.vo.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes("notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeServiceImpl;
	
	/*@RequestMapping("noticeview.do")
	public String noticeView(){
		return "notice/noticeView";
	}*/
	
	/*@RequestMapping("noticeview.do")
	public ModelAndView selectList(ModelAndView mv){
		
		
		
		ArrayList<Notice> list = noticeServiceImpl.selectList();
		
		mv.addObject("list", list);
		mv.setViewName("notice/noticeView");
		System.out.println("dao갔다옴");
		return mv;
	}*/
	@RequestMapping("noticeview.do")
	public ModelAndView selectList(ModelAndView mv, HttpServletRequest request){
		int currentPage = 1;
		int limit = 9;
		if(request.getParameter("page") != null){
			currentPage = Integer.parseInt(request.getParameter("page"));
		}
		int listCount = noticeServiceImpl.getListCount();
		ArrayList<Notice> list = noticeServiceImpl.selectList(currentPage, limit);
		int maxPage = (int) Math.ceil(((double)listCount / limit));
		int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit -1;
		if(maxPage < endPage)
			endPage = maxPage;
		
		
		mv.addObject("list", list);
		mv.addObject("currentPage", currentPage);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("listCount", listCount);
		mv.setViewName("notice/noticeView");
		System.out.println("dao갔다옴");
		return mv;
	}
	
	
	
	/*@RequestMapping("ndetail.do")
	public String noticeDetail(){
		return "notice/noticeDetail";
	}*/
	
	@RequestMapping("ndetail.do")
	public ModelAndView noticeDetail(ModelAndView mv, @RequestParam(value="no") int notice_no){
		System.out.println("noticeDetail controller");
		System.out.println("들어온 notice_no 값 : " + notice_no);
		mv.addObject("noticedetail", noticeServiceImpl.noticeDetail(notice_no));
		mv.setViewName("notice/noticeDetail");
		return mv;
	}
	
	@RequestMapping("fdown.do")
	public ModelAndView fileDownMethod(ModelAndView mv, HttpServletRequest request, 
			@RequestParam("ofile") String originalFileName,
			@RequestParam("rfile") String renameFileName){
		
		System.out.println("ofile : " + originalFileName);
		System.out.println("rfile : " + renameFileName);
		
		String savePath = request.getSession().getServletContext().getRealPath("resources/uploadFiles");
		File readFile = new File(savePath + "\\" + renameFileName);
		File originFile = new File(originalFileName);
		
				//스프링에서는 컨트롤러의 메소드에서 파일 다운처리 하지 않는다.
				//스프링에서 제공하는 AbstractView 를 상속받은 
				//파일 다운로드 처리용 클래스를 별도로 작성하고, 
				//ViewResolver 에 의해 연결 실행되도록 처리함.
				
				//그러려면, 파일 다운로드 처리용 클래스이름의 id 명을 
				//뷰로 지정하고 리턴처리함.
				mv.setViewName("filedown");
				mv.addObject("readFile", readFile);
				mv.addObject("downFile", originFile);
		
		
				return mv;
		
	}
	
	@RequestMapping("ninsert.do")
	public String noticeInsert(){
		return "notice/noticeInsert";
	}
	
	/*@RequestMapping("ninsert.do")
	public ModelAndView noticeInsert(ModelAndView mv, Notice notice){
		System.out.println("noticeInsert controller");
		mv.addObject("noticeinsert", noticeServiceImpl.noticeInsert(notice));
		mv.setViewName("notice/noticeInsert");
		return mv;
	}*/
	
	@RequestMapping(value="fileup.do", method=RequestMethod.POST)
	public ModelAndView fileUpload(Notice notice, HttpServletRequest request, ModelAndView mv, 
			@RequestParam(name="file") MultipartFile file, @RequestParam(name="ntitle") String title,
			@RequestParam(name="ncontent") String content){
		
		/*String savePath = request.getSession().getServletContext().getRealPath("resources/uploadFiles");
		System.out.println("path : " + savePath);*/
		System.out.println("fileup.do... run");
		
		try {
			String originalFileName = file.getOriginalFilename();
			String renameFileName = null;
			
			if(!originalFileName.isEmpty()){
				String savePath = request.getSession().getServletContext().getRealPath("resources/uploadFiles/NoticeFile");
				System.out.println("path : " + savePath);
				
				SimpleDateFormat sdf = 
					new SimpleDateFormat("yyyyMMddHHmmss");
				renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))
						+ "." + originalFileName.substring(
								originalFileName.lastIndexOf(".") + 1);
				//System.out.println("rename : " + renameFileName);
				
				//전송받은 파일 객체를 지정 폴더에 저장함★★★(반드시해야함)
				file.transferTo(new File(savePath + "\\" + 
						file.getOriginalFilename()));  		//메모리에 있는 정보를 하드디스크의 저장폴더로 이동시키는 것(transferTo) 
				
				File originFile = 
						new File(savePath + "\\" + originalFileName);
					File renameFile = 
						new File(savePath + "\\" + renameFileName);
					
					//파일 이름바꾸기 실행 >> 실패할 경우 직접 바꾸기함
					//새 파일만들고 원래 파일 내용 읽어서 복사하고
					//복사가 끝나면 원래 파일 삭제함
					if(!originFile.renameTo(renameFile)){
						int read = -1;
						byte[] buf = new byte[1024];
						
						FileInputStream fin = 
							new FileInputStream(originFile);
						FileOutputStream fout =
							new FileOutputStream(renameFile);
						
						while((read = fin.read(buf, 0, buf.length)) != -1){
							fout.write(buf, 0, read);
						}
						
						fin.close();
						fout.close();					
						originFile.delete();
					}	
					
					notice.setNotice_title(title);
					notice.setNotice_content(content);
					notice.setOriginal_filepath(originalFileName);
					notice.setRename_filepath(renameFileName);
					mv.addObject("originalFileName", noticeServiceImpl.noticeInsert(notice));
					System.out.println("파일있음 : " + ", " + notice.getNotice_title() + ", " + notice.getNotice_content() + 
							", " + notice.getOriginal_filepath() + ", " + notice.getRename_filepath());
					
			}
			
			
			 if(originalFileName.isEmpty()){
					notice.setNotice_title(title);
					notice.setNotice_content(content);		
					notice.setOriginal_filepath(null);
					notice.setRename_filepath(null);
					mv.addObject("originalFileName", noticeServiceImpl.noticeInsert2(notice));
					System.out.println("파일없음 : " + ", " + notice.getNotice_title() + ", " + notice.getNotice_content() + 
							", " + notice.getOriginal_filepath() + ", " + notice.getRename_filepath());
					
				}
				mv.setViewName("redirect:/noticeview.do");
				
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
				return mv;
		
	}
	
	@RequestMapping(value="ndelete.do")
	public ModelAndView noticeDelete(ModelAndView mv, @RequestParam(value="no") int notice_no){
		mv.addObject("noticeDelete", noticeServiceImpl.noticeDelete(notice_no));
		mv.setViewName("redirect:/noticeview.do");
		return mv;
	}
	
	/*@RequestMapping(value="noticeupdate.do")
	public String noticeRewrite(){
		return "notice/noticeUpdate";
	}*/
	
	@RequestMapping(value="noticeupdate.do")
	public ModelAndView noticeUpdate(ModelAndView mv, @RequestParam(value="no1") int notice_no){
		mv.addObject("nudetail", noticeServiceImpl.noticeUpdate(notice_no));
		mv.setViewName("notice/noticeUpdate");
		return mv;
	}
	
		
	@RequestMapping(value="nupdate.do", method=RequestMethod.POST)
	public ModelAndView refileUpload(Notice notice, HttpServletRequest request, ModelAndView mv, 
			@RequestParam(name="file") MultipartFile file, @RequestParam(name="ntitle") String title,
			@RequestParam(name="ncontent") String content, @RequestParam(name="no") int no){
		System.out.println("noticeUpdate controller 되는지 안되는지");
		
		/*String savePath = request.getSession().getServletContext().getRealPath("resources/uploadFiles");
		System.out.println("path : " + savePath);*/

		
		try {
			String originalFileName = file.getOriginalFilename();
			String renameFileName = null;

			/*if(originalFileName != null){
				notice.setNotice_no(no);
				notice.setNotice_title(title);
				notice.setNotice_content(content);
				notice.setOriginal_filepath(originalFileName);
				notice.setRename_filepath(renameFileName);
			}*/
			
			if(!originalFileName.isEmpty()){
				String savePath = request.getSession().getServletContext().getRealPath("resources/uploadFiles");
				System.out.println("path : " + savePath);
				SimpleDateFormat sdf = 
					new SimpleDateFormat("yyyyMMddHHmmss");
				renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()))
						+ "." + originalFileName.substring(
								originalFileName.lastIndexOf(".") + 1);
				System.out.println("rename : " + renameFileName);
				
				//전송받은 파일 객체를 지정 폴더에 저장함★★★(반드시해야함)
				file.transferTo(new File(savePath + "\\" + 
						file.getOriginalFilename()));  		//메모리에 있는 정보를 하드디스크의 저장폴더로 이동시키는 것(transferTo) 
				
				File originFile = 
						new File(savePath + "\\" + originalFileName);
					File renameFile = 
						new File(savePath + "\\" + renameFileName);
					
					//파일 이름바꾸기 실행 >> 실패할 경우 직접 바꾸기함
					//새 파일만들고 원래 파일 내용 읽어서 복사하고
					//복사가 끝나면 원래 파일 삭제함
					if(!originFile.renameTo(renameFile)){
						int read = -1;
						byte[] buf = new byte[1024];
						
						FileInputStream fin = 
							new FileInputStream(originFile);
						FileOutputStream fout =
							new FileOutputStream(renameFile);
						
						while((read = fin.read(buf, 0, buf.length)) != -1){
							fout.write(buf, 0, read);
						}
						
						fin.close();
						fout.close();					
						originFile.delete();
					}	
					 
					notice.setNotice_no(no);
					notice.setNotice_title(title);
					notice.setNotice_content(content);
					notice.setOriginal_filepath(originalFileName);
					notice.setRename_filepath(renameFileName);
					
					System.out.println("noticeUpdate Controller " +"," + notice.getNotice_no() + ", " + notice.getNotice_title() + ", " 
					+ notice.getNotice_content() + ", " + notice.getOriginal_filepath() + ", " + notice.getRename_filepath());
					mv.addObject("originalFileName", noticeServiceImpl.noticeUpdate(notice));
			}
			else if(originalFileName.isEmpty()){
				notice.setNotice_no(no);
				notice.setNotice_title(title);
				notice.setNotice_content(content);
				notice.setOriginal_filepath(null);
				notice.setRename_filepath(null);
				System.out.println("noticeUpdate2 Controller " +"," + notice.getNotice_no() 
				+ ", " + notice.getNotice_title() + ", " + notice.getNotice_content() + ", " + notice.getOriginal_filepath() + notice.getRename_filepath());
				mv.addObject("originalFileName", noticeServiceImpl.noticeUpdate2(notice));
			}
			
			
		
			
				mv.setViewName("redirect:/noticeview.do");
				
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
				return mv;
		
	}
	
	
}
