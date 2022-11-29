package com.ezen.springplanetrip.service.seat.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.springplanetrip.service.seat.SeatService;
import com.ezen.springplanetrip.vo.SeatVO;

@Service
public class SeatServiceImpl implements SeatService{
	@Autowired
	private SeatDAO seatDAO;
	
	@Override
	public List<SeatVO> viewSeatList(int flightId) {
		return seatDAO.viewSeatList(flightId);
	}
	
	@Override
	public List<Integer> viewSeatCount(int flightId) {
		return seatDAO.viewSeatCount(flightId);
	}
	
	@Override
	public List<Integer> viewSeatPrice(int flightId) {
		return seatDAO.viewSeatPrice(flightId);
	}
}
