package com.myspring.petshop.payment.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class OrderDetailVO {
	private String order_detailCode;
	private String order_code;
	private String p_code;
	private int order_quantity;
	private int p_price;
	private int order_usePoint;
	private int order_addPoint;
	private int order_price;
	private String order_method;
	private int member_num;
	private Timestamp order_date;
	private String address_recipent;
	private int order_totalPrice;
	
	public OrderDetailVO() {
		
	}
	
	public String getOrder_detailCode() {
		return order_detailCode;
	}
	
	public void setOrder_detailCode(String order_detailCode) {
		this.order_detailCode = order_detailCode;
	}
	
	public String getOrder_code() {
		return order_code;
	}
	
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	
	public String getP_code() {
		return p_code;
	}
	
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	
	public int getOrder_quantity() {
		return order_quantity;
	}
	
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}
	
	public int getP_price() {
		return p_price;
	}
	
	public void setP_price(int p_price) {
		this.p_price = p_price;
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
	
	public int getOrder_price() {
		return order_price;
	}
	
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	
	public String getOrder_method() {
		return order_method;
	}
	
	public void setOrder_method(String order_method) {
		this.order_method = order_method;
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
	
	public int getOrder_totalPrice() {
		return order_totalPrice;
	}
	
	public void setOrder_totalPrice(int order_totalPrice) {
		this.order_totalPrice = order_totalPrice;
	}
	
}
