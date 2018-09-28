package org.kh.westival.ticket.model.vo;

import java.sql.Date;

public class Refund implements java.io.Serializable {
   private static final long serialVersionUID = 1L;
   private String ticket_no;
   private int no;
   private String user_id;
   private String refund_content;
   private String refund_state;
   private Date refund_date;
   private Date refund_final_date;
   
   public Refund()  { }

   public Refund(String ticket_no, int no, String user_id, String refund_content, String refund_state,
         Date refund_date, Date refund_final_date) {
      super();
      this.ticket_no = ticket_no;
      this.no = no;
      this.user_id = user_id;
      this.refund_content = refund_content;
      this.refund_state = refund_state;
      this.refund_date = refund_date;
      this.refund_final_date = refund_final_date;
   }

   public String getTicket_no() {
      return ticket_no;
   }

   public void setTicket_no(String ticket_no) {
      this.ticket_no = ticket_no;
   }

   public String getUser_id() {
      return user_id;
   }

   public void setUser_id(String user_id) {
      this.user_id = user_id;
   }

   public String getRefund_content() {
      return refund_content;
   }

   public void setRefund_content(String refund_content) {
      this.refund_content = refund_content;
   }

   public String getRefund_state() {
      return refund_state;
   }

   public void setRefund_state(String refund_state) {
      this.refund_state = refund_state;
   }

   public Date getRefund_date() {
      return refund_date;
   }

   public void setRefund_date(Date refund_date) {
      this.refund_date = refund_date;
   }

   public Date getRefund_final_date() {
      return refund_final_date;
   }

   public void setRefund_final_date(Date refund_final_date) {
      this.refund_final_date = refund_final_date;
   }
   
   @Override
   public String toString() {
      return ticket_no +  ", " + this.no + ", " + this.user_id + ", " + this.refund_content
            + ", " + this.refund_state +", " + this.refund_date + ", " + this.refund_final_date;
   }
}