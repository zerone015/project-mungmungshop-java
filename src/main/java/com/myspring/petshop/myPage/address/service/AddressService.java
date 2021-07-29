package com.myspring.petshop.myPage.address.service;

import java.util.List;

import com.myspring.petshop.myPage.address.vo.AddressVO;


public interface AddressService {
	public void addAddress(AddressVO address) throws Exception;
	public List<AddressVO> getAddressList(int member_num) throws Exception;
	public int getAddressCnt(int member_num) throws Exception;
	public AddressVO getModAddress(int address_num) throws Exception;
	public void modifyAddress(AddressVO address) throws Exception;
	public void removeAddress(AddressVO address) throws Exception;

	
} 
