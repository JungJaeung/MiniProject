package com.ezen.springplanetrip.vo;

public class SeatVO {
	private int aircraftId; 
	private int seatId; 
	private int seatPrice;
	private int seatTotal;
	
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
	public int getSeatPrice() {
		return seatPrice;
	}
	public void setSeatPrice(int seatPrice) {
		this.seatPrice = seatPrice;
	}
	public int getSeatTotal() {
		return seatTotal;
	}
	public void setSeatTotal(int seatTotal) {
		this.seatTotal = seatTotal;
	}
	@Override
	public String toString() {
		return "SeatVO [aircraftId=" + aircraftId + ", seatId=" + seatId + ", seatPrice=" + seatPrice + ", seatTotal="
				+ seatTotal + "]";
	}
}
