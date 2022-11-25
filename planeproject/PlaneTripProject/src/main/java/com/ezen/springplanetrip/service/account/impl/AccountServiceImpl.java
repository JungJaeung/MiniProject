package com.ezen.springplanetrip.service.account.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.springplanetrip.service.account.AccountService;
import com.ezen.springplanetrip.vo.PassengerVO;
import com.ezen.springplanetrip.vo.UserVO;

@Service
public class AccountServiceImpl implements AccountService{
	@Autowired
	private AccountDAO accountDAO;
	
	@Override
	public int join(UserVO userVO) {
		return accountDAO.join(userVO);
	}
	@Override
	public PassengerVO login(UserVO userVO) {
		return accountDAO.login(userVO); 
	}
	
	@Override
	public List<PassengerVO> viewMypage(){
		return accountDAO.viewMypage(); 
	}
	
	@Override
	public void quit(UserVO userVO){
		accountDAO.quit(userVO);
	}
	
	@Override
	public void updateInfo(UserVO userVO){
		 accountDAO.updateInfo(userVO);
	}
	
	@Override
	public int idCheck(String email) {
		return accountDAO.idCheck(email);
	}
	
	@Override
	public PassengerVO findId(UserVO userVO) {
		return accountDAO.findId(userVO);
	}

	@Override
	public PassengerVO findPassword(UserVO userVO) {
		return accountDAO.findPassword(userVO);
	}
}
