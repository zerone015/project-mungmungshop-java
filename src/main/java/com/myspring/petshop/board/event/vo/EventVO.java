package com.myspring.petshop.board.event.vo;

import java.sql.Date;
import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("eventVO")
public class EventVO {
	private int event_no;
	private String event_title;
	private String event_writer;
	private String event_content;
	private Timestamp event_date; 
	private int event_hits;
	private String event_image_FileName;
	
	public EventVO() {
		
	}
	
//	public EventVO(int event_no, String event_title, String event_writer, String event_content, Date event_date, int event_hits, String event_image_FileName) {
//		event_no = this.event_no;
//		event_title = this.event_title;
//		event_writer = this.event_writer;
//		event_content = this.event_content;
//		event_date = this.event_date;
//		event_hits = this.event_hits;
//		event_image_FileName = this.event_image_FileName;
//	}
	
//	public EventVO(String event_title, String event_writer, String event_content, String event_image_FileName) {
//		event_title = this.event_title;
//		event_writer = this.event_writer;
//		event_content = this.event_content;
//		event_image_FileName = this.event_image_FileName;
//	}
	
	public int getEvent_no() {
		return event_no;
	}
	public String getEvent_title() {
		return event_title;
	}
	public String getEvent_writer() {
		return event_writer;
	}
	public String getEvent_content() {
		return event_content;
	}
	public Timestamp getEvent_date() {
		return event_date;
	}
	public int getEvent_hits() {
		return event_hits;
	}
	public String getEvent_image_FileName() {
		return event_image_FileName;
	}
	

	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public void setEvent_writer(String event_writer) {
		this.event_writer = event_writer;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	public void setEvent_date(Timestamp event_date) {
		this.event_date = event_date;
	}
	public void setEvent_hits(int event_hits) {
		this.event_hits = event_hits;
	}
	public void setEvent_image_FileName(String event_image_FileName) {
		this.event_image_FileName = event_image_FileName;
	}
}