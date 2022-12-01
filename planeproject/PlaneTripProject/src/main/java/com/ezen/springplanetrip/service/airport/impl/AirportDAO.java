package com.ezen.springplanetrip.service.airport.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.springplanetrip.vo.AirportVO;

@Repository
public class AirportDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<AirportVO> getAirportList(AirportVO airportVO){
		return mybatis.selectList("BoardDAO.getAirportList", airportVO);
	}
}
