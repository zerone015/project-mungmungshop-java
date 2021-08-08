package com.myspring.petshop.payment.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class CombineVO {
	private String order_detailCode;
	private String order_code;
	private int order_num;
	private String p_code;
	private int member_num;
	private String member_name;
	private String member_phone;
	private String member_email;
	private String address_recipent;
	private String address_phone;
	private String address_1;
	private String address_2;
	private String address_3;
	private String address_request;
	private int order_quantity;
	private int p_price;
	private String p_name;
	private String p_imageFileName;
	private int order_usePoint;
	private int order_addPoint;
	private String order_method;
	private String order_status;
	private int order_totalQuantity;
	private int order_totalPrice;
	private Timestamp order_date;
	private String buyer_reason;
	private String seller_reason; 

	
	public CombineVO() {
		
	}
	
	public String getOrder_detailCode() {
		return order_detailCode;
	}
	
	public void setOrder_detailCode(String order_detailCode) {
		this.order_detailCode = order_detailCode;
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
	
	public String getAddress_phone() {
		return address_phone;
	}
	
	public void setAddress_phone(String address_phone) {
		this.address_phone = address_phone;
	}
	
	public String getAddress_request() {
		return address_request;
	}
	
	public void setAddress_request(String address_request) {
		this.address_request = address_request;
	}
	
	public String getOrder_code() {
		return order_code;
	}
	
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	
	public String getP_imageFileName() {
		return p_imageFileName;
	}
	
	public void setP_imageFileName(String p_imageFileName) {
		this.p_imageFileName = p_imageFileName;
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
	
	public String getP_name() {
		return p_name;
	}
	
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	
	public String getP_code() {
		return p_code;
	}
	
	public void setP_code(String p_code) {
		this.p_code = p_code;
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
	
	public String getOrder_status() {
		return order_status;
	}
	
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
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
	
	public String getBuyer_reason() {
		return buyer_reason;
	}
	
	public void setBuyer_reason(String buyer_reason) {
		this.buyer_reason=buyer_reason;
	}
	
	public String getSeller_reason() {
		return seller_reason;
	}
	
	public void setSeller_reason(String seller_reason) {
		this.seller_reason=seller_reason;
	}
}
