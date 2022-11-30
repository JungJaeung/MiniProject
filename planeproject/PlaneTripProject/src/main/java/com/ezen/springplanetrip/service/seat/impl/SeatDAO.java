package com.ezen.springplanetrip.service.seat.impl;

import java.util.HashMap;
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
		return mybatis.selectList("SeatDAO.viewSeatList",flightId);
	}
	
	public List<Integer> viewSeatCount(int flightId) {
		return mybatis.selectList("SeatDAO.viewSeatCount",flightId);
	}
	
	public int viewSeatRemain(int flightId, int seatId) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("flightId", flightId);
		map.put("seatId", seatId);
		System.out.println("가지기 전 비행편 좌석 Id데이터: " + map.get("seatId"));
		return mybatis.selectOne("SeatDAO.viewSeatRemain", map);
	}
	
	public List<Integer> viewSeatClass(int flightId) {
		System.out.println("가져가기전 flightId:" + flightId);
		return mybatis.selectList("SeatDAO.viewSeatClass", flightId);
	}
}
