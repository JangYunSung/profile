package com.spring.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.home.model.dao.PhoneDAO;
import com.spring.home.model.dto.PhoneDTO;
import com.spring.home.utils.PagingVO;

@Service
public class PhoneServiceImpl implements PhoneService {

	@Inject
	PhoneDAO phonedao;
	
	@Override
	public List<PhoneDTO> phonelist() {
		// TODO Auto-generated method stub
		return phonedao.phonelist();
	}

	@Override
	public void phonewrite(PhoneDTO phonedto) {
		// TODO Auto-generated method stub
		phonedao.phonewrite(phonedto);
	}

	@Override
	public void phonedelete(int idx) {
		// TODO Auto-generated method stub
		phonedao.phonedelete(idx);
	}

	@Override
	public PhoneDTO phonedetail(int idx) {
		// TODO Auto-generated method stub
		return phonedao.phonedetail(idx);
	}

	@Override
	public void phoneupdate(PhoneDTO phonedto) {
		// TODO Auto-generated method stub
		phonedao.phoneupdate(phonedto);
	}
	@Override
	public int countPhone() {
		return phonedao.countPhone();
	}

	@Override
	public List<PhoneDTO> selectPhone(PagingVO vo) {
		return phonedao.selectPhone(vo);
	}
	
	
}
