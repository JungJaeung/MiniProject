package com.ezen.springplanetrip.vo;

/*java.sql.Date 대신 좀 더 자세한 util.Date 선택.
특정 문자열 포맷으로 얻고 싶으면 java.text.SimpleDateFormat 클래스를 이용*/
import java.util.Date;

public class ReservationVO {
	private int reservationId;
	private Date departDateTime;
	private Date arrivalDateTime;
	private int passengerId;
	private int filghtId;
	private int aircraftId;
	private int seatId;
	
	public int getReservationId() {
		return reservationId;
	}
	
	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}
	
	public Date getDepartDateTime() {
		return departDateTime;
	}
	
	public void setDepartDateTime(Date departDateTime) {
		this.departDateTime = departDateTime;
	}
	
	public Date getArrivalDateTime() {
		return arrivalDateTime;
	}
	
	public void setArrivalDateTime(Date arrivalDateTime) {
		this.arrivalDateTime = arrivalDateTime;
	}
	
	public int getPassengerId() {
		return passengerId;
	}
	
	public void setPassengerId(int passengerId) {
		this.passengerId = passengerId;
	}
	
	public int getFilghtId() {
		return filghtId;
	}
	
	public void setFilghtId(int filghtId) {
		this.filghtId = filghtId;
	}
	
	public int getAircraftId() {
		return aircraftId;
	}
	
	public void setAircraftId(int aircraftId) {
		this.aircraftId = aircraftId;
	}
	
	public int getSeatId() {
		return seatId;
	}
	
	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}

	@Override
	public String toString() {
		return "ReservationVO [reservationId=" + reservationId + ", departDateTime=" + departDateTime
				+ ", arrivalDateTime=" + arrivalDateTime + ", passengerId=" + passengerId + ", filghtId=" + filghtId
				+ ", aircraftId=" + aircraftId + ", seatId=" + seatId + "]";
	}
	
}
