package com.ezen.springplanetrip.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.springplanetrip.service.account.AccountService;
import com.ezen.springplanetrip.vo.PassengerVO;

@Controller
@RequestMapping("/Account")
public class AccountController {
	@Autowired
	private AccountService accountService;
	
	public String reserve(PassengerVO passengerVO) {
		return null;
	}

	public String viewMypage() {
		return null;
	}

	public String login(PassengerVO passengerVO, HttpSession session) {
		return null;
	}

	public String join(PassengerVO passengerVO, Model model) {
		return null;
	}

	public String quit(PassengerVO passengerVO) {
		return null;
	}

	public String updateInfo(PassengerVO passengerVO) {
		return null;
	}
}
