package org.kh.westival.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

@Component("filedown")
public class NoticeFileDownloadController extends AbstractView{
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, 
			HttpServletResponse response) throws Exception{
		//파일 다운로드 코드 작성
		System.out.println("notice파일 다운로드 뷰클래스 실행");
		
		//컨트롤러에서 뷰리졸버로 리턴한 model 정보가
		//이 클래스로 자동 전달됨.
		File readFile = (File)model.get("readFile");
		File downFile = (File)model.get("downFile");
		
		response.setContentType("text/plain; charset=UTF-8");
		//한글 파일명 인코딩 처리
		response.addHeader("Content-Disposition", "attachment; filename=\"" + 
				new String(downFile.getName().getBytes("UTF-8"), "ISO-8859-1") + "\"");
		response.setContentLength((int)readFile.length());
		
		//스트림 생성
		OutputStream out = response.getOutputStream();
		FileInputStream fin = new FileInputStream(readFile);
		
		//읽어서 내보냄
		FileCopyUtils.copy(fin, out);
		
		out.flush();
		out.close();
		fin.close();
		
	}

}
