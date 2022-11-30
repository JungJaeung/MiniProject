package com.ezen.springplanetrip.controller;

import java.sql.Date;
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
	
	@PostMapping("/insertPassenger.do")
	public String insertPassenger(@RequestParam Map<String, String> paramMap) {
		
		System.out.println(paramMap.toString());
		
//		List<PassengerVO> passengerList = new ArrayList<PassengerVO>();
		
		for(int i = 1; i <= 3; i++) {
			PassengerVO passengerVO = new PassengerVO();
			passengerVO.setGender(paramMap.get("gender" + i));
			passengerVO.setFirstName(paramMap.get("fisrtName" + i));
			passengerVO.setLastName(paramMap.get("lastName" + i));
			passengerVO.setPhone(paramMap.get("phone" + i));
			passengerVO.setBirthDate(Date.valueOf(paramMap.get("birthDate" + i)));
			
			passengerService.insertPassenger(passengerVO);
		}
		
		//passengerService.insertPassenger(passengerVO);
		
		return "../passenger/insertPassenger";
	}
}
