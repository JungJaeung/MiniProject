package com.ezen.springplanetrip.controller;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
		SimpleDateFormat smf = new SimpleDateFormat("HH:mm");
		System.out.println("승객 작업 중..");


		System.out.println("데이터 타입 " + paramMap.get("departTime").getClass().getName());
		System.out.println(paramMap.toString());
		
		
		
		Time departTime = Time.valueOf(paramMap.get("departTime"));
		System.out.println("출발 시간 정리 : " + departTime);
		
		String arrivalTime = paramMap.get("arrivalTime");
		//Date arrivalTime = Date.valueOf(paramMap.get("arrivalTime"));
		System.out.println("도착 시간 정리 : " + arrivalTime);
//		List<PassengerVO> passengerList = new ArrayList<PassengerVO>();
		
		for(int i = 1; i <= 3; i++) {
			PassengerVO passengerVO = new PassengerVO();
			passengerVO.setGender((String)paramMap.get("gender" + i));
			passengerVO.setFirstName((String)paramMap.get("fisrtName" + i));
			passengerVO.setLastName((String)paramMap.get("lastName" + i));
			passengerVO.setPhone((String)paramMap.get("phone" + i));
			passengerVO.setBirthDate(Date.valueOf((String)paramMap.get("birthDate" + i)));
			
			passengerService.insertPassenger(passengerVO);
		}
		
		//passengerService.insertPassenger(passengerVO);
		
		return "../passenger/insertPassenger";
	}
}
