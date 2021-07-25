package com.myspring.petshop.myPage.address.vo;

import org.springframework.stereotype.Component;

@Component("addressVO")
public class AddressVO {
	
	private int address_num;
	private int member_num;
	private String address_recipent;
	private String address_phone;
	private String address_1;
	private String address_2;
	private String address_3;
	
	public AddressVO() {
		
	}
	
	public int getAddress_num() {
		
		return address_num;
	}
	
	public void setAddress_num(int address_num) {
		this.address_num = address_num;
	}

	public int getMember_num() {
		
		return member_num;
	}
	
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
	public String getAddress_recipent() {
		return address_recipent;
	}
	
	public void setAddress_recipent(String address_recipent) {
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
}
