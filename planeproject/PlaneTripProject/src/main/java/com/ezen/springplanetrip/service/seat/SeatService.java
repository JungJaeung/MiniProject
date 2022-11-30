package com.ezen.springplanetrip.service.seat;

import java.util.List;
import java.util.Map;

import com.ezen.springplanetrip.vo.SeatVO;

public interface SeatService {
	List<SeatVO> viewSeatList(int flightId);
	
	List<Integer> viewSeatCount(int flightId);
	
	List<Integer> viewSeatPrice(int flightId);
	
	List<Object> viewSeatClass(int flightId);
}
