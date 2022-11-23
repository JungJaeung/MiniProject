package com.ezen.springplanetrip.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.springplanetrip.service.account.BoardService;
import com.ezen.springplanetrip.vo.BoardVO;

@Controller
@RequestMapping("/Board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	public String viewList() {
		return null;
	}
	
	public String addBoard(BoardVO boardVO) {
		return null;
	}
	
	public String updateBoard(BoardVO boardVO) {
		return null;
	}
	
	public String deleteBoard(BoardVO boardVO) {
		return null;
	}
}
