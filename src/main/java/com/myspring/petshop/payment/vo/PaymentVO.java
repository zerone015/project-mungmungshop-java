package com.myspring.petshop.payment.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class PaymentVO {
	
	private int address_num;
	private String address_recipent;
	private String address_phone;
	private String address_1;
	private String address_2;
	private String address_3;
	private String address_request;
	
	private String p_code;
	private String p_brand;
	private String p_name;
	private int p_price;
	private String p_imageFileName;
	
	private int member_num;
	
	private int cart_quantity;
	private int order_quantity;
	
	public int getAddress_num() {
		return address_num;
	}
	
	public void setAddress_num(int address_num) {
		this.address_num = address_num;
	}
	
	
	public String getAddress_recipent() {
		return address_recipent;
	}
	
	public void setAddress_num(String address_recipent) {
		this.address_recipent = address_recipent;
	}
	
	public String getAddress_phone() {
		return address_phone;
	}
	
	public void setAddress_phone(String address_phone) {
		this.address_phone = address_phone;
	}
	
	public String getAddress_1() {
		return address_1;
	}
	
	public void setAddress_1(String address_1) {
		this.address_1 = address_1;
	}
	
	public String getAddress_2() {
		return address_2;
	}
	
	public void setAddress_2(String address_2) {
		this.address_2 = address_2;
	}
	
	public String getAddress_3() {
		return address_3;
	}
	
	public void setAddress_3(String address_3) {
		this.address_3 = address_3;
	}
	
	public String getAddress_request() {
		return address_request;
	}
	
	public void setAddress_request(String address_request) {
		this.address_request = address_request;
	}
	
	public String getP_code() {
		return p_code;
	}
	
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	
	public String getP_brand() {
		return p_brand;
	}
	
	public void setP_brand(String p_brand) {
		this.p_brand = p_brand;
	}
	
	public String getP_name() {
		return p_name;
	}
	
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	
	public int getP_price() {
		return p_price;
	}
	
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	
	public String getP_imageFileName() {
		return p_imageFileName;
	}
	
	public void setP_imageFileName(String p_imageFileName) {
		this.p_imageFileName = p_imageFileName;
	}
	
	public int getMember_num() {
		return member_num;
	}
	
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
	public int getCart_quantity() {
		return cart_quantity;
	}
	
	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}
	
	public int getOrder_quantity() {
		return order_quantity;
	}
	
	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}
}
