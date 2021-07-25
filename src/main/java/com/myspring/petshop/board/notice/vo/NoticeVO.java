package com.myspring.petshop.board.notice.vo;



import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("noticeVO")
public class NoticeVO {
	private int notice_no;
	private String notice_title;
	private String notice_writer;
	private String notice_content;
	private Date notice_date;
	private int notice_hits;
	
	public NoticeVO() {
	
	}
	
	public int getNotice_no() {
		return notice_no;
	}
	
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	
	public String getNotice_title() {
		return notice_title;
	}
	
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	
	public  String getNotice_writer() {
		return notice_writer;
	}
	
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	
	public String getNotice_content() {
		return notice_content;
	}
	
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	
	public Date getNotice_date() {
		return notice_date;
	}
	
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	
	public int getNotice_hits() {
		return notice_hits;
	}
	
	public void setNotice_hits(int notice_hits) {
		this.notice_hits = notice_hits;
	}
}