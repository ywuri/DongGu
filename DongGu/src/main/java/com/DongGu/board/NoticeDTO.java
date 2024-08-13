package com.DongGu.board;

import java.sql.Date;

public class NoticeDTO {
	private int n_num; /* 글번호 */
	private String n_id; /* 아이디 */
	private String n_nickname; /* 닉네임 */
	private String n_title; /* 제목 */
	private Date n_date; /* 작성날짜 */
	private String n_content; /* 내용 */
	private int n_vcnt;/* 조회수 */
	private int n_ref ;/* 그룹번호(1번의 글의 답글인지 2번글의 답글인지. 누구 소속인지) */
	private int n_lev; /* 들여쓰기횟수 (0이면 본문,1번이면 본문의 대한 답변) */
	private int n_sunbun; /* 본문내에 순서. (1번본문의 답글이 2개 달리면 걔의 순서) */

	
	public NoticeDTO() {}
	
	
	
	public NoticeDTO(int n_num, String n_title) {
		super();
		this.n_num = n_num;
		this.n_title = n_title;
	}



	// insert 용 생성자
	public NoticeDTO(String n_id, String n_nickname, String n_title, String n_content) {
		super();
		this.n_id = n_id;
		this.n_nickname = n_nickname;
		this.n_title = n_title;
		this.n_content = n_content;
	}



	public NoticeDTO(int n_num, String n_id, String n_nickname, String n_title, Date n_date, String n_content,
			int n_vcnt, int n_ref, int n_lev, int n_sunbun) {
		super();
		this.n_num = n_num;
		this.n_id = n_id;
		this.n_nickname = n_nickname;
		this.n_title = n_title;
		this.n_date = n_date;
		this.n_content = n_content;
		this.n_vcnt = n_vcnt;
		this.n_ref = n_ref;
		this.n_lev = n_lev;
		this.n_sunbun = n_sunbun;
	}



	public int getN_num() {
		return n_num;
	}



	public void setN_num(int n_num) {
		this.n_num = n_num;
	}



	public String getN_id() {
		return n_id;
	}



	public void setN_id(String n_id) {
		this.n_id = n_id;
	}



	public String getN_nickname() {
		return n_nickname;
	}



	public void setN_nickname(String n_nickname) {
		this.n_nickname = n_nickname;
	}



	public String getN_title() {
		return n_title;
	}



	public void setN_title(String n_title) {
		this.n_title = n_title;
	}



	public Date getN_date() {
		return n_date;
	}



	public void setN_date(Date n_date) {
		this.n_date = n_date;
	}



	public String getN_content() {
		return n_content;
	}



	public void setN_content(String n_content) {
		this.n_content = n_content;
	}



	public int getN_vcnt() {
		return n_vcnt;
	}



	public void setN_vcnt(int n_vcnt) {
		this.n_vcnt = n_vcnt;
	}



	public int getN_ref() {
		return n_ref;
	}



	public void setN_ref(int n_ref) {
		this.n_ref = n_ref;
	}



	public int getN_lev() {
		return n_lev;
	}



	public void setN_lev(int n_lev) {
		this.n_lev = n_lev;
	}



	public int getN_sunbun() {
		return n_sunbun;
	}



	public void setN_sunbun(int n_sunbun) {
		this.n_sunbun = n_sunbun;
	}



	
	
	
	
}
