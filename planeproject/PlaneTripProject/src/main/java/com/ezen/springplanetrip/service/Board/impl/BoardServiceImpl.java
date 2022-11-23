package com.ezen.springplanetrip.service.Board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.springplanetrip.service.Board.BoardService;
import com.ezen.springplanetrip.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> viewList() {
		return boardDAO.viewList();
	}
	
	@Override
	public void addBoard(BoardVO boardVO) {
		boardDAO.addBoard(boardVO);
	}
	
	@Override
	public void updateBoard(BoardVO boardVO) {
		boardDAO.updateBoard(boardVO);
	}
	
	@Override
	public void deleteBoard(BoardVO boardVO) {
		boardDAO.deleteBoard(boardVO);
	}
	
	
}
