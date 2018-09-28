package org.kh.westival.festival.model.vo;

public class Scrap implements java.io.Serializable{
   private final static long serialVersionUID = 999L;
   
   private String user_id;
   private int no;
   
   public Scrap(){}

   public Scrap(String user_id, int no) {
      super();
      this.user_id = user_id;
      this.no = no;
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

   @Override
   public String toString() {
      return "Scrap [user_id=" + user_id + ", no=" + no + "]";
   }
   
   
}