package org.kh.westival.notice.model.vo;

import java.sql.Date;

public class Notice implements java.io.Serializable{
   private final static long serialVersionUID = 4000L;
   
   private String notice_no;            //공지사항번호
   private String user_id;               //작성자
   private String notice_title;            //공지사항제목
   private Date notice_date;            //작성날짜
   private String notice_content;      //공지사항내용
   private String original_filepath;      //첨부파일
   private String rename_filepath;      //수정파일
   
   public Notice(){}

   public Notice(String notice_no, String user_id, String notice_title, Date notice_date, String notice_content,
         String original_filepath, String rename_filepath) {
      super();
      this.notice_no = notice_no;
      this.user_id = user_id;
      this.notice_title = notice_title;
      this.notice_date = notice_date;
      this.notice_content = notice_content;
      this.original_filepath = original_filepath;
      this.rename_filepath = rename_filepath;
   }

   public String getNotice_no() {
      return notice_no;
   }

   public void setNotice_no(String notice_no) {
      this.notice_no = notice_no;
   }

   public String getUser_id() {
      return user_id;
   }

   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }

   public String getNotice_title() {
      return notice_title;
   }

   public void setNotice_title(String notice_title) {
      this.notice_title = notice_title;
   }

   public Date getNotice_date() {
      return notice_date;
   }

   public void setNotice_date(Date notice_date) {
      this.notice_date = notice_date;
   }

   public String getNotice_content() {
      return notice_content;
   }

   public void setNotice_content(String notice_content) {
      this.notice_content = notice_content;
   }

   public String getOriginal_filepath() {
      return original_filepath;
   }

   public void setOriginal_filepath(String original_filepath) {
      this.original_filepath = original_filepath;
   }

   public String getRename_filepath() {
      return rename_filepath;
   }

   public void setRename_filepath(String rename_filepath) {
      this.rename_filepath = rename_filepath;
   }

   @Override
   public String toString() {
      return "Notice [notice_no=" + notice_no + ", user_id=" + user_id + ", notice_title=" + notice_title
            + ", notice_date=" + notice_date + ", notice_content=" + notice_content + ", original_filepath="
            + original_filepath + ", rename_filepath=" + rename_filepath + "]";
   }
   
   

}