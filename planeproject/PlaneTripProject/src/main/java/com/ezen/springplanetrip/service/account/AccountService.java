package com.ezen.springplanetrip.service.account;

import java.util.List;

import com.ezen.springplanetrip.vo.PassengerVO;
import com.ezen.springplanetrip.vo.UserVO;

//구현할 인터페이스 메소드 추상메소드 입력
public interface AccountService {
	
	int join(UserVO userVO);
	
	UserVO login(UserVO userVO);
	
	List<UserVO> viewMypage();
	
	int quit(UserVO userVO);
	
	int updateInfo(UserVO userVO);
	
	int idCheck(String email);
	
	UserVO findId(UserVO userVO);
	
	UserVO findPassword(UserVO userVO);
	
}
