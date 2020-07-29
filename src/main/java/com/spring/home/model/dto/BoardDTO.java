package com.spring.home.model.dto;

import java.util.Date;

public class BoardDTO {
	private String userid;
	private String title;
	private String content;
	private Date post_date;
	private int idx;
	private int rn;
	
	
	public BoardDTO() {
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		System.out.println("title호출");
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		System.out.println("내용호출");
		this.content = content;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		System.out.println("pd호출");
		this.post_date = post_date;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		System.out.println("idx호출");
		this.idx = idx;
	}
	
}
