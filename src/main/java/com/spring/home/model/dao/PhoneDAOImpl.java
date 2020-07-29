package com.spring.home.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.home.model.dto.PhoneDTO;
import com.spring.home.utils.PagingVO;

@Repository
public class PhoneDAOImpl implements PhoneDAO {

	@Inject
	SqlSession sqlsession;
	
	@Override
	public List<PhoneDTO> phonelist() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("phone.phonelist");
	}

	@Override
	public void phonewrite(PhoneDTO phonedto) {
		// TODO Auto-generated method stub
		sqlsession.insert("phone.phonewrite", phonedto);
	}

	@Override
	public void phonedelete(int idx) {
		// TODO Auto-generated method stub
		sqlsession.delete("phone.phonedelete", idx);
	}

	@Override
	public PhoneDTO phonedetail(int idx) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("phone.phonedetail", idx);
	}

	@Override
	public void phoneupdate(PhoneDTO phonedto) {
		// TODO Auto-generated method stub
		sqlsession.update("phone.phoneupdate", phonedto);
	}
	
	
	@Override
	public int countPhone() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("phone.countPhone");
	}
	@Override
	public List<PhoneDTO> selectPhone(PagingVO vo ) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("phone.selectPhone", vo);
	}
	
	

}
