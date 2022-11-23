package com.ezen.springplanetrip.service.account;

import java.util.List;

import com.ezen.springplanetrip.vo.BoardVO;

public interface BoardService {
	
	List<BoardVO> viewList();
	
	void addBoard(BoardVO boardVO);
	
	void updateBoard(BoardVO boardVO);
	
	void deleteBoard(BoardVO boardVO);
}
