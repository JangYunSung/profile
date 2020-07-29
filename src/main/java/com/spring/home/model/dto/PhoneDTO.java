package com.spring.home.model.dto;



public class PhoneDTO {
	private int idx;
	private String userid;
	private String phonenum;
	private String name;
	private String email;
	private String memo;
	private int rn;
	
	
	public String getPhonenum() {
		return phonenum;
	}
	public void setPhonenum(String phonenum) {
		System.out.println("phoneNum호출");
		this.phonenum = phonenum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		System.out.println("Name호출");
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		System.out.println("email호출");
		this.email = email;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		System.out.println("memo호출");
		this.memo = memo;
	}
	public PhoneDTO() {
		System.out.println("dto생성자 ");
		
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn) {
		System.out.println("rn호출");
		this.rn = rn;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		System.out.println("userid호출");
		this.userid = userid;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		System.out.println("idx호출");
		this.idx = idx;
	}
	
}
