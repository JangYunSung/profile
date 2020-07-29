package com.spring.home.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.home.model.dto.MemberDTO;
import com.spring.home.service.MemberService;

@Controller
public class MemberController {

	@Inject
	MemberService memberservice;

	@RequestMapping("/")
	public String main(Model model) {
		// model에 자료저장 (서블릿의 request 객체에 해당)
		model.addAttribute("message", "홈페이지 방문을 환영합니다.");
		// loginForm.jsp로 포워딩됨
		// /WEB-INF/views/member/loginForm.jsp
		return "member/loginForm";
	}

	@RequestMapping("joinform.do")
	public String memberJoinForm() {
		return "member/joinForm";
	}

	@RequestMapping("join.do")
	public String memberJoin(MemberDTO memberdto) {
		memberservice.insertMember(memberdto);
		return "member/loginForm";
	}

	// @RequestParm : get, post 방식으로 전달된 파라미터 변수
	// request.getParameter("변수명")를 대체하는 코드
	// defaultValue="기본값"
	
	@RequestMapping(value="login.do")
	public String memberlogin(String userid, String userpw, Model model, HttpSession session) {
		boolean result = memberservice.memberlogin(userid, userpw);
		if (result) {
			session.setAttribute("userid", userid);
			session.setAttribute("userpw", userpw);
			return "main";
		} else {
			model.addAttribute("message", "아이디 또는 비밀번호를 확인하세요.");
			return "alert";
		}
	}
	
	@RequestMapping("memberlist.do")
	public String memberlist(Model model) {
		List<MemberDTO> list = memberservice.memberlist();
		
		model.addAttribute("list", list);
		
		return "member/memberlist";
	}
	
	@RequestMapping("memberview.do")
	public String memberview(String userid, Model model) {
		// 모델에 자료 저장
		model.addAttribute("memberdto", memberservice.memberview(userid));
		
		return "member/memberview";
	}
	
	@RequestMapping("memberdelete.do")
	public String memberdelete(String userid) {
		
		memberservice.memberdelete(userid);
		
		return "redirect:./memberlist.do";
	}
	
	@RequestMapping("main.do")
	public String main() {
		return "main";
	}
	
	@RequestMapping("myinfo.do")
	public String myinfo(String userid, Model model) {
		model.addAttribute("memberdto", memberservice.myinfo(userid));
		
		return "member/memberview";
	}
	
	@RequestMapping("modifyForm.do")
	public String modifyForm() {
		return "member/modifyForm";
	}
	
	@RequestMapping("membermodify.do")
	public String membermodify(MemberDTO memberdto) {
		memberservice.membermodify(memberdto);
		return "redirect:myinfo.do?userid="+memberdto.getUserid();
	}

}
