package com.myspring.petshop.love.service;

import java.util.List;
import java.util.Map;

import com.myspring.petshop.love.vo.LoveVO;
import com.myspring.petshop.product.vo.ProductVO;

public interface LoveService {
	public int getLoveCnt(LoveVO love) throws Exception;
	public void addLove(LoveVO love) throws Exception;
	public void removeLove(LoveVO love) throws Exception;
	public int getProductLove(String p_code) throws Exception;
	public int getLoveListCnt(int member_num) throws Exception;
	public List<ProductVO> getLoveList(Map<String, Object> loveMap) throws Exception;
}
