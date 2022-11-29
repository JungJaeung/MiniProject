package com.ezen.springplanetrip.service.passenger.impl;

<<<<<<< HEAD
import com.ezen.springplanetrip.service.passenger.PassengerService;

public class PassengerServiceImpl implements PassengerService{
=======
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.ezen.springplanetrip.service.passenger.PassengerService;
import com.ezen.springplanetrip.vo.PassengerVO;

@Service
public class PassengerServiceImpl implements PassengerService{
	@Autowired
	private PassengerDAO passengerDAO;
	
	@Override
	public int insertPassenger(PassengerVO passengerVO) {
		
		return passengerDAO.insertPassenger(passengerVO);
	}
>>>>>>> 9bb1ab0732aac5279d98704e0415f7a8e98e40f5

}
