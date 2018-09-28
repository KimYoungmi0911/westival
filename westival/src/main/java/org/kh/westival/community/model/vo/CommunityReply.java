package org.kh.westival.community.model.vo;

import java.sql.Date;

public class CommunityReply implements java.io.Serializable{
   private final static long serialVersionUID = 11L;
   
   private int comment_no;                  //댓글번호
   private String user_id;                     //작성자
   private int community_no;               //게시글번호
   private String comment_content;         //댓글내용
   private int comment_level;               //댓글레벨
   private int comment_seq;               //댓글순번
   private Date comment_date;            //댓글작성일자
   private int comment_ref;                  //참조댓글번호
   
   public CommunityReply(){}

   public CommunityReply(int comment_no, String user_id, int community_no, String comment_content, int comment_level,
         int comment_seq, Date comment_date, int comment_ref) {
      super();
      this.comment_no = comment_no;
      this.user_id = user_id;
      this.community_no = community_no;
      this.comment_content = comment_content;
      this.comment_level = comment_level;
      this.comment_seq = comment_seq;
      this.comment_date = comment_date;
      this.comment_ref = comment_ref;
   }

   public int getComment_no() {
      return comment_no;
   }

   public void setComment_no(int comment_no) {
      this.comment_no = comment_no;
   }

   public String getUser_id() {
      return user_id;
   }

   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }

   public int getCommunity_no() {
      return community_no;
   }

   public void setCommunity_no(int community_no) {
      this.community_no = community_no;
   }

   public String getComment_content() {
      return comment_content;
   }

   public void setComment_content(String comment_content) {
      this.comment_content = comment_content;
   }

   public int getComment_level() {
      return comment_level;
   }

   public void setComment_level(int comment_level) {
      this.comment_level = comment_level;
   }

   public int getComment_seq() {
      return comment_seq;
   }

   public void setComment_seq(int comment_seq) {
      this.comment_seq = comment_seq;
   }

   public Date getComment_date() {
      return comment_date;
   }

   public void setComment_date(Date comment_date) {
      this.comment_date = comment_date;
   }

   public int getComment_ref() {
      return comment_ref;
   }

   public void setComment_ref(int comment_ref) {
      this.comment_ref = comment_ref;
   }

   @Override
   public String toString() {
      return "CommunityReply [comment_no=" + comment_no + ", user_id=" + user_id + ", community_no=" + community_no
            + ", comment_content=" + comment_content + ", comment_level=" + comment_level + ", comment_seq="
            + comment_seq + ", comment_date=" + comment_date + ", comment_ref=" + comment_ref + "]";
   }
   
   
   
   
}