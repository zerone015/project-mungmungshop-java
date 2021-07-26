package com.myspring.petshop.payment.vo;

import org.springframework.stereotype.Component;

@Component
public class CombineVO {
	private String order_detailCode;
	private String order_code;
	private String p_code;
	private int order_quantity;
	private int p_price;
	private int order_usePoint;
	private int order_addPoint;
	private int order_price;
	private String order_method;
	private String order_status;
	
	public CombineVO() {
		
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
	
	public String getOrder_status() {
		return order_status;
	}
	
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
}
