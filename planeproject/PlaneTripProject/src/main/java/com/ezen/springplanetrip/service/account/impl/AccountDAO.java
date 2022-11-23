package com.ezen.springplanetrip.service.account.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.springplanetrip.vo.PassengerVO;

@Repository
public class AccountDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	

	public void join(PassengerVO passengerVO) {
		mybatis.insert("AccountDAO.join", passengerVO);
	}
	
	public PassengerVO login(PassengerVO passengerVO) {
		
		return mybatis.selectOne("AccountDAO.login", passengerVO); 
	}
	
	public List<PassengerVO> viewMypage(){
		
		return mybatis.selectList("AccountDAO.veiwMypage"); 
	}
	
	public void quit(PassengerVO passengerVO){
		mybatis.delete("AccountDAO.quit", passengerVO);
	}
	
	public void updateInfo(PassengerVO passengerVO){
		mybatis.update("AccountDAO.updateInfo", passengerVO);
	}
}
