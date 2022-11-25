package com.ezen.springplanetrip.service.flight.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.springplanetrip.service.flight.FlightService;
import com.ezen.springplanetrip.vo.AirportVO;
import com.ezen.springplanetrip.vo.FlightVO;

@Service
public class FlightServiceImpl implements FlightService{
	@Autowired
	private FlightDAO flightDAO;

	@Override
	public List<FlightVO> viewFlight(FlightVO flightVO) {
		return flightDAO.viewFlight(flightVO);
	}

	@Override
	public List<AirportVO> viewAirport(AirportVO airportVO) {
		return flightDAO.viewAirport(airportVO);
	}
	
	
}
