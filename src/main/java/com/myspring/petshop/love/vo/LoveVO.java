package com.myspring.petshop.love.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class LoveVO{
	private int love_num;
	private int member_num;
	private String p_code;
	
	public LoveVO() {
		
	}
	
	public int getLove_num() {
		return love_num;
	}
	
	public void setLove_num(int love_num) {
		this.love_num=love_num;
	}
	
	public int getMember_num() {
		return member_num;
	}
	
	public void setMember_num(int member_num) {
		this.member_num=member_num;
	}
	
	public String getP_code() {
		return p_code;
	}
	
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
}