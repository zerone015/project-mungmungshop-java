package com.myspring.petshop.payment.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class OrderVO {

	private String order_code;
	private int member_num;
	private Timestamp order_date;
	private String address_recipent;
	private int order_totalQuantity;
	private int order_totalPrice;
	
	public OrderVO() {
		
	}
	
	public String getOrder_code() {
		return order_code;
	}
	
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	
	public int getMember_num() {
		return member_num;
	}
	
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
	public Timestamp getOrder_date() {
		return order_date;
	}
	
	public void setOrder_date(Timestamp order_date) {
		this.order_date = order_date;
	}
	
	public String getAddress_recipent() {
		return address_recipent;
	}
	
	public void setAddress_recipent(String address_recipent) {
		this.address_recipent = address_recipent;
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
	
}
