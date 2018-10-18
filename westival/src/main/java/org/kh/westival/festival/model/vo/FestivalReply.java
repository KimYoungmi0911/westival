package org.kh.westival.festival.model.vo;

import java.sql.Date;

public class FestivalReply implements java.io.Serializable{
	private final static long serialVersionUID = 5050L;
	
	private int reply_no;
	private String reply_user_id;
	private String reply_content;
	private Date reply_date;
	private int festival_no;
	private int reply_seq;
	
	public FestivalReply() {
		super();
	}

	public FestivalReply(int reply_no, String reply_user_id, String reply_content, Date reply_date, int festival_no,
			int reply_seq) {
		super();
		this.reply_no = reply_no;
		this.reply_user_id = reply_user_id;
		this.reply_content = reply_content;
		this.reply_date = reply_date;
		this.festival_no = festival_no;
		this.reply_seq = reply_seq;
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

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public Date getReply_date() {
		return reply_date;
	}

	public void setReply_date(Date reply_date) {
		this.reply_date = reply_date;
	}

	public int getFestival_no() {
		return festival_no;
	}

	public void setFestival_no(int festival_no) {
		this.festival_no = festival_no;
	}

	public int getreply_seq() {
		return reply_seq;
	}

	public void setreply_seq(int reply_seq) {
		this.reply_seq = reply_seq;
	}

	@Override
	public String toString() {
		return "FestivalReply [reply_no=" + reply_no + ", reply_user_id=" + reply_user_id + ", reply_content="
				+ reply_content + ", reply_date=" + reply_date + ", festival_no=" + festival_no + ", festival_seq="
				+ reply_seq + "]";
	}
	
}
