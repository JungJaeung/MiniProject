package com.ezen.springplanetrip.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.springplanetrip.service.Board.BoardService;
import com.ezen.springplanetrip.vo.BoardVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/getBoardList.do")
	public String viewList() {
		return null;
	}
	
	@PostMapping("/insertBoard.do")
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
