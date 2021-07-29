package com.myspring.petshop.manager.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myspring.petshop.common.pagination.Pagination;
import com.myspring.petshop.product.vo.ProductVO;

@Repository
public class ManagerMemberDAOImpl implements ManagerMemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int selectMembersCnt() throws Exception {
		
		return sqlSession.selectOne("mapper.managerMember.selectMembersCnt");
	}
	
	@Override
	public List selectMembers(Pagination pagination) throws Exception {
		
		return sqlSession.selectList("mapper.managerMember.selectMembers", pagination);
	}
	
	@Override
	public void deleteMembers(int member_num) throws Exception {
		sqlSession.delete("mapper.managerMember.deleteMembers", member_num);
	}
	
	@Override
	public void updateMemberGrant(int member_num) throws Exception {
		sqlSession.update("mapper.managerMember.updateMemberGrant", member_num);
	}
	
	@Override
	public void updateMemberRevoke(int member_num) throws Exception {
		sqlSession.update("mapper.managerMember.updateMemberRevoke", member_num);
	}
	
	@Override
	public int selectMemberManager(int member_num) throws Exception {
		
		return sqlSession.selectOne("mapper.managerMember.selectMemberManager", member_num);
	}
	
	@Override
	public int selectSearchMembersCnt(Map searchMap) throws Exception {
		
		return sqlSession.selectOne("mapper.managerMember.selectSearchMembersCnt", searchMap);
	}
	
	@Override
	public List selectSearchMembers(Map searchMap) throws Exception {
		
		return sqlSession.selectList("mapper.managerMember.selectSearchMembers", searchMap);
	}
}