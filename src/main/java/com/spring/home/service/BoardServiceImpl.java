package com.spring.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.home.model.dao.BoardDAO;
import com.spring.home.model.dto.BoardDTO;
import com.spring.home.utils.PagingVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO boarddao;
	
	@Override
	public List<BoardDTO> boardlist() {
		// TODO Auto-generated method stub
		return boarddao.boardlist();
	}

	@Override
	public void boardwrite(BoardDTO boarddto) {
		// TODO Auto-generated method stub
		boarddao.boardwrite(boarddto);
	}

	@Override
	public void boarddelete(int idx) {
		// TODO Auto-generated method stub
		boarddao.boarddelete(idx);
	}

	@Override
	public BoardDTO boarddetail(int idx) {
		// TODO Auto-generated method stub
		return boarddao.boarddetail(idx);
	}

	@Override
	public void boardupdate(BoardDTO boarddto) {
		// TODO Auto-generated method stub
		boarddao.boardupdate(boarddto);
	}
	@Override
	public int countBoard() {
		return boarddao.countBoard();
	}

	@Override
	public List<BoardDTO> selectBoard(PagingVO vo) {
		return boarddao.selectBoard(vo);
	}
	
	
}
