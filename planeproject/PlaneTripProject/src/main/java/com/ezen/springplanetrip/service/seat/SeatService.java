package com.ezen.springplanetrip.service.seat;

import java.util.List;

import com.ezen.springplanetrip.vo.SeatVO;

public interface SeatService {
	List<SeatVO> viewSeatList(int flightId);
	
	List<Integer> viewSeatCount(int flightId);
	
	List<Integer> viewSeatPrice(int flightId);
}
