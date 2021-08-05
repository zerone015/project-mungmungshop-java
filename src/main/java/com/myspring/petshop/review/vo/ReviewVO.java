package com.myspring.petshop.review.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("reviewVO")
public class ReviewVO {
	private int review_num;
	private String p_code;
	private String memberNick;
	private String review_title;
	private String review_content;
	private String review_recommend;
	private Timestamp review_date;
	private String review_imageFileName;
	
	public int getReview_num() {
		return review_num;
	}
	public String getP_code() {
		return p_code;
	}	
	public String getMemberNick() {
		return memberNick;
	}	
	public String getReview_title() {
		return review_title;
	}	
	public String getReview_content() {
		return review_content;
	}	
	public String getReview_recommend() {
		return review_recommend;
	}
	public Timestamp getReview_date() {
		return review_date;
	}	
	public String getReview_imageFileName() {
		return review_imageFileName;
	}
	
	
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	
	public void setMember_nick(String memberNick) {
		this.memberNick = memberNick;
	}
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public void setReview_recommend(String review_recommend) {
		this.review_recommend = review_recommend;
	}
	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}
	
	public void setReview_imageFileName(String review_imageFileName) {
		this.review_imageFileName = review_imageFileName;
	}
}
