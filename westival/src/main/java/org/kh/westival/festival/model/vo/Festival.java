package org.kh.westival.festival.model.vo;

import java.sql.Date;

public class Festival implements java.io.Serializable {
   private static final long serialVersionUID = 5L;
   
   private int no; // 축제 번호
   private String user_id; // 회원 아이디
   private String name; // 축제명
   private String address; //주소
   private String original_img_name; // 원본 이미지 이름
   private String new_img_name; // 변경 이미지 이름
   private String content; // 상세 내용
   private Date start_date; // 시작 날짜
   private Date end_date; // 끝 날짜
   private String theme; // 테마
   private String telephone; // 연락처
   private String manager; // 주최/주관
   private String ticket; // 티켓 유무
   private String file_name; // 첨부파일명
   private String tag; // 태그
   private int read_count; // 조회수
   private int recommend; // 추천수
   
   public Festival (){}

   public Festival(int no, String user_id, String name, String address, String original_img_name, String new_img_name,
         String content, Date start_date, Date end_date, String theme, String telephone, String manager,
         String ticket, String file_name, String tag, int read_count, int recommend) {
      super();
      this.no = no;
      this.user_id = user_id;
      this.name = name;
      this.address = address;
      this.original_img_name = original_img_name;
      this.new_img_name = new_img_name;
      this.content = content;
      this.start_date = start_date;
      this.end_date = end_date;
      this.theme = theme;
      this.telephone = telephone;
      this.manager = manager;
      this.ticket = ticket;
      this.file_name = file_name;
      this.tag = tag;
      this.read_count = read_count;
      this.recommend = recommend;
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

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getAddress() {
      return address;
   }

   public void setAddress(String address) {
      this.address = address;
   }

   public String getOriginal_img_name() {
      return original_img_name;
   }

   public void setOriginal_img_name(String original_img_name) {
      this.original_img_name = original_img_name;
   }

   public String getNew_img_name() {
      return new_img_name;
   }

   public void setNew_img_name(String new_img_name) {
      this.new_img_name = new_img_name;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   public Date getStart_date() {
      return start_date;
   }

   public void setStart_date(Date start_date) {
      this.start_date = start_date;
   }

   public Date getEnd_date() {
      return end_date;
   }

   public void setEnd_date(Date end_date) {
      this.end_date = end_date;
   }

   public String getTheme() {
      return theme;
   }

   public void setTheme(String theme) {
      this.theme = theme;
   }

   public String getTelephone() {
      return telephone;
   }

   public void setTelephone(String telephone) {
      this.telephone = telephone;
   }

   public String getManager() {
      return manager;
   }

   public void setManager(String manager) {
      this.manager = manager;
   }

   public String getTicket() {
      return ticket;
   }

   public void setTicket(String ticket) {
      this.ticket = ticket;
   }

   public String getFile_name() {
      return file_name;
   }

   public void setFile_name(String file_name) {
      this.file_name = file_name;
   }

   public String getTag() {
      return tag;
   }

   public void setTag(String tag) {
      this.tag = tag;
   }

   public int getRead_count() {
      return read_count;
   }

   public void setRead_count(int read_count) {
      this.read_count = read_count;
   }

   public int getRecommend() {
      return recommend;
   }

   public void setRecommend(int recommend) {
      this.recommend = recommend;
   }

   @Override
   public String toString() {
      return "Festival [no=" + no + ", user_id=" + user_id + ", name=" + name + ", address=" + address
            + ", original_img_name=" + original_img_name + ", new_img_name=" + new_img_name + ", content=" + content
            + ", start_date=" + start_date + ", end_date=" + end_date + ", theme=" + theme + ", telephone="
            + telephone + ", manager=" + manager + ", ticket=" + ticket + ", file_name=" + file_name + ", tag="
            + tag + ", read_count=" + read_count + ", recommend=" + recommend + "]";
   }
   
}