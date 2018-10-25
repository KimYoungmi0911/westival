package org.kh.westival.admin.model.vo;

import java.sql.Date;

public class Admin implements java.io.Serializable{
	private final static long serialVersionUID = 4230L;
	
	private String user_id;
	private String name; 
	private String ticket_no;
	private Date ticket_date;
	private int ticket_count;
	private int price;
	private String pay_type;
	private String state;
	private String user_name;
	
	public Admin(){}

	public Admin(String user_id, String name, String ticket_no, Date ticket_date, int ticket_count, int price,
			String pay_type, String state, String user_name) {
		super();
		this.user_id = user_id;
		this.name = name;
		this.ticket_no = ticket_no;
		this.ticket_date = ticket_date;
		this.ticket_count = ticket_count;
		this.price = price;
		this.pay_type = pay_type;
		this.state = state;
		this.user_name = user_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTicket_no() {
		return ticket_no;
	}

	public void setTicket_no(String ticket_no) {
		this.ticket_no = ticket_no;
	}

	public Date getTicket_date() {
		return ticket_date;
	}

	public void setTicket_date(Date ticket_date) {
		this.ticket_date = ticket_date;
	}

	public int getTicket_count() {
		return ticket_count;
	}

	public void setTicket_count(int ticket_count) {
		this.ticket_count = ticket_count;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getPay_type() {
		return pay_type;
	}

	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	@Override
	public String toString() {
		return "Admin [user_id=" + user_id + ", name=" + name + ", ticket_no=" + ticket_no + ", ticket_date="
				+ ticket_date + ", ticket_count=" + ticket_count + ", price=" + price + ", pay_type=" + pay_type
				+ ", state=" + state + ", user_name=" + user_name + "]";
	}

	

	
	
}


