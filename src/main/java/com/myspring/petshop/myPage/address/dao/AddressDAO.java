package com.myspring.petshop.myPage.address.dao;



import java.util.List;

import com.myspring.petshop.myPage.address.vo.AddressVO;

public interface AddressDAO {
	
	

	public void insertAddress(AddressVO address) throws Exception;
	public List selectAddressList() throws Exception;
	
	public AddressVO selectModAddress(int address_num) throws Exception;
	public void updateAddress(AddressVO address) throws Exception;
	public void deleteAddress(AddressVO address) throws Exception;
	

}
