package com.spring.home.model.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class MemberDTO {
	
	private String userid, userpw, useremail, username, usernum1, usernum2;
	private Timestamp join_date;


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public String getUserpw() {
		return userpw;
	}


	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}


	public String getUseremail() {
		return useremail;
	}


	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getUsernum1() {
		return usernum1;
	}


	public void setUsernum1(String usernum1) {
		this.usernum1 = usernum1;
	}


	public String getUsernum2() {
		return usernum2;
	}


	public void setUsernum2(String usernum2) {
		this.usernum2 = usernum2;
	}

	

	public Timestamp getJoin_date() {
		return join_date;
	}


	public void setJoin_date(Timestamp join_date) {
		this.join_date = join_date;
	}


	public MemberDTO() {
		
	}

}
