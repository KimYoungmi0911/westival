package org.kh.westival.festival.model.vo;

import java.sql.Date;

public class Recommend implements java.io.Serializable{
   private final static long serialVersionUID = 888L;
   
   private String user_id;
   private int no;
   private Date recommend_date;
   
   public Recommend(){}

   public Recommend(String user_id, int no, Date recommend_date) {
      super();
      this.user_id = user_id;
      this.no = no;
      this.recommend_date = recommend_date;
   }

   public String getUser_id() {
      return user_id;
   }

   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }

   public int getNo() {
      return no;
   }

   public void setNo(int no) {
      this.no = no;
   }

   public Date getRecommend_date() {
      return recommend_date;
   }

   public void setRecommend_date(Date recommend_date) {
      this.recommend_date = recommend_date;
   }

   @Override
   public String toString() {
      return "Recommend [user_id=" + user_id + ", no=" + no + ", recommend_date=" + recommend_date + "]";
   }
   
   
}