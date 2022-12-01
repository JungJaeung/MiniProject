package com.ezen.springplanetrip.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
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
	
	@PostMapping("/insertPassenger.do")
	public String insertPassenger(Model model, @RequestParam Map<String, String> paramMap, HttpSession session) {
		UserVO user = (UserVO)session.getAttribute("loginUser");
		user.getUserId();
		
		System.out.println("데이터 타입 " + paramMap.get("departTime").getClass().getName());
		System.out.println(paramMap.toString());

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
		List<PassengerVO> passengerList = new ArrayList<PassengerVO>();
		
		PassengerVO passengerVO = new PassengerVO();
		passengerVO.setGender(paramMap.get("gender" + 1));
		passengerVO.setFirstName(paramMap.get("firstName" + 1));
		passengerVO.setLastName(paramMap.get("lastName" + 1));
		passengerVO.setPhone(paramMap.get("phone" + 1));
		passengerVO.setBirthDate(Date.valueOf(paramMap.get("birthDate" + 1)));
		  
	  passengerService.insertPassenger(passengerVO);
		
		
		/*
		 * for(int i = 1; i <= 3; i++) { PassengerVO passengerVO = new PassengerVO();
		 * passengerVO.setGender((String)paramMap.get("gender" + i));
		 * passengerVO.setFirstName((String)paramMap.get("fisrtName" + i));
		 * passengerVO.setLastName((String)paramMap.get("lastName" + i));
		 * passengerVO.setPhone((String)paramMap.get("phone" + i));
		 * passengerVO.setBirthDate(Date.valueOf((String)paramMap.get("birthDate" +
		 * i)));
		 * 
		 * passengerService.insertPassenger(passengerVO); }
		 */
		 
=======
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

>>>>>>> 30084ca4b505314a9df2871e0ce96f605e3c38f4
		return "../passenger/insertPassenger";
	}
	
}
