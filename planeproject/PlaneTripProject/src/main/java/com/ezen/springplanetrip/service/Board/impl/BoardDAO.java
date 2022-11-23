package com.ezen.springplanetrip.service.Board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.springplanetrip.vo.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<BoardVO> viewList() {
		return mybatis.selectList("BoardDAO.viewList");
	}
	
	public void addBoard(BoardVO boardVO) {
		mybatis.insert("BoardDAO.addBoard", boardVO);
	}
	
	public void updateBoard(BoardVO boardVO) {
		mybatis.update("BoardDAO.updateBoard", boardVO);
	}
	
	public void deleteBoard(BoardVO boardVO) {
		mybatis.delete("BoardDAO.deleteBoard", boardVO);
	}
}
