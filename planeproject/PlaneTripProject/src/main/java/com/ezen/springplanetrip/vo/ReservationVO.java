package com.ezen.springplanetrip.vo;

/*java.sql.Date 대신 좀 더 자세한 util.Date 선택.
특정 문자열 포맷으로 얻고 싶으면 java.text.SimpleDateFormat 클래스를 이용*/
import java.util.Date;

public class ReservationVO {
	private int reservationId;
	private int passengerId;
	private int flightId;
	private int seatId;
	private Date departDatetime;
	private Date arrivalDatetime;
	private String seatNo;
	private String updateReservation;
	private int userId;
	private String seatCol;
	
	public int getReservationId() {
		return reservationId;
	}
	public void setReservationId(int reservationId) {
		this.reservationId = reservationId;
	}
	public int getPassengerId() {
		return passengerId;
	}
	public void setPassengerId(int passengerId) {
		this.passengerId = passengerId;
	}
	public int getFlightId() {
		return flightId;
	}
	public void setFlightId(int flightId) {
		this.flightId = flightId;
	}
	public int getSeatId() {
		return seatId;
	}
	public void setSeatId(int seatId) {
		this.seatId = seatId;
	}
	public Date getDepartDatetime() {
		return departDatetime;
	}
	public void setDepartDatetime(Date departDatetime) {
		this.departDatetime = departDatetime;
	}
	public Date getArrivalDatetime() {
		return arrivalDatetime;
	}
	public void setArrivalDatetime(Date arrivalDatetime) {
		this.arrivalDatetime = arrivalDatetime;
	}
	public String getSeatNo() {
		return seatNo;
	}
	public void setSeatNo(String seatNo) {
		this.seatNo = seatNo;
	}
	public String getUpdateReservation() {
		return updateReservation;
	}
	public void setUpdateReservation(String updateReservation) {
		this.updateReservation = updateReservation;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getSeatCol() {
		return seatCol;
	}
	public void setSeatCol(String seatCol) {
		this.seatCol = seatCol;
	}
	@Override
	public String toString() {
		return "ReservationVO [reservationId=" + reservationId + ", passengerId=" + passengerId + ", flightId="
				+ flightId + ", seatId=" + seatId + ", departDatetime=" + departDatetime + ", arrivalDatetime="
				+ arrivalDatetime + ", seatNo=" + seatNo + ", updateReservation=" + updateReservation + ", userId="
				+ userId + ", seatCol=" + seatCol + "]";
	}
	
	
	
}