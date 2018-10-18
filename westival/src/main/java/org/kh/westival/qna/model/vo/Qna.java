package org.kh.westival.qna.model.vo;

import java.sql.Date;

public class Qna implements java.io.Serializable{
   private final static long serialVersionUID = 666L;
   
   private int qna_no;         //글번호
   private String user_id;         //아이디
   private String category;      //분류
   private String state;         //상태
   private Date qna_date;      //작성일
   private String subject;      //제목   
   private String content;      //내용   
   private int read_count;      //조회수
   private String file_name;      //첨부파일
   private String active;			//공개여부
   
   public Qna(){}
   
	public Qna(int qna_no, String user_id, String category, String state, Date qna_date, String subject, String content,
			int read_count, String file_name, String active) {
		super();
		this.qna_no = qna_no;
		this.user_id = user_id;
		this.category = category;
		this.state = state;
		this.qna_date = qna_date;
		this.subject = subject;
		this.content = content;
		this.read_count = read_count;
		this.file_name = file_name;
		this.active = active;
	}

	public int getQna_no() {
		return qna_no;
	}

	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	@Override
	public String toString() {
		return "Qna [qna_no=" + qna_no + ", user_id=" + user_id + ", category=" + category + ", state=" + state
				+ ", qna_date=" + qna_date + ", subject=" + subject + ", content=" + content + ", read_count="
				+ read_count + ", file_name=" + file_name + ", active=" + active + "]";
	}
   
   
}