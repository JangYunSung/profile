package com.spring.home.service;

import java.util.List;

import com.spring.home.model.dto.BoardDTO;
import com.spring.home.utils.PagingVO;

public interface BoardService {

	public List<BoardDTO> boardlist();
	public void boardwrite(BoardDTO boarddto);
	public void boarddelete(int idx);
	public BoardDTO boarddetail(int idx);
	public void boardupdate(BoardDTO dto);
	// 게시물 총 갯수
	public int countBoard();

	// 페이징 처리 게시글 조회
	public List<BoardDTO> selectBoard(PagingVO vo);

}
