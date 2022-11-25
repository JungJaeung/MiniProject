package com.ezen.springplanetrip.service.account;

import java.util.List;

import com.ezen.springplanetrip.vo.PassengerVO;
import com.ezen.springplanetrip.vo.UserVO;

//구현할 인터페이스 메소드 추상메소드 입력
public interface AccountService {
	
	int join(UserVO userVO);
	
	PassengerVO login(UserVO userVO);
	
	List<PassengerVO> viewMypage();
	
	void quit(UserVO userVO);
	
	void updateInfo(UserVO userVO);
	
	int idCheck(String email);
	
	PassengerVO findId(UserVO userVO);
	
	PassengerVO findPassword(UserVO userVO);
	
}
