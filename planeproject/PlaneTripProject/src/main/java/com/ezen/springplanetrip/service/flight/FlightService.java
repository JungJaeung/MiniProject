package com.ezen.springplanetrip.service.flight;

import java.util.List;
import java.util.Map;

import com.ezen.springplanetrip.vo.AirportVO;
import com.ezen.springplanetrip.vo.FlightVO;

public interface FlightService {
	List<FlightVO> viewFlight(Map<String, Object> flightMap);
	
	List<AirportVO> viewAirport(Map<String, String> airportMap);
}
