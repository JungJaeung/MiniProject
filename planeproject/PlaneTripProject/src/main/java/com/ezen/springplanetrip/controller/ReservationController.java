package com.ezen.springplanetrip.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.springplanetrip.service.reservation.ReservationService;
import com.ezen.springplanetrip.vo.ReservationVO;
import com.ezen.springplanetrip.vo.UserVO;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	@Autowired
	private ReservationService reservationService;
	
	@PostMapping("/insertReservation.do")
	public String insertReservation(@RequestParam Map<String, Object> dptMap, @RequestParam Map<String, Object> arvMap,
			@RequestParam int passengerCnt, Model model, HttpSession session) {
		UserVO userVO = (UserVO)session.getAttribute("loginUser");

		int userId = 0;
		
		if(userVO != null) {
			userId = userVO.getUserId();
		}
		
		List<Integer> passengerList = reservationService.getPassengerList(userId, passengerCnt);
		
		Map<String, Object> dptSeatNoMap = new HashMap<String, Object>();
		dptSeatNoMap.put("flightId", dptMap.get("flightId"));
		dptSeatNoMap.put("seatId", dptMap.get("seatId"));
		dptSeatNoMap.put("passengerCnt", passengerCnt);
		
		List<String> dptSeatNoList = reservationService.getSeatNoList(dptSeatNoMap);
		
		Map<String, Object> arvSeatNoMap = new HashMap<String, Object>();
		arvSeatNoMap.put("flightId", arvMap.get("flightId"));
		arvSeatNoMap.put("seatId", arvMap.get("seatId"));
		arvSeatNoMap.put("passengerCnt", passengerCnt);
		
		List<String> arvSeatNoList = reservationService.getSeatNoList(arvSeatNoMap);
		
		List<ReservationVO> dptReservationList = new ArrayList<ReservationVO>();
		List<ReservationVO> arvReservationList = new ArrayList<ReservationVO>();
		
		int reservationId = reservationService.getReservationId();
		
		for(int i = 0; i < passengerCnt; i++) { 
			ReservationVO dptReservationVO = new ReservationVO();
			ReservationVO arvReservationVO = new ReservationVO();
			
			dptReservationVO.setReservationId(reservationId);
			arvReservationVO.setReservationId(reservationId);
			
			dptReservationVO.setPassengerId(passengerList.get(i));
			arvReservationVO.setPassengerId(passengerList.get(i));
			
			dptReservationVO.setSeatNo(dptSeatNoList.get(i));
			arvReservationVO.setSeatNo(arvSeatNoList.get(i));
			
			dptReservationVO.setUserId(userId);
			arvReservationVO.setUserId(userId);
			
			dptReservationList.add(dptReservationVO);
			arvReservationList.add(arvReservationVO);
		}
		
		reservationService.insertReservation(dptReservationList, arvReservationList);
		
		return "reservation/confirmReservation";
	}
}
