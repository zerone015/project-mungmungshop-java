package com.myspring.petshop.manager.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("managerVO")
public class ManagerVO{
	private String p_code;
	private String p_cl1;
	private String p_cl2;
	private String p_brand;
	private String p_name;
	private int p_price;
	private int p_salePrice;
	private int p_stock;
	private String p_imageFileName;
	private String p_description;
	private Timestamp p_date;
	private int p_loves;
	private String p_origin;
	
	public ManagerVO() {
		
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
	
	public String getP_description() {
		return p_description;
	}
	
	public void setP_description(String p_description) {
		this.p_description = p_description;
	}
	
	public Timestamp getP_date() {
		return p_date;
	}
	
	public void setP_date(Timestamp p_date) {
		this.p_date = p_date;
	}
	
	public int getP_loves() {
		return p_loves;
	}
	
	public void setP_loves(int p_loves) {
		this.p_loves = p_loves;
	}
	
	public String getP_origin() {
		return p_origin;
	}
	
	public void setP_origin(String p_origin) {
		this.p_origin = p_origin;
	}
}