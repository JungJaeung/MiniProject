/**package com.ezen.springplanetrip.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.springplanetrip.service.flight.FlightService;
import com.ezen.springplanetrip.vo.AirportVO;
import com.ezen.springplanetrip.vo.Criteria;
import com.ezen.springplanetrip.vo.FlightVO;

@Controller
@RequestMapping("/flight")
public class FlightController {
	@Autowired
	private FlightService flightService;
	
	@PostMapping("/searchFlight.do")
	public String viewFlight(Model model, @RequestParam Map<String, Object> flyMap, Criteria cri) {
		//검색하려는 비행편 정보를 담을 인스턴스
		Map<String, Object> flightMap = new HashMap<String, Object>();
		
		flightMap.put("flightMap", flyMap);
		
		List<FlightVO> flightList = flightService.viewFlight(flightMap);
		System.out.println(flightList.toString());
		//공항 목록 다시 불러오기
		List<AirportVO> airportList = flightService.viewAirport(null);
		
		model.addAttribute("airportList", airportList);
		
		model.addAttribute("flightList", flightList);
		
		return "../flight/searchFlight";
	}
	
	
}**/
