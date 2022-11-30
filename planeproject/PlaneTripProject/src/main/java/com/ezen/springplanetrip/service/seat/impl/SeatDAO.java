package com.ezen.springplanetrip.service.seat.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.springplanetrip.vo.SeatVO;

@Repository
public class SeatDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<SeatVO> viewSeatList(int flightId) {
		return mybatis.selectList("seatDAO.viewSeatList",flightId);
	}
	
	public List<Integer> viewSeatCount(int flightId) {
		return mybatis.selectList("seatDAO.viewSeatCount",flightId);
	}
	
	public List<Integer> viewSeatPrice(int flightId) {
		return mybatis.selectList("seatDAO.viewSeatPrice", flightId);
	}
	
	public List<Object> viewSeatClass(int flightId) {
		System.out.println("가져가기전 flightId:" + flightId);
		return mybatis.selectList("SeatDAO.viewSeatClass", flightId);
	}
}
