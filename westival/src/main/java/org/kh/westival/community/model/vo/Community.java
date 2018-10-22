package org.kh.westival.community.model.vo;

import java.sql.Date;

public class Community implements java.io.Serializable{
   private final static long serialVersionUID = 10L;
   
   private int community_no;            //글번호
   private int no;                        //축제번호
   private String user_id;                  //작성자
   private String category;               //글분류
   private String title;                     //글제목
   private String content;               //글내용
   private int read_count;               //조회수
   private Date community_date;         //작성일자
   private int user_count;               //동행인원
   
   public Community(){}

	public Community(int community_no, int no, String user_id, String category, String title, String content,
			int read_count, Date community_date, int user_count) {
		super();
		this.community_no = community_no;
		this.no = no;
		this.user_id = user_id;
		this.category = category;
		this.title = title;
		this.content = content;
		this.read_count = read_count;
		this.community_date = community_date;
		this.user_count = user_count;
	}

	public int getCommunity_no() {
		return community_no;
	}

	public void setCommunity_no(int community_no) {
		this.community_no = community_no;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	public Date getCommunity_date() {
		return community_date;
	}

	public void setCommunity_date(Date community_date) {
		this.community_date = community_date;
	}

	public int getUser_count() {
		return user_count;
	}

	public void setUser_count(int user_count) {
		this.user_count = user_count;
	}

	@Override
	public String toString() {
		return "Community [community_no=" + community_no + ", no=" + no + ", user_id=" + user_id + ", category="
				+ category + ", title=" + title + ", content=" + content + ", read_count=" + read_count
				+ ", community_date=" + community_date + ", user_count=" + user_count + "]";
	}

	
	
  }