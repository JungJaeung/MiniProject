package com.ezen.springplanetrip.controller;


import java.sql.Date;

import java.util.ArrayList;
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
import com.ezen.springplanetrip.service.passenger.PassengerService;
import com.ezen.springplanetrip.service.seat.SeatService;
import com.ezen.springplanetrip.vo.AirportVO;
import com.ezen.springplanetrip.vo.Criteria;
import com.ezen.springplanetrip.vo.FlightVO;
import com.ezen.springplanetrip.vo.PageVO;
import com.ezen.springplanetrip.vo.PassengerVO;
import com.ezen.springplanetrip.vo.SeatVO;

@Controller
@RequestMapping("/flight")
public class FlightController {
	@Autowired
	private FlightService flightService;
	
	@Autowired
	private SeatService seatService;
	
	
	@PostMapping("/searchFlight.do")
	public String viewFlight(Model model, @RequestParam Map<String, String> flyMap, Criteria cri) {
		//검색하려는 비행편 정보를 담을 인스턴스
		
		cri.setAmount(8);	//페이지당 8개만 표시
		//넘어온 값들은 정수가 아닌 문자열
		//flyMap.put("flightId", Integer.parseInt((String)flyMap.get("flightId")));	//flighId값은 정수형이므로 정수형으로 바꿔서
		List<FlightVO> flightList = flightService.viewFlight(flyMap, cri);

		System.out.println("가져오기전 비행편 ID : " + flyMap.get("flightId"));
		model.addAttribute("flightInfo", flyMap);
		
		System.out.println(flightList.get(0));
		model.addAttribute("flightList", flightList);
		
		//달력에 적은 시작일과 끝 날짜를 저장하는 map
		Map<String, String> calendar = new HashMap<String, String>();
		calendar.put("minimumDate", flyMap.get("minimumDate"));
		calendar.put("maximumDate", flyMap.get("maximumDate"));
		System.out.println("최소일 : " + calendar.get("minimumDate"));
		System.out.println("최대일 : " + calendar.get("maximumDate"));
		model.addAttribute("calendar", calendar);
		
		//공항 목록 다시 불러오기
		List<AirportVO> airportList = flightService.viewAirport(null);
		model.addAttribute("airportList", airportList);
		
		System.out.println("flight1: " + flightList.get(0).getFlightId());
		
		//좌석 목록에 대한 정보를 찾아 조회함. 
		int flightId = flightList.get(0).getFlightId();
		//비행편은 이미 조회함. List<SeatVO> seatList = seatService.viewSeatList(flightId);
//		model.addAttribute(seatList);
		System.out.println("flight1: " + flightId);

		
		//비행편 들의 좌석 클래스를 표시하는 부분
		List<Integer> seatClass = seatService.viewSeatClass(flightId);
		for(int i = 0; i< seatClass.size(); i++) {
			System.out.println("seatId : " + seatClass.get(i));
		}
		model.addAttribute("seatClass", seatClass);
		
		//좌석들의 가격을 표시하는 구현 - 작업후 나온 결과를 웹페이지로 정보 전달
		seatClass.get(0);
		//가격 정보는 클래스한개씩 검사해서 결과를 가져옴.
		List<Integer> seatPot = new ArrayList<Integer>();
		for(int i=0; i < seatClass.size(); i++) {
			int seatId = i+1;
			int seatList = seatService.viewSeatRemain(flightId, seatId);
			System.out.println("남은 좌석: " + seatList);
			seatPot.add(seatList);
		}
		model.addAttribute(seatPot);
		
		
		
		//페이지 계산
		int total = flightService.getFlightTotalCnt(flyMap);
		System.out.println("총 개수 : " + total);
		model.addAttribute("pageVO", new PageVO(cri, total));
		System.out.println("flightID = " + flightList.get(0).getFlightId());
		
		return "../flight/searchFlight";
	}
	
}
