package com.myspring.petshop.payment.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class PaymentPrdVO{
	private String p_code;
	private String p_cl1;
	private String p_cl2;
	private String p_brand;
	private String p_name;
	private int p_price;
	private int p_salePrice;
	private int p_stock;
	private String p_imageFileName;
	private String p_origin;
	private int cart_quantity;
	private int order_quantity;
	
	public PaymentPrdVO() {
		
	}
	public String getP_code() {
		return p_code;
	}
	
	public void setP_code(String p_code) {
		this.p_code = p_code;
	}
	
	public String getP_cl1() {
		return p_cl1;
	}
	
	public void setP_cl1(String p_cl1) {
		this.p_cl1=p_cl1;
	}
	
	public String getP_cl2() {
		return p_cl2;
	}
	
	public void setP_cl2(String p_cl2) {
		this.p_cl2=p_cl2;
	}
	
	public String getP_brand() {
		return p_brand;
	}
	
	public void setP_brand(String p_brand) {
		this.p_brand=p_brand;
	}
	
	public String getP_name() {
		return p_name;
	}
	
	public void setP_name(String p_name) {
		this.p_name=p_name;
	}
	
	public int getP_price() {
		return p_price;
	}
	
	public void setP_price(int p_price) {
		this.p_price=p_price;
	}
	
	public int getP_salePrice() {
		return p_salePrice;
	}
	
	public void setP_salePrice(int p_salePrice) {
		this.p_salePrice = p_salePrice;
	}
	
	public int getP_stock() {
		return p_stock;
	}
	
	public void setP_stock(int p_stock) {
		this.p_stock = p_stock;
	}
	
	public String getP_imageFileName() {
		return p_imageFileName;
	}
	
	public void setP_imageFileName(String p_imageFileName) {
		this.p_imageFileName = p_imageFileName;
	}
	
	public String getP_origin() {
		return p_origin;
	}
	
	public void setP_origin(String p_origin) {
		this.p_origin = p_origin;
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