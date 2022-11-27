package com.ezen.springplanetrip.service.account.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.springplanetrip.vo.PassengerVO;
import com.ezen.springplanetrip.vo.UserVO;

@Repository
public class AccountDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	

	public int join(UserVO userVO) {
		return mybatis.insert("AccountDAO.join", userVO);
	}
	
	public UserVO login(UserVO userVO) {
		
		return mybatis.selectOne("AccountDAO.login", userVO); 
	}
	
	public List<UserVO> viewMypage(){
		
		return mybatis.selectList("AccountDAO.veiwMypage"); 
	}
	
	public void quit(UserVO userVO){
		mybatis.delete("AccountDAO.quit", userVO);
	}
	
	public void updateInfo(UserVO userVO){
		mybatis.update("AccountDAO.updateInfo", userVO);
	}
	
	public int idCheck(String email) {
		return mybatis.selectOne("AccountDAO.idCheck", email);
	}
	
	public UserVO findId(UserVO userVO) {
		return mybatis.selectOne("AccountDAO.findId", userVO);
	}

	public UserVO findPassword(UserVO userVO) {
		return mybatis.selectOne("AccountDAO.findPassword", userVO);
	}
}
