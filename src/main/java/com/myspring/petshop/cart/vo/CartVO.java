package com.myspring.petshop.cart.vo;




import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component("cartVO")
public class CartVO{
	private int cart_code;
	private int member_num;
	private String p_code;
	private int cart_quantity;
	private Timestamp cart_date;
	
	public CartVO() {
		
	}
	public int getCart_code() {
		return cart_code;
	}
	
	public void setCart_code(int cart_code) {
		this.cart_code = cart_code;
	}
	
	public int getMember_num() {
		return member_num;
	}
	
	public void setMember_num(int member_num) {
		this.member_num=member_num;
	}
	
	public String getP_code() {
		return p_code;
	}
	
	public void setP_code(String p_code) {
		this.p_code=p_code;
	}
	
	public int getCart_quantity() {
		return cart_quantity;
	}
	
	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity=cart_quantity;
	}
	
	public Timestamp getCart_date() {
		return cart_date;
	}
	
	public void setCart_date(Timestamp cart_date) {
		this.cart_date=cart_date;
	}
}