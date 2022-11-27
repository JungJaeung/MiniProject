package com.ezen.springplanetrip.vo;

import java.sql.Date;

public class BoardVO {
	private int boardId; //boardNumber
	private String boardTitle;
	private String boardContent;
	private String boardWriter; 
	private int boardCount;	
	private int passengerId;//??
	private Date boardRegdate;
	private boolean secret;
	
	public int getBoardId() {
		return boardId;
	}
	
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	
	public String getBoardTitle() {
		return boardTitle;
	}
	
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	
	public String getBoardContent() {
		return boardContent;
	}
	
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	
	public String getBoardWriter() {
		return boardWriter;
	}
	
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	
	public int getBoardCount() {
		return boardCount;
	}
	
	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
	}
	
	public int getPassengerId() {
		return passengerId;
	}
	
	public void setPassengerId(int passengerId) {
		this.passengerId = passengerId;
	}
	
	public Date getBoardRegdate() {
		return boardRegdate;
	}
	
	public void setBoardRegdate(Date boardRegdate) {
		this.boardRegdate = boardRegdate;
	}
	
	public boolean isSecret() {
		return secret;
	}
	
	public void setSecret(boolean secret) {
		this.secret = secret;
	}
	
	@Override
	public String toString() {
		return "BoardVO [boardId=" + boardId + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
				+ ", boardWriter=" + boardWriter + ", boardCount=" + boardCount + ", passengerId=" + passengerId
				+ ", boardRegdate=" + boardRegdate + ", secret=" + secret + "]";
	}
	
	

}
