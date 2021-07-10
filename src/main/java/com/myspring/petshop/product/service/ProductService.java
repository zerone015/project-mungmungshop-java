package com.myspring.petshop.product.service;

import java.util.HashMap;
import java.util.List;

import com.myspring.petshop.product.vo.ProductVO;


public interface ProductService {
	public List getProducts(HashMap productInfo) throws Exception;
	public int productsCnt(ProductVO category) throws Exception;
	public List getLoveRanking(HashMap productInfo) throws Exception;
	public List getNewRanking(HashMap productInfo) throws Exception;
	public List getLowPriceRanking(HashMap productInfo) throws Exception;
	public List getHighPriceRanking(HashMap productInfo) throws Exception;
	public List getAllProducts(HashMap productInfo) throws Exception;
}
