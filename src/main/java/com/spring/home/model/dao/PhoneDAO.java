package com.spring.home.model.dao;

import java.util.List;

import com.spring.home.model.dto.PhoneDTO;
import com.spring.home.utils.PagingVO;


public interface PhoneDAO {

	public List<PhoneDTO> phonelist();
	public void phonewrite(PhoneDTO boarddto);
	public void phonedelete(int idx);
	public PhoneDTO phonedetail(int idx);
	public void phoneupdate(PhoneDTO boarddto);

	// 게시물 총 갯수
	public int countPhone();

	// 페이징 처리 게시글 조회
	public List<PhoneDTO> selectPhone(PagingVO vo );
}
