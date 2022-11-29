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
import com.ezen.springplanetrip.vo.UserVO;

@Controller
@RequestMapping("/Account")
public class AccountController {
	@Autowired
	private AccountService accountService;
	
	public String reserve(UserVO userVO) {
		return null;
	}
	
	
	
	//회원정보는 loginUser에 담겨져 있음. 화면단에서 .get으로 출력
	
	//마이페이지로 이동
	@GetMapping("/mypage.do") 
	public String viewMypage() {
		return "Account/mypage";
	}
	
	//회원정보 수정 페이지로 이동
	@GetMapping("/userUpdate.do")
	public String updatePage() {
		return "Account/userUpdate";
	}
	
	//회원정보 수정 처리
	public String updateInfo(UserVO userVO, Model model) {
		
		int updateResult = accountService.updateInfo(userVO);
		if(updateResult == 0) {
			model.addAttribute("quitMsg", "회원정보 수정 실패");
			return "Account/userUpdate";
		} else {
			model.addAttribute("quitMsg", "회원정보 수정 성공");
			return "../mainPage";
		}
	}
	
	//회원탈퇴
	@PostMapping(value="/quit.do", produces="application/text; charset=UTF-8")
	public String quit(UserVO userVO , Model model) {
		int quitResult = accountService.quit(userVO);
		if(quitResult == 0) {
			model.addAttribute("quitMsg", "회원탈퇴에 실패하였습니다.");
			return "Account/userUpdate";
		} else {
			model.addAttribute("quitMsg", "회원탈퇴에 성공하였습니다.");
			return "../mainPage";
		}
		
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
		System.out.println(idCheck);
		if(idCheck < 1) {
			return "idFail";
		} else {
			UserVO loginUser = accountService.login(userVO);
			
			
			if(loginUser == null) {
				return "pwFail";
			} else {
				System.out.println("로그인 시도한 계정 : " + loginUser.getEmail());
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
			System.out.println(userVO.toString());
			UserVO user = accountService.findId(userVO);
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
			UserVO user = accountService.findPassword(userVO);
			
			String passwordCheck = ""; 
			if(user == null) { 
				passwordCheck = "noexist";
			} else { 
				passwordCheck = user.getPassword();
			}
			
			return passwordCheck;
		}
}
