package com.spring.home.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.home.model.dto.BoardDTO;
import com.spring.home.utils.PagingVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public List<BoardDTO> boardlist() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("board.boardlist");
	}

	@Override
	public void boardwrite(BoardDTO boarddto) {
		// TODO Auto-generated method stub
		sqlsession.insert("board.boardwrite", boarddto);
	}

	@Override
	public void boarddelete(int idx) {
		// TODO Auto-generated method stub
		sqlsession.delete("board.boarddelete", idx);
	}

	@Override
	public BoardDTO boarddetail(int idx) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("board.boarddetail", idx);
	}

	@Override
	public void boardupdate(BoardDTO boarddto) {
		// TODO Auto-generated method stub
		sqlsession.update("board.boardupdate", boarddto);
	}
	
	
	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("board.countBoard");
	}
	@Override
	public List<BoardDTO> selectBoard(PagingVO vo) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("board.selectBoard", vo);
	}
	
	

}
