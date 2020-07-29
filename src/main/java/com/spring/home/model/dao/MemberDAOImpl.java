package com.spring.home.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.home.model.dto.MemberDTO;

@Repository // 현재 클래스를 스프링에서 관리하는 DAO Bean으로 설정한다는 의미
public class MemberDAOImpl implements MemberDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public void insertMember(MemberDTO memberdto) {
		sqlsession.insert("member.insertMember", memberdto);
		
	}

	@Override
	public boolean memberlogin(String userid, String userpw) {
		boolean result = false;
		
		//mapper에 2개 이상의 자료를 전달할 때 : map, dto 사용
		Map<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpw", userpw);
		int count = sqlsession.selectOne("member.memberlogin", map);
		
		// 아이디와 비밀번호가 맞으면 1=>true, 틀리면 0=>false를 리턴
		if(count==1) result = true;
		else result = false;
		
		return result;
	}

	@Override
	public List<MemberDTO> memberlist() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("member.memberlist");
	}

	@Override
	public MemberDTO memberview(String userid) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("member.memberview", userid);
	}

	@Override
	public void memberdelete(String userid) {
		// TODO Auto-generated method stub
		sqlsession.delete("member.memberdelete", userid);
	}

	@Override
	public MemberDTO myinfo(String userid) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("member.myinfo", userid);
	}

	@Override
	public void membermodify(MemberDTO memberdto) {
		// TODO Auto-generated method stub
		sqlsession.update("member.membermodify", memberdto);
	}
	
	

}
