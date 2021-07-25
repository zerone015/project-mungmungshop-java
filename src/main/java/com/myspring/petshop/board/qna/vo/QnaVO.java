package com.myspring.petshop.board.qna.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("qnaVO")
public class QnaVO {
	private int qna_no;
	private int qna_originNo;
	private int qna_groupOrd;
	private int qna_groupLayer;
	private String qna_title;
	private String qna_writer;
	private String qna_content;
	private Timestamp qna_date;
	private String qna_secret;
	private int qna_hits;
	
	public QnaVO () {
		
	}
	
	
	public int getQna_no() {
		return qna_no;
	}
	public int getQna_originNo() {
		return qna_originNo;
	}
	public int getQna_groupOrd() {
		return qna_groupOrd;
	}
	public int getQna_groupLayer() {
		return qna_groupLayer;
	}
	public String getQna_title() {
		return qna_title;
	}
	public String getQna_writer() {
		return qna_writer;
	}
	public String getQna_content() {
		return qna_content;
	}
	public Timestamp getQna_date() {
		return qna_date;
	}
	public String getQna_secret() {
		return qna_secret;
	}
	public int getQna_hits() {
		return qna_hits;
	}
	
	
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public void setQna_originNo(int qna_originNo) {
		this.qna_originNo = qna_originNo;
	}
	public void setQna_groupOrd(int qna_groupOrd) {
		this.qna_groupOrd = qna_groupOrd;
	}
	public void setQna_groupLayer(int qna_groupLayer) {
		this.qna_groupLayer = qna_groupLayer;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public void setQna_date(Timestamp qna_date) {
		this.qna_date = qna_date;
	}
	public void setQna_secret(String qna_secret) {
		this.qna_secret = qna_secret;
	}
	public void setQna_hits(int qna_hits) {
		this.qna_hits = qna_hits;
	}
}