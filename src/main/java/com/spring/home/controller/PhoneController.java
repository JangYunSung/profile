package com.spring.home.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.home.model.dto.PhoneDTO;
import com.spring.home.service.PhoneService;
import com.spring.home.utils.PagingVO;

@Controller
@RequestMapping("/phone/*") // 공통적인 url pattern이 있을 시에 작성
public class PhoneController {
	
	@Inject // 의존관계 주입
	PhoneService phoneservice;
	
	
	/*
	 * @RequestMapping("plist.pb") public String phonelist(Model model) {
	 * List<PhoneDTO> phonelist = phoneservice.phonelist();
	 * model.addAttribute("phonelist", phonelist); return "phone/phonelist"; }
	 */
	
	@GetMapping("phonelist.pb")
	public String phoneList(PagingVO vo, Model model
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage) {
		
		int total = phoneservice.countPhone();
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
		List<PhoneDTO> i = phoneservice.selectPhone(vo);
		model.addAttribute("phonepaging",i);
		return "phone/phonePaging";
	}
	
	@RequestMapping("phonewriteForm.pb")
	public String phonewriteForm() {
		return "phone/phonewriteForm";
	}
	
	@RequestMapping("phonewrite.pb")
	public String phonewrite(PhoneDTO phonedto) {
		phoneservice.phonewrite(phonedto);
		return "redirect:./phonelist.pb";
	}
	
	@RequestMapping("phonedelete.pb")
	public String phonedelete(int idx) {
		phoneservice.phonedelete(idx);
		return "redirect:./phonelist.pb";
	}
	
	// 글번호가 PathVariable로 url에 포함되어 전달 됨.
	@RequestMapping("phonedetail.pb/{idx}")
	public String phonedetail(@PathVariable int idx, Model model) {
		PhoneDTO phonedto = phoneservice.phonedetail(idx);
		model.addAttribute("phonedto", phonedto);
		return "phone/phonedetail";
	}
	
	@RequestMapping("phonemodifyForm.pb/{idx}")
	public String phonemodify(@PathVariable int idx, Model model) {
		PhoneDTO phonedto = phoneservice.phonedetail(idx);
		model.addAttribute("phonedto", phonedto);
		return "phone/phonemodifyForm";
	}
	
	@RequestMapping("phoneupdate.pb/{idx}")
	public String phoneupdate(PhoneDTO phonedto) {
		phoneservice.phoneupdate(phonedto);
		return "redirect:/phone/phonedetail.pb/{idx}";
	}
}
