package com.myspring.petshop.myPage.address.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.myPage.address.dao.AddressDAO;
import com.myspring.petshop.myPage.address.vo.AddressVO;

@Service("addressService")
@Transactional(propagation = Propagation.REQUIRED)
public class AddressServiceImpl implements AddressService{
	@Autowired
	private AddressDAO addressDAO;
	
	
	@Override
	public void addAddress(AddressVO address) throws Exception{
		addressDAO.insertAddress(address);
	}
	
	@Override
	public List getAddressList() throws Exception{
		
		return addressDAO.selectAddressList();
	}
	@Override
	public AddressVO getModAddress(int address_num) throws Exception{
		
		return addressDAO.selectModAddress(address_num);
	}
	
	@Override
	public void removeAddress(AddressVO address) throws Exception{
		addressDAO.deleteAddress(address);
	}
	
	@Override
	public void modifyAddress(AddressVO address) throws Exception {
		addressDAO.updateAddress(address);
	}
}
