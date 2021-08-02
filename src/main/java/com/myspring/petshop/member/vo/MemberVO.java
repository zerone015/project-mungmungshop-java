package com.myspring.petshop.member.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO{
	private int member_num;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_email;
	private String member_phone;
	private String member_nick;
	private Timestamp member_joindate;
	private int member_manager;
	private Timestamp member_logindate;
	private int member_point;
	private String member_type;
	
	public MemberVO() {
		
	}
	
	public int getMember_num() {
		return member_num;
	}
	
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
	public String getMember_id() {
		return member_id;
	}
	
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	
	public String getMember_pw() {
		return member_pw;
	}
	
	public void setMember_pw(String member_pw) {
		this.member_pw=member_pw;
	}
	
	public String getMember_name() {
		return member_name;
	}
	
	public void setMember_name(String member_name) {
		this.member_name=member_name;
	}
	
	public String getMember_email() {
		return member_email;
	}
	
	public void setMember_email(String member_email) {
		this.member_email=member_email;
	}
	
	public String getMember_phone() {
		return member_phone;
	}
	
	public void setMember_phone(String member_phone) {
		this.member_phone=member_phone;
	}
	
	public String getMember_nick() {
		return member_nick;
	}
	
	public void setMember_nick(String member_nick) {
		this.member_nick=member_nick;
	}
	
	public Timestamp getMember_joindate() {
		return member_joindate;
	}
	
	public void setMember_joindate(Timestamp member_joindate) {
		this.member_joindate = member_joindate;
	}
	
	public int getMember_manager() {
		return member_manager;
	}
	
	public void setMember_manager(int member_manager) {
		this.member_manager = member_manager;
	}
	
	public Timestamp getMember_logindate() {
		return member_logindate;
	}
	
	public void setMember_logindate(Timestamp member_logindate) {
		this.member_logindate = member_logindate;
	}
	
	public int getMember_point() {
		return member_point;
	}
	
	public void setMember_point(int member_point) {
		this.member_point = member_point;
	}
	
	public String getMember_type() {
		return member_type;
	}
	
	public void setMember_type(String member_type) {
		this.member_type=member_type;
	}
}