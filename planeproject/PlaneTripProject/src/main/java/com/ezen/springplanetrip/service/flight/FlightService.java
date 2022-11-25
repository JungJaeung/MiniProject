package com.ezen.springplanetrip.service.flight;

import java.util.List;

import com.ezen.springplanetrip.vo.AirportVO;
import com.ezen.springplanetrip.vo.FlightVO;

public interface FlightService {
	List<FlightVO> viewFlight(FlightVO flightVO);
	
	List<AirportVO> viewAirport(AirportVO airportVO);
}
