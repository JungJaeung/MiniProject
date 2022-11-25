package com.ezen.springplanetrip.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.springplanetrip.service.account.AccountService;
import com.ezen.springplanetrip.vo.PassengerVO;
import com.ezen.springplanetrip.vo.UserVO;

@Controller
@RequestMapping("/Account")
public class AccountController {
	@Autowired
	private AccountService accountService;
	
	public String reserve(PassengerVO passengerVO) {
		return null;
	}

	public String viewMypage() {
		return null;
	}

	public String quit(PassengerVO passengerVO) {
		return null;
	}

	public String updateInfo(PassengerVO passengerVO) {
		return null;
	}
	
	@GetMapping("/join.do")
	public String joinView() {
		return "Account/join";
	}
	
	@PostMapping(value="/join.do", produces="application/text; charset=UTF-8")
	public String join(UserVO userVO, Model model) {
		int joinResult = accountService.join(userVO);
		
		if(joinResult == 0) {
			model.addAttribute("joinMsg", "회원가입에 실패하셨습니다. 관리자에게 문의해주세요.");
			return "Account/join";
		}
		
		model.addAttribute("joinMsg", "회원가입에 성공했습니다. 로그인해주세요.");
		return "Account/login";
	}
	
	
	@PostMapping("/idCheck.do")
	@ResponseBody
	public String idCheck(UserVO userVO) {
		
		String returnStr = "";
		
		int idCnt = accountService.idCheck(userVO.getEmail());
		
		if(idCnt > 0) {
			returnStr = "duplicatedId";
		} else {
			returnStr = "idOk";
		}
		
		return returnStr;
	}
	
	
	@GetMapping("/login.do")
	public String loginView() {
		return "Account/login";
	}
	
	@PostMapping("/login.do")
	@ResponseBody
	public String login(UserVO userVO, HttpSession session) {

		int idCheck = accountService.idCheck(userVO.getEmail());
		
		if(idCheck < 1) {
			return "idFail";
		} else {
			PassengerVO loginUser = accountService.login(userVO);
			
			if(loginUser == null) {
				return "pwFail";
			}
			
			session.setAttribute("loginUser", loginUser);
			return "loginSuccess";
		}
	}
	
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/mainPage.jsp";
	}
	
	//-----------------------------------------------------------------------------------
	// 아이디 찾기 페이지 이동
		@GetMapping(value="findId.do")
		public String findIdView() {
			return "Account/findId";
		}
		
	    // 아이디 찾기 실행
		@PostMapping(value="findId.do")
		@ResponseBody
		public String findIdAction(UserVO userVO) {
			PassengerVO user = accountService.findId(userVO);
			String idCheck = ""; 
			if(user == null) { 
				idCheck = "noexist";
			} else { 
				idCheck = user.getEmail();
			}
			
			return idCheck;
		}
		
	    // 비밀번호 찾기 페이지로 이동
		@GetMapping(value="findPassword.do")
		public String findPasswordView() {
			return "Account/findPassword";
		}
		
	    // 비밀번호 찾기 실행
		@PostMapping(value="findPassword.do")
		@ResponseBody
		public String findPasswordAction(UserVO userVO) {
			PassengerVO user = accountService.findPassword(userVO);
			
			String passwordCheck = ""; 
			if(user == null) { 
				passwordCheck = "noexist";
			} else { 
				passwordCheck = user.getPassword();
			}
			
			return passwordCheck;
		}
}
