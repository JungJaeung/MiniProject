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
	
	//비행편 선택 확인 탑승자 정보 입력
	@PostMapping("/insertPassenger") 
	public String insertPassenger(Model model, @RequestParam Map<String, String> selectedFlight, HttpSession session) {
		if(session == null) {	//로그인 없이 승객정보를 입력하려고 할시 작동하는 문장
			
			return "../views/Account/login.jsp";
		}
		
		PassengerVO passengerVO	 = new PassengerVO();
		int count = passengerService.insertPassenger(passengerVO);
		
		return "../passenger/insertPassenger";
	}
}
