package com.ezen.springplanetrip.service.account.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.springplanetrip.service.account.AccountService;

@Service
public class AccountServiceImpl implements AccountService{
	@Autowired
	private AccountDAO accountDAO;
	
	
}
