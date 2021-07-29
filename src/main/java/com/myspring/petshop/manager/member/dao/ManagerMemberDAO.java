package com.myspring.petshop.manager.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.product.vo.ProductVO;

public interface ManagerMemberDAO {
	public int selectMembersCnt() throws Exception;
	public List selectMembers(Pagination pagination) throws Exception;
	public void deleteMembers(int member_num) throws Exception;
	public void updateMemberGrant(int member_num) throws Exception;
	public void updateMemberRevoke(int member_num) throws Exception;
	public int selectMemberManager(int member_num) throws Exception;
	public int selectSearchMembersCnt(Map searchMap) throws Exception;
	public List selectSearchMembers(Map searchMap) throws Exception;
}
