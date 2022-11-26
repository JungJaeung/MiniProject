package com.ezen.springplanetrip.service.reservation.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReservationServiceImpl {
	@Autowired
	private ReservationDAO reservationDAO;
}
