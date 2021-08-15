package com.myspring.petshop.manager.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.product.vo.ManagerProductVO;
import com.myspring.petshop.member.vo.MemberVO;
import com.myspring.petshop.product.vo.ProductVO;

public interface ManagerMemberService {
	public int membersCnt() throws Exception;
	public List getMembersList(Pagination pagination) throws Exception;
	public MemberVO getMemberInfo(int member_num) throws Exception;
	public boolean removeMembers(int member_num) throws Exception;
	public boolean modMemberGrant(int member_num) throws Exception;
	public boolean modMemberRevoke(int member_num) throws Exception;
	public int searchMembersCnt(Map searchMap) throws Exception;
	public List getSearchMembers(Map searchMap) throws Exception;
	public void modMember(MemberVO memberVO) throws Exception;
}
