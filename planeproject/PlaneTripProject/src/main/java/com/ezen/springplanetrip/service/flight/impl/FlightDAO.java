package com.ezen.springplanetrip.service.flight.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.springplanetrip.vo.AirportVO;
import com.ezen.springplanetrip.vo.FlightVO;

@Repository
public class FlightDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<FlightVO> viewFlight(Map<String, Object> flightMap) {
		return mybatis.selectList("FlightDAO.viewFlight", flightMap);
	}

	public List<AirportVO> viewAirport(Map<String, String> airportMap) {
		return mybatis.selectList("FlightDAO.viewAirport", airportMap);
	}

}
