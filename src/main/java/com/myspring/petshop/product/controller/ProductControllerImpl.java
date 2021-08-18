package com.myspring.petshop.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.love.service.LoveService;
import com.myspring.petshop.love.vo.LoveVO;
import com.myspring.petshop.member.vo.MemberVO;
import com.myspring.petshop.product.service.ProductService;
import com.myspring.petshop.product.vo.ProductVO;
import com.myspring.petshop.review.service.ReviewService;

@Controller("productController")
public class ProductControllerImpl implements ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private MemberVO memberVO;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private LoveService loveService;
	@Autowired
	private LoveVO love;
	
	@Override
	@RequestMapping(value="/product/productList.do", method = RequestMethod.GET)
	public ModelAndView getProducts(@ModelAttribute("category") ProductVO category,
			@RequestParam(value="sortBy", required=false, defaultValue="default") String sortBy,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView("productList");
		
		int listCnt = productService.productsCnt(category);
		
		Pagination pagination = new Pagination();
		pagination.setListSize(9);
		pagination.pageInfo(page, range, listCnt);
		
		HashMap<String, Object> productInfo = new HashMap<String, Object>();
		productInfo.put("category", category);
		productInfo.put("pagination", pagination);
		
		List products = null;
		
		
		if(sortBy.equals("default")) {
			products = productService.getProducts(productInfo);
			mav.addObject("products", products);
		}
		
		else if(sortBy.equals("love")) {
			products = productService.getLoveRanking(productInfo);
			mav.addObject("products", products);
		}
		
		else if(sortBy.equals("new")) {
			products = productService.getNewRanking(productInfo);
			mav.addObject("products", products);
		}
		
		else if(sortBy.equals("lowPrice")) {
			products = productService.getLowPriceRanking(productInfo);
			mav.addObject("products", products);
		}
		
		else if(sortBy.equals("highPrice")) {
			products = productService.getHighPriceRanking(productInfo);
			mav.addObject("products", products);
		}
		
		else{
			mav.setViewName("pageError");
		}
	
		mav.addObject("pagination", pagination);
		mav.addObject("category", category);
		mav.addObject("sortBy", sortBy);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/product/getProduct.do", method = RequestMethod.GET)
	public ModelAndView getProduct(@RequestParam("p_code") String p_code,
								   @RequestParam(required = false, defaultValue = "1") int page,
								   @RequestParam(required = false, defaultValue = "1") int range, 
						HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		ProductVO product = productService.getProduct(p_code);
		
		HttpSession session = request.getSession();
		memberVO = (MemberVO)session.getAttribute("member");
		
		ModelAndView mav = new ModelAndView("product");
		mav.addObject("product", product);
		
		int total = reviewService.reviewCnt(p_code);
		
		Pagination pagination = new Pagination();
		pagination.setListSize(10);
		pagination.pageInfo(page, range, total);
		
		float listCnt = total;
		float fiveCnt = 0, fourCnt = 0, threeCnt = 0, twoCnt = 0, oneCnt = 0;
		float fiveAve = 0, fourAve = 0, threeAve = 0, twoAve = 0, oneAve = 0;
		float totalAve = 0;

		if(!(listCnt == 0)) {
			fiveCnt = reviewService.fiveReview(p_code);
			fourCnt = reviewService.fourReview(p_code);
			threeCnt = reviewService.threeReview(p_code);
			twoCnt = reviewService.twoReview(p_code);
			oneCnt = reviewService.oneReview(p_code);
			
			fiveAve = (fiveCnt/listCnt)*100;
			fourAve = (fourCnt/listCnt)*100;
			threeAve = (threeCnt/listCnt)*100;
			twoAve = (twoCnt/listCnt)*100;
			oneAve = (oneCnt/listCnt)*100;
			
			totalAve = ((5 * fiveCnt) + (4 * fourCnt) + (3 * threeCnt) + (2 * twoCnt) + oneCnt) / listCnt ;
		}
		
		Map<String, Object> info = new HashMap<String, Object>();
		
		info.put("pagination", pagination);
		info.put("p_code", p_code);
		
		List reviewList = reviewService.listReview(info);

		mav.addObject("reviewList", reviewList);
		mav.addObject("info", info);
		
		mav.addObject("fiveCnt", fiveCnt);
		mav.addObject("fourCnt", fourCnt);
		mav.addObject("threeCnt", threeCnt);
		mav.addObject("twoCnt", twoCnt);
		mav.addObject("oneCnt", oneCnt);
		
		mav.addObject("fiveAve", fiveAve);
		mav.addObject("fourAve", fourAve);
		mav.addObject("threeAve", threeAve);
		mav.addObject("twoAve", twoAve);
		mav.addObject("oneAve", oneAve);
		
		
		mav.addObject("totalAve", totalAve);
		mav.addObject("star", totalAve*20);
		
		mav.addObject("listCnt", listCnt);
		
		if(memberVO != null) {
			int member_num = memberVO.getMember_num();
			love.setMember_num(member_num);
			love.setP_code(p_code);
			int loveCnt = loveService.getLoveCnt(love);
			mav.addObject("loveCnt", loveCnt);
		}
		addProductsInQuick(product, p_code, session);
		
		return mav;
	}
	
	
	
	@Override
	@RequestMapping(value="/product/newProduct.do", method = RequestMethod.GET)
	public ModelAndView newProduct(
			@RequestParam(value="sortBy", required=false, defaultValue="default") String sortBy,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("newProduct");
		
		int listCnt = productService.newProductsCnt();
		
		Pagination pagination = new Pagination();
		pagination.setListSize(9);
		pagination.pageInfo(page, range, listCnt);
		
		HashMap<String, Object> productInfo = new HashMap<String, Object>();
		productInfo.put("pagination", pagination);
		
		List products = null;
		
		if(sortBy.equals("default")) {
			products = productService.getNewProducts(productInfo);
			mav.addObject("products", products);
		}
		
		else if(sortBy.equals("love")) {
			products = productService.getNewProductsLove(productInfo);
			mav.addObject("products", products);
		}
		
		
		else if(sortBy.equals("lowPrice")) {
			products = productService.getNewProductsLow(productInfo);
			mav.addObject("products", products);
		}
		
		else if(sortBy.equals("highPrice")) {
			products = productService.getNewProductsHigh(productInfo);
			mav.addObject("products", products);
		}
		
		else{
			mav.setViewName("pageError");
		}
	
		mav.addObject("pagination", pagination);
		mav.addObject("products", products);
		mav.addObject("sortBy", sortBy);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/product/brandProducts.do", method = RequestMethod.GET)
	public ModelAndView brandProducts(@RequestParam("brandName") String brandName,
			@RequestParam(value="sortBy", required=false, defaultValue="default") String sortBy,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView("brandProducts");
		
		int listCnt = productService.brandProductsCnt(brandName);
		
		Pagination pagination = new Pagination();
		pagination.setListSize(9);
		pagination.pageInfo(page, range, listCnt);
		
		HashMap<String, Object> productInfo = new HashMap<String, Object>();
		productInfo.put("brandName", brandName);
		productInfo.put("pagination", pagination);
		
		List products = null;
		
		
		if(sortBy.equals("default")) {
			products = productService.getBrandProducts(productInfo);
			mav.addObject("products", products);
		}
		
		else if(sortBy.equals("love")) {
			products = productService.getBrandLoveRanking(productInfo);
			mav.addObject("products", products);
		}
		
		else if(sortBy.equals("new")) {
			products = productService.getBrandNewRanking(productInfo);
			mav.addObject("products", products);
		}
		
		else if(sortBy.equals("lowPrice")) {
			products = productService.getBrandLowPriceRanking(productInfo);
			mav.addObject("products", products);
		}
		
		else if(sortBy.equals("highPrice")) {
			products = productService.getBrandHighPriceRanking(productInfo);
			mav.addObject("products", products);
		}
		
		else{
			mav.setViewName("pageError");
		}
	
		mav.addObject("pagination", pagination);
		mav.addObject("brandName", brandName);
		mav.addObject("sortBy", sortBy);
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/product/keywordSearch.do",method = RequestMethod.GET,produces = "application/text; charset=utf8")
	public String  keywordSearch(@RequestParam("keyword") String keyword,
			                                  HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		if(keyword == null || keyword.equals(""))
		   return null ;
	
		keyword = keyword.toUpperCase();
	    List<String> keywordList =productService.keywordSearch(keyword);
	    

		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList);
		 		
	    String jsonInfo = jsonObject.toString();
	  
	    return jsonInfo ;
	}
	
	@Override
	@RequestMapping(value="/product/searchProducts.do", method = RequestMethod.GET)
	public ModelAndView searchProducts(
			@RequestParam(value="searchWord", required=false, defaultValue="null") String searchWord,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		ModelAndView mav = new ModelAndView("searchList");
		
		int listCnt = productService.getSearchProductsCnt(searchWord);
		
		Pagination pagination = new Pagination();
		pagination.setListSize(9);
		pagination.pageInfo(page, range, listCnt);
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("pagination", pagination);
		searchMap.put("searchWord", searchWord);
		
		List<ProductVO> products = productService.getSearchProducts(searchMap);
		
		mav.addObject("pagination", pagination);
		mav.addObject("products", products);
		mav.addObject("searchWord", searchWord);
		
		return mav;
	}
	
	@Override
	@RequestMapping(value="/product/getRankProducts.do", method = RequestMethod.GET)
	public ModelAndView getRankProducts(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ModelAndView mav = new ModelAndView("rankProducts");
		
		List<ProductVO> rankList = productService.getRankProducts();
		
		mav.addObject("rankList", rankList);
		
		return mav;
	}
	
	
	private void addProductsInQuick(ProductVO product, String p_code, HttpSession session){
		boolean already_existed=false;
		List<ProductVO> quickProductsList; 
		quickProductsList=(ArrayList<ProductVO>)session.getAttribute("quickProductsList");
		
		if(quickProductsList!=null){
			for(int i=0; i<quickProductsList.size();i++){
				ProductVO _product=(ProductVO)quickProductsList.get(i);
				if(p_code.equals(_product.getP_code())){
					already_existed=true;
					break;
				}
			}
			if(already_existed==false){
				quickProductsList.add(0, product);
			}
				
		}
		else{
			quickProductsList = new ArrayList<ProductVO>();
			quickProductsList.add(product);
			
		}
		session.setAttribute("quickProductsList",quickProductsList);
	}
	
}
