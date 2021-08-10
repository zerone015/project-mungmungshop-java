package com.myspring.petshop.love.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myspring.petshop.love.dao.LoveDAO;
import com.myspring.petshop.love.vo.LoveVO;
import com.myspring.petshop.product.vo.ProductVO;

@Service
public class LoveServiceImpl implements LoveService {

	@Autowired
	private LoveDAO loveDAO;
	
	@Override
	public int getLoveCnt(LoveVO love) throws Exception {
		return loveDAO.selectLoveCnt(love);
	}
	
	@Override
	public void addLove(LoveVO love) throws Exception {
		int love_num = getLoveNum();
		love.setLove_num(love_num);
		loveDAO.insertLove(love);
	}
	
	@Override
	public void removeLove(LoveVO love) throws Exception {
		loveDAO.deleteLove(love);
	}
	
	@Override
	public int getProductLove(String p_code) throws Exception {
		return loveDAO.selectProductLove(p_code);
	}
	
	@Override
	public int getLoveListCnt(int member_num) throws Exception {
		return loveDAO.selectLoveListCnt(member_num);
	}
	
	@Override
	public List<ProductVO> getLoveList(Map<String, Object> loveMap) throws Exception {
		return loveDAO.selectLoveList(loveMap);
	}
	
	private int getLoveNum() throws Exception {
		int result;
		
		try {
			result = loveDAO.selectMaxLoveNum()+1;
		}
		catch(NullPointerException e) {
			result = 0;
		}
		
		return result;
	}
}
