package com.ezen.springplanetrip.vo;

public class AirportVO {
	private int cityId;
	private int airportId;
	private String airportName;
	private String airportCode;
	private char airportOrigin;
	private String cityName;
	private String airportHomepage;
	private String airportTel;
	private String airportHours;
	
	public int getCityId() {
		return cityId;
	}
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	public int getAirportId() {
		return airportId;
	}
	public void setAirportId(int airportId) {
		this.airportId = airportId;
	}
	public String getAirportName() {
		return airportName;
	}
	public void setAirportName(String airportName) {
		this.airportName = airportName;
	}
	public String getAirportCode() {
		return airportCode;
	}
	public void setAirportCode(String airportCode) {
		this.airportCode = airportCode;
	}
	public char getAirportOrigin() {
		return airportOrigin;
	}
	public void setAirportOrigin(char airportOrigin) {
		this.airportOrigin = airportOrigin;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getAirportHomepage() {
		return airportHomepage;
	}
	public void setAirportHomepage(String airportHomepage) {
		this.airportHomepage = airportHomepage;
	}
	public String getAirportTel() {
		return airportTel;
	}
	public void setAirportTel(String airportTel) {
		this.airportTel = airportTel;
	}
	public String getAirportHours() {
		return airportHours;
	}
	public void setAirportHours(String airportHours) {
		this.airportHours = airportHours;
	}
	
	@Override
	public String toString() {
		return "AirportVO [cityId=" + cityId + ", airportId=" + airportId + ", airportName=" + airportName
				+ ", airportCode=" + airportCode + ", airportOrigin=" + airportOrigin + ", cityName=" + cityName
				+ ", airportHomepage=" + airportHomepage + ", airportTel=" + airportTel + ", airportHours="
				+ airportHours + "]";
	}
	
	
}
