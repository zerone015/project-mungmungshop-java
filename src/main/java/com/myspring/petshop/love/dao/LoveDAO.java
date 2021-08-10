package com.myspring.petshop.love.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.love.vo.LoveVO;
import com.myspring.petshop.product.vo.ProductVO;

public interface LoveDAO {
	public int selectLoveCnt(LoveVO love) throws DataAccessException;
	public void insertLove(LoveVO love) throws DataAccessException;
	public void deleteLove(LoveVO love) throws DataAccessException;
	public int selectProductLove(String p_code) throws DataAccessException;
	public int selectMaxLoveNum() throws DataAccessException;
	public int selectLoveListCnt(int member_num) throws DataAccessException;
	public List<ProductVO> selectLoveList(Map<String, Object> loveMap) throws DataAccessException;
}
