package com.ezen.springplanetrip.vo;

/*java.sql.Date 대신 좀 더 자세한 util.Date 선택.
특정 문자열 포맷으로 얻고 싶으면 java.text.SimpleDateFormat 클래스를 이용*/
import java.util.Date;

public class FlightVO {
	private int filghtId;
	private Date departTime;
	private Date arrivalTime; 
	private int aircraftId;
	private int airportCityId; 
	private int airportId;
	
	public int getFilghtId() {
		return filghtId;
	}
	
	public void setFilghtId(int filghtId) {
		this.filghtId = filghtId;
	}
	
	public Date getDepartTime() {
		return departTime;
	}
	
	public void setDepartTime(Date departTime) {
		this.departTime = departTime;
	}
	
	public Date getArrivalTime() {
		return arrivalTime;
	}
	
	public void setArrivalTime(Date arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	
	public int getAircraftId() {
		return aircraftId;
	}
	
	public void setAircraftId(int aircraftId) {
		this.aircraftId = aircraftId;
	}
	
	public int getAirportCityId() {
		return airportCityId;
	}
	
	public void setAirportCityId(int airportCityId) {
		this.airportCityId = airportCityId;
	}
	
	public int getAirportId() {
		return airportId;
	}
	
	public void setAirportId(int airportId) {
		this.airportId = airportId;
	}

	@Override
	public String toString() {
		return "FlightVO [filghtId=" + filghtId + ", departTime=" + departTime + ", arrivalTime=" + arrivalTime
				+ ", aircraftId=" + aircraftId + ", airportCityId=" + airportCityId + ", airportId=" + airportId + "]";
	}
	
}
