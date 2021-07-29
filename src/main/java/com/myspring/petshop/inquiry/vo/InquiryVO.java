package com.myspring.petshop.inquiry.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("inquiryVO")
public class InquiryVO {
	private int inq_no;
	private int inq_originNo;
	private int inq_groupOrd;
	private int inq_groupLayer;
	private String p_code;
	private String inq_title;
	private String inq_writer;
	private String inq_content;
	private Timestamp inq_date;
	private String inq_secret;
	private int inq_hits;
	
	public InquiryVO () {
		
	}
	
	
	public int getInq_no() {
		return inq_no;
	}
	public int getInq_originNo() {
		return inq_originNo;
	}
	public int getInq_groupOrd() {
		return inq_groupOrd;
	}
	public int getInq_groupLayer() {
		return inq_groupLayer;
	}
	public String getP_code() {
		return p_code;
	}
	public String getInq_title() {
		return inq_title;
	}
	public String getInq_writer() {
		return inq_writer;
	}
	public String getInq_content() {
		return inq_content;
	}
	public Timestamp getInq_date() {
		return inq_date;
	}
	public String getInq_secret() {
		return inq_secret;
	}
	public int getInq_hits() {
		return inq_hits;
	}
	
	
	public void setInq_no(int inq_no) {
		this.inq_no = inq_no;
	}
	public void setInq_originNo(int inq_originNo) {
		this.inq_originNo = inq_originNo;
	}
	public void setInq_groupOrd(int inq_groupOrd) {
		this.inq_groupOrd = inq_groupOrd;
	}
	public void setInq_groupLayer(int inq_groupLayer) {
		this.inq_groupLayer = inq_groupLayer;
	}
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	public void setInq_title(String inq_title) {
		this.inq_title = inq_title;
	}
	public void setInq_writer(String inq_writer) {
		this.inq_writer = inq_writer;
	}
	public void setInq_content(String inq_content) {
		this.inq_content = inq_content;
	}
	public void setInq_date(Timestamp inq_date) {
		this.inq_date = inq_date;
	}
	public void setInq_secret(String inq_secret) {
		this.inq_secret = inq_secret;
	}
	public void setInq_hits(int inq_hits) {
		this.inq_hits = inq_hits;
	}
}