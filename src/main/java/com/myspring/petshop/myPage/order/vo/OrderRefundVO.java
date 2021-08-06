package com.myspring.petshop.myPage.order.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class OrderRefundVO {	
	private int refund_num;
	private int member_num;
	private String order_code;
	private String order_detailCode;
	private int refund_quantity;
	private int refund_price;
	private String refund_name;
	private String refund_tel;
	private String refund_address1;
	private String refund_address2;
	private String refund_address3;
	private int refund_traking;
	private String order_status;
	private String buyer_reason;
	private String seller_reason;
	private Timestamp refund_date;
	
	public OrderRefundVO() {
		
	}
	
	public int getRefund_num() {
		return refund_num;
	}
	
	public void setRefund_num(int refund_num) {
		this.refund_num=refund_num;
	}
	
	public int getMember_num() {
		return member_num;
	}
	
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
	
	public String getOrder_code() {
		return order_code;
	}
	
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	
	public String getOrder_detailCode() {
		return order_detailCode;
	}
	
	public void setOrder_detailCode(String order_detailCode) {
		this.order_detailCode = order_detailCode;
	}
	
	public int getRefund_quantity() {
		return refund_quantity;
	}
	
	public void setRefund_quantity(int refund_quantity) {
		this.refund_quantity = refund_quantity;
	}
	
	public int getRefund_price() {
		return refund_price;
	}
	
	public void setRefund_price(int refund_price) {
		this.refund_price = refund_price;
	}
	
	public String getRefund_name() {
		return refund_name;
	}
	
	public void setRefund_name(String refund_name) {
		this.refund_name = refund_name;
	}
	
	public String getRefund_tel() {
		return refund_tel;
	}
	
	public void setRefund_tel(String refund_tel) {
		this.refund_tel = refund_tel;
	}
	
	public String getRefund_address1() {
		return refund_address1;
	}
	
	public void setRefund_address1(String refund_address1) {
		this.refund_address1 = refund_address1;
	}
	
	public String getRefund_address2() {
		return refund_address2;
	}
	
	public void setRefund_address2(String refund_address2) {
		this.refund_address2 = refund_address2;
	}
	
	public String getRefund_address3() {
		return refund_address3;
	}
	
	public void setRefund_address3(String refund_address3) {
		this.refund_address3 = refund_address3;
	}
	
	public int getRefund_traking() {
		return refund_traking;
	}
	
	public void setRefund_traking(int refund_traking) {
		this.refund_traking = refund_traking;
	}
	
	public String getOrder_status() {
		return order_status;
	}
	
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	
	public String getBuyer_reason() {
		return buyer_reason;
	}
	
	public void setBuyer_reason(String buyer_reason) {
		this.buyer_reason = buyer_reason;
	}
	
	public String getSeller_reason() {
		return seller_reason;
	}
	
	public void setSeller_reason(String seller_reason) {
		this.seller_reason = seller_reason;
	}
	
	public Timestamp getRefund_date() {
		return refund_date;
	}
	
	public void setRefund_date(Timestamp refund_date) {
		this.refund_date = refund_date;
	}
}
