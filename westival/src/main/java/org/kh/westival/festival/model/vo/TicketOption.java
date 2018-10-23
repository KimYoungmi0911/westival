package org.kh.westival.festival.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class TicketOption implements java.io.Serializable {
   private static final long serialVersionUID = 2L;
   
   private String ticket_no; // 티켓 번호
   private String user_id; // 회원 아이디
   private int no; // 축제 번호
   private String ticket_name; // 티켓명
   private int ticket_price; // 티켓 가격
   private int ticket_quantity; // 티켓 판매 수량
   private String company_name; // 회사명
   private String ceo_name; // 대표자명
   private int company_no; // 사업자번호
   private String phone; // 연락처
   private String bank_name; // 은행명
   private String account_holder_name; // 예금주명
   private String account_no; // 계좌번호
   private Date registration_date; // 등록일
   
   public TicketOption(){}
   
   
	
	public TicketOption(String ticket_no, String user_id, int no, String ticket_name, int ticket_price, int ticket_quantity,
		String company_name, String ceo_name, int company_no, String phone, String bank_name,
		String account_holder_name, String account_no, Date registration_date) {
		super();
		this.ticket_no = ticket_no;
		this.user_id = user_id;
		this.no = no;
		this.ticket_name = ticket_name;
		this.ticket_price = ticket_price;
		this.ticket_quantity = ticket_quantity;
		this.company_name = company_name;
		this.ceo_name = ceo_name;
		this.company_no = company_no;
		this.phone = phone;
		this.bank_name = bank_name;
		this.account_holder_name = account_holder_name;
		this.account_no = account_no;
		this.registration_date = registration_date;
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
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getTicket_name() {
		return ticket_name;
	}
	
	public void setTicket_name(String ticket_name) {
		this.ticket_name = ticket_name;
	}
	
	public int getTicket_price() {
		return ticket_price;
	}
	
	public void setTicket_price(int ticket_price) {
		this.ticket_price = ticket_price;
	}
	
	public int getTicket_quantity() {
		return ticket_quantity;
	}
	
	public void setTicket_quantity(int ticket_quantity) {
		this.ticket_quantity = ticket_quantity;
	}
	
	public String getCompany_name() {
		return company_name;
	}
	
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	
	public String getCeo_name() {
		return ceo_name;
	}
	
	public void setCeo_name(String ceo_name) {
		this.ceo_name = ceo_name;
	}
	
	public int getCompany_no() {
		return company_no;
	}
	
	public void setCompany_no(int company_no) {
		this.company_no = company_no;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getBank_name() {
		return bank_name;
	}
	
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	
	public String getAccount_holder_name() {
		return account_holder_name;
	}
	
	public void setAccount_holder_name(String account_holder_name) {
		this.account_holder_name = account_holder_name;
	}
	
	public String getAccount_no() {
		return account_no;
	}
	
	public void setAccount_no(String account_no) {
		this.account_no = account_no;
	}
	
	public Date getRegistration_date() {
		return registration_date;
	}
	
	public void setRegistration_date(Date registration_date) {
		this.registration_date = registration_date;
	}



	@Override
	public String toString() {
		return "TicketOption [ticket_no=" + ticket_no + ", user_id=" + user_id + ", no=" + no + ", ticket_name="
				+ ticket_name + ", ticket_price=" + ticket_price + ", ticket_quantity=" + ticket_quantity
				+ ", company_name=" + company_name + ", ceo_name=" + ceo_name + ", company_no=" + company_no
				+ ", phone=" + phone + ", bank_name=" + bank_name + ", account_holder_name=" + account_holder_name
				+ ", account_no=" + account_no + ", registration_date=" + registration_date + "]";
	}
	
	
	   
}