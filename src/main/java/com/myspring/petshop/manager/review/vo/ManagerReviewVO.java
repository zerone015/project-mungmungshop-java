package com.myspring.petshop.manager.review.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class ManagerReviewVO {
	private int review_num;
	private String p_code;
	private String member_nick;
	private String review_title;
	private String review_content;
	private String review_recommend;
	private Timestamp review_date;
	private String review_imageFileName;
	private String review_test;
	
	private String p_name;
	private String p_imageFileName;
	
	public ManagerReviewVO() {
		
	}
	
	public int getReview_num() {
		return review_num;
	}
	
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	
	public String getP_code() {
		return p_code;
	}
	
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	
	public String getMember_nick() {
		return member_nick;
	}
	
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	
	public String getReview_title() {
		return review_title;
	}
	
	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}
	
	public String getReview_content() {
		return review_content;
	}
	
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	
	public String getReview_recommend() {
		return review_recommend;
	}
	
	public void setReview_recommend(String review_recommend) {
		this.review_recommend = review_recommend;
	}
	
	public Timestamp getReview_date() {
		return review_date;
	}
	
	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}
	
	public String getReview_imageFileName() {
		return review_imageFileName;
	}
	
	public void setReview_imageFileName(String review_imageFileName) {
		this.review_imageFileName = review_imageFileName;
	}
	
	public String getReview_test() {
		return review_test;
	}
	
	public void setReview_test(String review_test) {
		this.review_test = review_test;
	}
	
	public String getP_name() {
		return p_name;
	}
	
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	
	public String getP_imageFileName() {
		return p_imageFileName;
	}
	
	public void setP_imageFileName(String p_imageFileName) {
		this.p_imageFileName = p_imageFileName;
	}
}
