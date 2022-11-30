package com.ezen.springplanetrip.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.springplanetrip.service.airport.AirportService;

@Controller
@RequestMapping("/airport")
public class AirportController {
	@Autowired
	private AirportService airportService;
	
	public String getAirportList() {
		return null;
	}
}
