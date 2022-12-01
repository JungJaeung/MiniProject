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

import com.ezen.springplanetrip.common.DateToString;
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
		
		//불러온 flight 출발,도착시간을 문자열 형태로 바꾸고 배열에 저장함.
		List<String> startDateList = DateToString.change(flightList);
		List<String> arrivalDateList = DateToString.change(flightList);
		System.out.println("출발날짜 3번째꺼 확인 : " + startDateList.get(2));
		System.out.println("도착날짜 3번째꺼 확인 : " + arrivalDateList.get(2));
		
		model.addAttribute("startDateList", startDateList);
		model.addAttribute("arrivalDateList", arrivalDateList);
		
		flightList.get(0);
		
		model.addAttribute("flightInfo", flyMap);
		
		model.addAttribute("flightList", flightList);
		
		//달력에 적은 시작일과 끝 날짜를 저장하는 map
		Map<String, String> calendar = new HashMap<String, String>();
		calendar.put("minimumDate", flyMap.get("minimumDate"));
		calendar.put("maximumDate", flyMap.get("maximumDate"));
		model.addAttribute("calendar", calendar);
		
		//공항 목록 다시 불러오기
		List<AirportVO> airportList = flightService.viewAirport(null);
		model.addAttribute("airportList", airportList);

		Map<String, Object> flightSeatList = new HashMap<String, Object>();	//각 비행편의 정보를 모두 담은 객체
		List<List<Integer>> classList = new ArrayList<List<Integer>>(); //각 비행편의 클래스 목록을 담을 배열
		List<List<Integer>> priceList = new ArrayList<List<Integer>>();	//각 비행편의 가격 목록을 담을 배열 비행편마다 가격이 다를것
		List<List<Integer>> remainSeat = new ArrayList<List<Integer>>(); //각 비행편의 남은 자리 목록을 표시할 배열
		flightSeatList.put("flightList", flightList);
		//비행편 들의 좌석 클래스를 표시하는 부분 - Map의 키값은 String, 값은 List<Integer>
		List<Integer> seatClass;
		List<Integer> priceClass;
		List<Integer> seatPot;
		for(int i=0; i < flightList.size(); i++) {
			//각 비행편의 자리 클래스를 가져오는 부분 : 비행편들은 자리의 이름이 있다. 2차원 배열
			seatClass = seatService.viewSeatClass(flightList.get(i).getFlightId());
//			for(int j = 0; j < seatClass.size(); j++) {
//				System.out.println("seatId : " + seatClass.get(j));
//			}
			classList.add(seatClass);
			
			//좌석들의 가격을 표시하는 구현 - 작업후 나온 결과를 웹페이지로 정보 전달, 2차원 배열
			//가격 정보는 클래스한개씩 검사해서 결과를 가져옴.
			priceClass = seatService.viewSeatPrice(flightList.get(i).getFlightId());
//			for(int j = 0; j < seatClass.size(); j++) {
//				System.out.println(flightList.get(i).getFlightId() + "번 항공편의 seatPrice : " + priceClass.get(j));
//			}
			priceList.add(priceClass);
			//남은 좌석을 가져오기위한 데이터 입력을 하는 작업, 2차원 배열
			seatPot = new ArrayList<Integer>();
			for(int j = 0; j < seatClass.size(); j++) {
				int seatId = classList.get(i).get(j);
				int seatList = seatService.viewSeatRemain(flightList.get(i).getFlightId(), seatId);
//				System.out.println("남은 좌석: " + seatList);
				seatPot.add(seatList);
			}
			remainSeat.add(seatPot);
		}
		flightSeatList.put("classList", classList);
		flightSeatList.put("priceList", priceList);
		flightSeatList.put("remainSeat", remainSeat);
		
		model.addAttribute("flightSeatList", flightSeatList);
		//페이지 계산
		int total = flightService.getFlightTotalCnt(flyMap);
		System.out.println("총 개수 : " + total);
		model.addAttribute("pageVO", new PageVO(cri, total));
		System.out.println("flightID = " + flightList.get(0).getFlightId());
		
		return "../flight/searchFlight";
	}
	
}
