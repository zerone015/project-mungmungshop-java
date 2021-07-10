package com.myspring.petshop.mail.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("mailVO")
public class MailVO{
	private String Member_ID;
	private String Member_PW;
	private String Member_name;
	private String Member_email;
	private String Member_Phone;
	private String Member_Nick;
	private Timestamp Member_joindate;
	
	public MailVO() {
		
	}
	public String getMember_ID() {
		return Member_ID;
	}
	
	public void setMember_ID(String Member_ID) {
		this.Member_ID = Member_ID;
	}
	
	public String getMember_PW() {
		return Member_PW;
	}
	
	public void setMember_PW(String Member_PW) {
		this.Member_PW=Member_PW;
	}
	
	public String getMember_name() {
		return Member_name;
	}
	
	public void setMember_name(String Member_name) {
		this.Member_name=Member_name;
	}
	
	public String getMember_email() {
		return Member_email;
	}
	
	public void setMember_email(String Member_email) {
		this.Member_email=Member_email;
	}
	
	public String getMember_Phone() {
		return Member_Phone;
	}
	
	public void setMember_Phone(String Member_Phone) {
		this.Member_Phone=Member_Phone;
	}
	
	public String getMember_Nick() {
		return Member_Nick;
	}
	
	public void setMember_Nick(String Member_Nick) {
		this.Member_Nick=Member_Nick;
	}
	
	public Timestamp getMember_joindate() {
		return Member_joindate;
	}
	
	public void setMember_joindate(Timestamp Member_joindate) {
		this.Member_joindate = Member_joindate;
	}
}