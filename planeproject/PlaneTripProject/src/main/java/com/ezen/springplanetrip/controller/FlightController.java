package com.ezen.springplanetrip.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.springplanetrip.service.flight.impl.FlightServiceImpl;

@Controller
@RequestMapping("/flight")
public class FlightController {
	@Autowired
	private FlightServiceImpl FlightService;
	
	@PostMapping("/searchFlight")
	public String getFlightList(Model model) {
		
		return "flight/searchFlight";
	}
}
