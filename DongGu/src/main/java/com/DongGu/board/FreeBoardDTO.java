package com.DongGu.board;

public class FreeBoardDTO {
	private int f_num; /* 글번호 */
	private String f_id; /* 아이디 */
	private String f_nickname; /* 닉네임 */
	private String f_title; /* 제목 */
	private String f_content; /* 내용 */
	private String f_date; /* 작성날짜 */
	private int f_vcnt;/* 조회수 */
	private String f_img; /* 사진 이름 */
	

	
	public FreeBoardDTO() {}
	
	
	
	public FreeBoardDTO(int f_num, String f_title) {
		super();
		this.f_num = f_num;
		this.f_title = f_title;
	}



	// insert 용 생성자
	public FreeBoardDTO(String f_id, String f_nickname, String f_title, String f_content) {
		super();
		this.f_id = f_id;
		this.f_nickname = f_nickname;
		this.f_title = f_title;
		this.f_content = f_content;
	}
	
	public FreeBoardDTO(int f_num, String f_id, String f_nickname, String f_title, String f_date, String f_content,
			int f_vcnt, int f_ref, int f_lev, int f_sunbun) {
		super();
		this.f_num = f_num;
		this.f_id = f_id;
		this.f_nickname = f_nickname;
		this.f_title = f_title;
		this.f_date = f_date;
		this.f_content = f_content;
		this.f_vcnt = f_vcnt;
	}
	
	
	
	
	



	public FreeBoardDTO(int f_num, String f_nickname, String f_date, String f_content, String f_img) {
		super();
		this.f_num = f_num;
		this.f_nickname = f_nickname;
		this.f_date = f_date;
		this.f_content = f_content;
		this.f_img = f_img;
	}



	



	public FreeBoardDTO(int f_num, String f_id, String f_nickname, String f_title, String f_content, String f_date,
			int f_vcnt, String f_img) {
		super();
		this.f_num = f_num;
		this.f_id = f_id;
		this.f_nickname = f_nickname;
		this.f_title = f_title;
		this.f_content = f_content;
		this.f_date = f_date;
		this.f_vcnt = f_vcnt;
		this.f_img = f_img;
	}



	public int getF_num() {
		return f_num;
	}



	public void setF_num(int f_num) {
		this.f_num = f_num;
	}



	public String getF_id() {
		return f_id;
	}



	public void setF_id(String f_id) {
		this.f_id = f_id;
	}



	public String getF_nickname() {
		return f_nickname;
	}



	public void setF_nickname(String f_nickname) {
		this.f_nickname = f_nickname;
	}



	public String getF_title() {
		return f_title;
	}



	public void setF_title(String f_title) {
		this.f_title = f_title;
	}



	public String getF_date() {
		return f_date;
	}



	public void setF_date(String f_date) {
		this.f_date = f_date;
	}



	public String getF_content() {
		return f_content;
	}



	public void setF_content(String f_content) {
		this.f_content = f_content;
	}



	public int getF_vcnt() {
		return f_vcnt;
	}



	public void setF_vcnt(int f_vcnt) {
		this.f_vcnt = f_vcnt;
	}



	public String getF_img() {
		return f_img;
	}



	public void setF_img(String f_img) {
		this.f_img = f_img;
	}



	
}
