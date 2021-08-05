package com.myspring.petshop.myPage.order.vo;

import java.sql.Timestamp;

import org.springframework.stereotype.Component;

@Component
public class PointHistoryVO {	
	private int point_num;
	private int member_num;
	private String point_status;
	private int point_value;
	private String point_contents;
	private String order_code;
	private Timestamp point_date;
	
	public PointHistoryVO() {
		
	}
	
	public int getPoint_num() {
		return point_num;
	}
	
	public void setPoint_num(int point_num) {
		this.point_num=point_num;
	}
	
	public int getMember_num() {
		return member_num;
	}
	
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
	public String getPoint_status() {
		return point_status;
	}
	
	public void setPoint_status(String point_status) {
		this.point_status = point_status;
	}
	
	public int getPoint_value() {
		return point_value;
	}
	
	public void setPoint_value(int point_value) {
		this.point_value = point_value;
	}
	
	public String getPoint_contents() {
		return point_contents;
	}
	
	public void setPoint_contents(String point_contents) {
		this.point_contents = point_contents;
	}
	
	public String getOrder_code() {
		return order_code;
	}
	
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	
	public Timestamp getPoint_date() {
		return point_date;
	}
	
	public void setPoint_date(Timestamp point_date) {
		this.point_date = point_date;
	}
}
