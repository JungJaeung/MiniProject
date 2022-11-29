package com.ezen.springplanetrip.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.springplanetrip.service.passenger.PassengerService;
import com.ezen.springplanetrip.vo.PassengerVO;

@Controller
@RequestMapping("/passenger")
public class PassengerController {
	@Autowired
	private PassengerService passengerService;
	
	//비행편 선택 확인
	@PostMapping("/insertPassenger") 
	public String insertPassenger(Model model, @RequestParam Map<String, String> selectedFlight, HttpSession session) {
		if(session == null) {
			
			return "../views/Account/login.jsp";
		}
		/*
		PassengerVO passengerVO	 = new PassengerVO();
		int count = passengerService.insertPassenger(passengerVO);
		*/
		return "../passenger/insertPassenger";
	}
}
