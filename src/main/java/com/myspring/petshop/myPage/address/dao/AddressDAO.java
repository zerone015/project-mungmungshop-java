package com.myspring.petshop.myPage.address.dao;



import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.myPage.address.vo.AddressVO;

public interface AddressDAO {
	
	

	public void insertAddress(AddressVO address) throws DataAccessException;
	public List<AddressVO> selectAddressList(int member_num) throws DataAccessException;
	public AddressVO selectModAddress(int address_num) throws DataAccessException;
	public void updateAddress(AddressVO address) throws DataAccessException;
	public void deleteAddress(AddressVO address) throws DataAccessException;
	public int selectAddressCnt(int member_num) throws DataAccessException;
	

}
