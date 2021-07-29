package com.myspring.petshop.manager.order.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class DeliveryVO {
	private String order_code;
	private int member_num;
	private String deli_name;
	private String deli_tel;
	private String deli_address1;
	private String deli_address2;
	private String deli_address3;
	private String deli_request;

	
	public DeliveryVO() {
		
	}
	
	public int getMember_num() {
		return member_num;
	}
	
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
	
	public String getDeli_name() {
		return deli_name;
	}
	
	public void setDeli_name(String deli_name) {
		this.deli_name = deli_name;
	}
	
	
	public String getDeli_address1() {
		return deli_address1;
	}
	
	public void setDeli_address1(String deli_address1) {
		this.deli_address1 = deli_address1;
	}
	
	public String getDeli_address2() {
		return deli_address2;
	}
	
	public void Deli_address2(String deli_address2) {
		this.deli_address2 = deli_address2;
	}
	
	public String getDeli_address3() {
		return deli_address3;
	}
	
	public void setDeli_address3(String deli_address3) {
		this.deli_address3 = deli_address3;
	}
	
	public String getDeli_tel() {
		return deli_tel;
	}
	
	public void setDeli_tel(String deli_tel) {
		this.deli_tel = deli_tel;
	}
	
	public String getDeli_request() {
		return deli_request;
	}
	
	public void setDeli_request(String deli_request) {
		this.deli_request = deli_request;
	}
	
	public String getOrder_code() {
		return order_code;
	}
	
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	
}
