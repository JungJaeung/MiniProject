package com.ezen.springplanetrip.service.account;

import java.util.List;

import com.ezen.springplanetrip.vo.PassengerVO;

//구현할 인터페이스 메소드 추상메소드 입력
public interface AccountService {
	
	void join(PassengerVO passengerVO);
	
	PassengerVO login(PassengerVO passengerVO);
	
	List<PassengerVO> viewMypage();
	
	void quit(PassengerVO passengerVO);
	
	void updateInfo(PassengerVO passengerVO);
	
	
}
