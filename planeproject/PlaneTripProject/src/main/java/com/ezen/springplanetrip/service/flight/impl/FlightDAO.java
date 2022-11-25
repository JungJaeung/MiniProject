package com.ezen.springplanetrip.service.flight.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.springplanetrip.vo.AirportVO;
import com.ezen.springplanetrip.vo.FlightVO;

@Repository
public class FlightDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	public List<FlightVO> viewFlight(FlightVO flightVO) {
		return mybatis.selectList("FlightDAO.viewFlight", flightVO);
	}

	public List<AirportVO> viewAirport(AirportVO airportVO) {
		return mybatis.selectList("FlightDAO", airportVO);
	}
	
	
	
}
