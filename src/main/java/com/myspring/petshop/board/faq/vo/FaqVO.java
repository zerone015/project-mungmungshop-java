package com.myspring.petshop.board.faq.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("faqVO")
public class FaqVO {
	private int faq_no;
	private String faq_title;
	private String faq_writer;
	private String faq_content;
	private Timestamp faq_date; 
	private int faq_hits;
	
	public FaqVO() {
		
	}
	
	
	public int getFaq_no() {
		return faq_no;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public String getFaq_writer() {
		return faq_writer;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public Timestamp getFaq_date() {
		return faq_date;
	}
	public int getFaq_hits() {
		return faq_hits;
	}
	
	
	public void setFaq_no(int faq_no) {
		this.faq_no = faq_no;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public void setFaq_writer(String faq_writer) {
		this.faq_writer = faq_writer;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public void setFaq_date(Timestamp faq_date) {
		this.faq_date = faq_date;
	}
	public void setFaq_hits(int faq_hits) {
		this.faq_hits = faq_hits;
	}
}