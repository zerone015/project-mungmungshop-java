package com.myspring.petshop.manager.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.manager.member.dao.ManagerMemberDAO;
import com.myspring.petshop.member.vo.MemberVO;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class ManagerMemberServiceImpl implements ManagerMemberService{
	@Autowired
	private ManagerMemberDAO managerDAO;
	
	@Override
	public int membersCnt() throws Exception {
	
		return managerDAO.selectMembersCnt();
	}
	

	@Override
	public List getMembersList(Pagination pagination) throws Exception {
		
		return managerDAO.selectMembers(pagination);
	}
	
	@Override
	public MemberVO getMemberInfo(int member_num) throws Exception {
		
		return managerDAO.selectMemberInfo(member_num);
	}
	
	@Override
	public boolean removeMembers(int member_num) throws Exception {
		managerDAO.deleteMembers(member_num);
		
		return true;
	}
	
	@Override
	public boolean modMemberGrant(int member_num) throws Exception {
		int result = getMemberManager(member_num);
		
		if(result == 0) {
			managerDAO.updateMemberGrant(member_num);
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	public boolean modMemberRevoke(int member_num) throws Exception {
		int result = getMemberManager(member_num);
		
		if(result == 1) {
			managerDAO.updateMemberRevoke(member_num);
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	public int searchMembersCnt(Map searchMap) throws Exception {
		
		return managerDAO.selectSearchMembersCnt(searchMap);
	}
	
	@Override
	public List getSearchMembers(Map searchMap) throws Exception {
		
		return managerDAO.selectSearchMembers(searchMap);
	}
	
	@Override
	public void modMember(MemberVO memberVO) throws Exception {
		
		managerDAO.updateMember(memberVO);
	}
	
	
	private int getMemberManager(int member_num) throws Exception {
		
		return managerDAO.selectMemberManager(member_num);
	}
	
}