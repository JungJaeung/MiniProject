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
import com.ezen.springplanetrip.vo.UserVO;

@Controller
@RequestMapping("/passenger")
public class PassengerController {
	@Autowired
	private PassengerService passengerService;

	@PostMapping("/passenger.do")
	public String passenger(Model model, @RequestParam Map<String, String> paramMap, HttpSession session) {
		if (session.getAttribute("loginUser") == null) {
			return "/Account/login";
		}

		model.addAttribute("flight_data", paramMap);

		return "../passenger/insertPassenger";
	}

	@PostMapping("/insertPassenger.do")
	public String insertPassenger(Model model, @RequestParam Map<String, String> paramMap, HttpSession session) throws Exception{
		UserVO sessionId = (UserVO)session.getAttribute("loginUser");
		
		int session_Id = sessionId.getUserId();
		
//		System.out.println("데이터 타입 " + paramMap.get("departTime").getClass().getName());
//		int user_id = 
		
		System.out.println("파람맵: " + paramMap.toString());

		System.out.println(paramMap.get("departTime"));
		System.out.println(paramMap.get("arrivalTime"));
		System.out.println("세션: " + session.getAttribute("loginUser"));
		model.addAttribute("departTime", paramMap.get("departTime"));
		model.addAttribute("arrivalTime", paramMap.get("arrivalTime"));
//		List<PassengerVO> passengerList = new ArrayList<PassengerVO>();

		for (int i = 1; i <= 1; i++) {
			PassengerVO passengerVO = new PassengerVO();
			passengerVO.setGender(paramMap.get("gender" + i));
			passengerVO.setFirstName(paramMap.get("firstName" + i));
			passengerVO.setLastName(paramMap.get("lastName" + i));
			passengerVO.setPhone(paramMap.get("phone" + i));
			passengerVO.setBirthDate(Date.valueOf(paramMap.get("birthDate" + i)));
			passengerVO.setUserID(session_Id);

			passengerService.insertPassenger(passengerVO);
		}

//		 passengerService.insertPassenger(passengerVO);

		return "../passenger/insertPassenger";
	}
}
