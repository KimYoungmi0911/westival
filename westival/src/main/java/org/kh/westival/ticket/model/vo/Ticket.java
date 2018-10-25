package org.kh.westival.ticket.model.vo;

import java.sql.Date;

public class Ticket implements java.io.Serializable {
	private final static long serialVersionUID = 4001L;

	private String ticket_no;
	private int no;
	private String user_id;
	private Date ticket_date;
	private int ticket_count;
	private String pay_type;
	private Date pay_date;
	private int price;
	private String state;
	private String import_uid;

	public Ticket() {
	}

	public Ticket(String ticket_no, int no, String user_id, Date ticket_date, int ticket_count, String pay_type,
			Date pay_date, int price, String state, String import_uid) {
		super();
		this.ticket_no = ticket_no;
		this.no = no;
		this.user_id = user_id;
		this.ticket_date = ticket_date;
		this.ticket_count = ticket_count;
		this.pay_type = pay_type;
		this.pay_date = pay_date;
		this.price = price;
		this.state = state;
		this.import_uid = import_uid;
	}

	public String getTicket_no() {
		return ticket_no;
	}

	public void setTicket_no(String ticket_no) {
		this.ticket_no = ticket_no;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	public String getPay_type() {
		return pay_type;
	}

	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getImport_uid() {
		return import_uid;
	}

	public void setImport_uid(String import_uid) {
		this.import_uid = import_uid;
	}

	@Override
	public String toString() {
		return "Ticket [ticket_no=" + ticket_no + ", no=" + no + ", user_id=" + user_id + ", ticket_date=" + ticket_date
				+ ", ticket_count=" + ticket_count + ", pay_type=" + pay_type + ", pay_date=" + pay_date + ", price="
				+ price + ", state=" + state + ", import_uid=" + import_uid + "]";
	}
	
	
}