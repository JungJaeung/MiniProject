package com.ezen.springplanetrip.service.account.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.springplanetrip.service.account.AccountService;
import com.ezen.springplanetrip.vo.PassengerVO;

@Service
public class AccountServiceImpl implements AccountService{
	@Autowired
	private AccountDAO accountDAO;
	
	public void join(PassengerVO passengerVO) {
		accountDAO.join(passengerVO);
	}

	public PassengerVO login(PassengerVO passengerVO) {
		
		return accountDAO.login(passengerVO); 
	}

	public List<PassengerVO> viewMypage(){
		
		return accountDAO.viewMypage(); 
	}

	public void quit(PassengerVO passengerVO){
		accountDAO.quit(passengerVO);
	}

	public void updateInfo(PassengerVO passengerVO){
		 accountDAO.updateInfo(passengerVO);
	}
}
