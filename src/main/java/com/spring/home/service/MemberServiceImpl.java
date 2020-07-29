package com.spring.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.home.model.dao.MemberDAO;
import com.spring.home.model.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO memberdao;
	
	@Override
	public void insertMember(MemberDTO memberdto) {
		memberdao.insertMember(memberdto);
		
	}

	@Override
	public boolean memberlogin(String userid, String userpw) {
		return memberdao.memberlogin(userid, userpw);
	}

	@Override
	public List<MemberDTO> memberlist() {
		// TODO Auto-generated method stub
		return memberdao.memberlist();
	}

	@Override
	public MemberDTO memberview(String userid) {
		// TODO Auto-generated method stub
		return memberdao.memberview(userid);
	}

	@Override
	public void memberdelete(String userid) {
		// TODO Auto-generated method stub
		memberdao.memberdelete(userid);
	}

	@Override
	public MemberDTO myinfo(String userid) {
		// TODO Auto-generated method stub
		return memberdao.myinfo(userid);
	}

	@Override
	public void membermodify(MemberDTO memberdto) {
		// TODO Auto-generated method stub
		memberdao.membermodify(memberdto);
	}
	

}
