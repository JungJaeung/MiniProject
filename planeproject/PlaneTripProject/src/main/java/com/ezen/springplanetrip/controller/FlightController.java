package com.ezen.springplanetrip.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.springplanetrip.service.flight.impl.FlightServiceImpl;
import com.ezen.springplanetrip.vo.FlightVO;

@Controller
@RequestMapping("/flight")
public class FlightController {
	@Autowired
	private FlightServiceImpl FlightService;
	
	@PostMapping("/searchFlight")
	public String viewFlight(Model model) {
		//검색하려는 비행편 정보를 담을 인스턴스
		FlightVO flightVO = new FlightVO();
		flightVO.setDepartTime((Date)model.getAttribute(""));
		flightVO.setArrivalTime((Date)model.getAttribute(""));
		List<FlightVO> flightList = FlightService.viewFlight(flightVO);
		
		return "flight/searchFlight";
	}
}
