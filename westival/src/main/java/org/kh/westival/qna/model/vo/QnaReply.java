package org.kh.westival.qna.model.vo;

import java.sql.Date;

public class QnaReply implements java.io.Serializable{
   private final static long serialVersionUID = 777L;
   
   private int reply_no;               //댓글번호
   private String reply_user_id;         //작성자
   private int qna_no;               //게시글번호
   private String reply_content;      //내용
   private int reply_level;            //레벨
   private int reply_seq;               //순번
   private Date reply_date;            //작성일
   private int reply_ref;               //참조댓글번호
   
   public QnaReply(){}

   public QnaReply(int reply_no, String reply_user_id, int qna_no, String reply_content, int reply_level,
         int reply_seq, Date reply_date, int reply_ref) {
      super();
      this.reply_no = reply_no;
      this.reply_user_id = reply_user_id;
      this.qna_no = qna_no;
      this.reply_content = reply_content;
      this.reply_level = reply_level;
      this.reply_seq = reply_seq;
      this.reply_date = reply_date;
      this.reply_ref = reply_ref;
   }

   public int getReply_no() {
      return reply_no;
   }

   public void setReply_no(int reply_no) {
      this.reply_no = reply_no;
   }

   public String getReply_user_id() {
      return reply_user_id;
   }

   public void setReply_user_id(String reply_user_id) {
      this.reply_user_id = reply_user_id;
   }

   public int getQna_no() {
      return qna_no;
   }

   public void setQna_no(int qna_no) {
      this.qna_no = qna_no;
   }

   public String getReply_content() {
      return reply_content;
   }

   public void setReply_content(String reply_content) {
      this.reply_content = reply_content;
   }

   public int getReply_level() {
      return reply_level;
   }

   public void setReply_level(int reply_level) {
      this.reply_level = reply_level;
   }

   public int getReply_seq() {
      return reply_seq;
   }

   public void setReply_seq(int reply_seq) {
      this.reply_seq = reply_seq;
   }

   public Date getReply_date() {
      return reply_date;
   }

   public void setReply_date(Date reply_date) {
      this.reply_date = reply_date;
   }

   public int getReply_ref() {
      return reply_ref;
   }

   public void setReply_ref(int reply_ref) {
      this.reply_ref = reply_ref;
   }

   @Override
   public String toString() {
      return "QnaReply [reply_no=" + reply_no + ", reply_user_id=" + reply_user_id + ", qna_no=" + qna_no
            + ", reply_content=" + reply_content + ", reply_level=" + reply_level + ", reply_seq=" + reply_seq
            + ", reply_date=" + reply_date + ", reply_ref=" + reply_ref + "]";
   }
   
   
}