package com.ezen.springplanetrip.service.reservation.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.springplanetrip.service.reservation.ReservationService;
import com.ezen.springplanetrip.vo.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService{
	@Autowired
	private ReservationDAO reservationDAO;

	@Override
	public List<Integer> getPassengerList(int userId, int passengerCnt) {
		// TODO Auto-generated method stub
		return reservationDAO.getPassengerList(userId, passengerCnt);
	}

	@Override
	public List<String> getSeatNoList(Map<String, Object> dptSeatNoMap) {
		// TODO Auto-generated method stub
		return reservationDAO.getSeatNoList(dptSeatNoMap);
	}

	@Override
	public void insertReservation(List<ReservationVO> dptReservationList, List<ReservationVO> arvReservationList) {
		// TODO Auto-generated method stub
		reservationDAO.insertReservation(dptReservationList, arvReservationList);
	}

	@Override
	public int getReservationId() {
		// TODO Auto-generated method stub
		return reservationDAO.getReservationId();
	}
}
