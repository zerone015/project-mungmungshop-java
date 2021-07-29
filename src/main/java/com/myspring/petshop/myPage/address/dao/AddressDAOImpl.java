package com.myspring.petshop.myPage.address.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.myPage.address.vo.AddressVO;

@Repository("addressDAO")
public class AddressDAOImpl implements AddressDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertAddress(AddressVO address) throws DataAccessException {
		sqlSession.insert("mapper.address.insertAddress", address);
	}
	
	@Override
	public List<AddressVO> selectAddressList(int member_num) throws DataAccessException {
		
		return sqlSession.selectList("mapper.address.selectAddressList", member_num);
	}

	@Override
	public AddressVO selectModAddress(int address_num) throws DataAccessException{
		
		return sqlSession.selectOne("mapper.address.selectModAddress", address_num);
	}
	@Override
	public void updateAddress(AddressVO address) throws DataAccessException{
		sqlSession.update("mapper.address.updateAddress",address);
	}
	@Override
	public void deleteAddress(AddressVO address) throws DataAccessException{
		sqlSession.delete("mapper.address.deleteAddress",address);
	}
	
	@Override
	public int selectAddressCnt(int member_num) throws DataAccessException{
		return sqlSession.selectOne("mapper.address.selectAddressCnt", member_num);
	}
}
