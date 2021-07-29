package com.myspring.petshop.manager.order.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class OrderVO {
	private String order_code;
	private int order_num;	
	private int member_num;
	private String member_name;
	private String member_phone;
	private String member_email;
	private String address_recipent;
	private int order_usePoint;
	private int order_addPoint;
	private String order_method;
	private int order_totalQuantity;
	private int order_totalPrice;
	private Timestamp order_date;

	
	public OrderVO() {
		
	}
	
	
	public int getOrder_num() {
		return order_num;
	}
	
	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}
	
	
	public int getMember_num() {
		return member_num;
	}
	
	public void setMember_num(int member_num) {
		this.member_num = member_num;
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
	
	
	public String getAddress_recipent() {
		return address_recipent;
	}
	
	public void setAddress_recipent(String address_recipent) {
		this.address_recipent = address_recipent;
	}
	
	
	public String getOrder_code() {
		return order_code;
	}
	
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	
	public int getOrder_usePoint() {
		return order_usePoint;
	}
	
	public void setOrder_usePoint(int order_usePoint) {
		this.order_usePoint = order_usePoint;
	}
	
	public int getOrder_addPoint() {
		return order_addPoint;
	}
	
	public void setOrder_addPoint(int order_addPoint) {
		this.order_addPoint = order_addPoint;
	}
	
	
	public String getOrder_method() {
		return order_method;
	}
	
	public void setOrder_method(String order_method) {
		this.order_method = order_method;
	}
	
	public int getOrder_totalQuantity() {
		return order_totalQuantity;
	}
	
	public void setOrder_totalQuantity(int order_totalQuantity) {
		this.order_totalQuantity = order_totalQuantity;
	}
	
	public int getOrder_totalPrice() {
		return order_totalPrice;
	}
	
	public void setOrder_totalPrice(int order_totalPrice) {
		this.order_totalPrice = order_totalPrice;
	}
	
	public Timestamp getOrder_date() {
		return order_date;
	}
	
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
}
