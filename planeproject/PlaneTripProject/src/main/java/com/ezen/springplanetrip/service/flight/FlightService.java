package com.ezen.springplanetrip.service.flight;

import java.util.List;

import org.springframework.ui.Model;

import com.ezen.springplanetrip.vo.FlightVO;

public interface FlightService {
	List<FlightVO> getFlightList(Model model);
}
