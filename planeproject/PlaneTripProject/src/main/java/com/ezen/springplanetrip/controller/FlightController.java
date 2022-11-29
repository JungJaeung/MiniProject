package com.ezen.springplanetrip.controller;

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
import com.ezen.springplanetrip.vo.PageVO;

@Controller
@RequestMapping("/flight")
public class FlightController {
	@Autowired
	private FlightService flightService;
	
	@PostMapping("/searchFlight.do")
	public String viewFlight(Model model, @RequestParam Map<String, String> flyMap, Criteria cri) {
		//검색하려는 비행편 정보를 담을 인스턴스
		
		cri.setAmount(8);	//페이지당 8개만 표시
		//넘어온 값들은 정수가 아닌 문자열
		//flyMap.put("flightId", Integer.parseInt((String)flyMap.get("flightId")));	//flighId값은 정수형이므로 정수형으로 바꿔서
		List<FlightVO> flightList = flightService.viewFlight(flyMap, cri);

		System.out.println("비행편 ID : " + flyMap.get("flightId"));
		model.addAttribute("flightInfo", flyMap);
		
		System.out.println(flightList.get(0));
		model.addAttribute("flightList", flightList);
		
		//공항 목록 다시 불러오기
		List<AirportVO> airportList = flightService.viewAirport(null);
		model.addAttribute("airportList", airportList);
		
		System.out.println("출발편 : " + flyMap.get("departPointId"));
		System.out.println("도착편 : " + flyMap.get("arrivedPointId"));
		
		//페이지 계산
		int total = flightService.getFlightTotalCnt(flyMap);
		System.out.println("총 개수 : " + total);
		model.addAttribute("pageVO", new PageVO(cri, total));
		System.out.println("flightID = " + flightList.get(0).getFlightId());
		
		return "../flight/searchFlight";
	}
	
}
