package com.spring.home.service;


import java.util.List;

import com.spring.home.model.dto.MemberDTO;

public interface MemberService {

	public void insertMember(MemberDTO memberdto);
	public boolean memberlogin(String userid, String userpw);
	public List<MemberDTO> memberlist();
	public MemberDTO memberview(String userid);
	public void memberdelete(String userid);
	public MemberDTO myinfo(String userid);
	public void membermodify(MemberDTO memberdto);

}
