package com.ezen.springplanetrip.service.account.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountServiceImpl {
	@Autowired
	private AccountDAO accountDAO;
}
