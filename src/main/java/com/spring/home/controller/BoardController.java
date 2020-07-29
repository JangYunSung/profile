package com.spring.home.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.home.model.dto.BoardDTO;
import com.spring.home.service.BoardService;
import com.spring.home.utils.PagingVO;

@Controller
@RequestMapping("/board/*") // 공통적인 url pattern이 있을 시에 작성
public class BoardController {
	
	@Inject // 의존관계 주입
	BoardService boardservice;
	
	  @RequestMapping("boardlist.bo") public String boardlist(Model model) {
	  List<BoardDTO> boardlist = boardservice.boardlist();
	  model.addAttribute("boardlist", boardlist); return "board/boardlist"; }
	
	
	@GetMapping("blist.bo")
	public String boardList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = boardservice.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		List<BoardDTO> i = boardservice.selectBoard(vo);
		model.addAttribute("viewAll",i);
		return "board/boardPaging";
	}
	
	@RequestMapping("boardwriteForm.bo")
	public String boardwriteForm() {
		return "board/boardwriteForm";
	}
	
	@RequestMapping("boardwrite.bo")
	public String boardwrite(BoardDTO boarddto) {
		boardservice.boardwrite(boarddto);
		return "redirect:./blist.bo";
	}
	
	@RequestMapping("boarddelete.bo")
	public String boarddelete(int idx) {
		boardservice.boarddelete(idx);
		return "redirect:./blist.bo";
	}
	
	// 글번호가 PathVariable로 url에 포함되어 전달 됨.
	@RequestMapping("boarddetail.bo/{idx}")
	public String boarddetail(@PathVariable int idx, Model model) {
		BoardDTO boarddto = boardservice.boarddetail(idx);
		model.addAttribute("boarddto", boarddto);
		return "board/boarddetail";
	}
	
	@RequestMapping("boardmodifyForm.bo/{idx}")
	public String boardmodify(@PathVariable int idx, Model model) {
		BoardDTO boarddto = boardservice.boarddetail(idx);
		model.addAttribute("boarddto", boarddto);
		return "board/boardmodifyForm";
	}
	
	@RequestMapping("boardupdate.bo/{idx}")
	public String boardupdate(BoardDTO boarddto) {
		boardservice.boardupdate(boarddto);
		return "redirect:/board/boarddetail.bo/{idx}";
	}
}
