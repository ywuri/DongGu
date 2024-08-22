package com.DongGu.member;

import java.sql.Date;

public class ownermemberDTO {
	
	/* --- 사용자 유형 --- */
	private int usertype; // 0:고용자 , 1:구직자
	
	public ownermemberDTO(int usertype) {
		super();
		this.usertype = usertype;
	}

	public int getUsertype() {
		return usertype;
	}

	public void setUsertype(int usertype) {
		this.usertype = usertype;
	}
	
	/* --- 고용자 --- */
	private String o_id;
	private String o_pwd;
	private String o_name;
	private int o_gender;
	private String o_nickname;
	private String o_tel;
	private String o_addr;
	private String o_house;
	private String o_jumin;
	private Date o_date;
	private int l_numl;
	private int q_num;
	private String q_answer;
	
	
	
	public ownermemberDTO() {
		/* System.out.println("ownermemberDTO 생성자 호출됨!"); */
	}

	/* 상세페이지 가기위한 dto*/
	public ownermemberDTO(int usertype, String o_id) {
		super();
		this.usertype = usertype;
		this.o_id = o_id;
	}

	public ownermemberDTO (String o_id, String o_pwd, String o_name, int o_gender, String o_nickname, String o_tel,
			String o_addr, String o_house, String o_jumin, Date o_date,int usertype) {
		super();
		this.o_id = o_id;
		this.o_pwd = o_pwd;
		this.o_name = o_name;
		this.o_gender = o_gender;
		this.o_nickname = o_nickname;
		this.o_tel = o_tel;
		this.o_addr = o_addr;
		this.o_house = o_house;
		this.o_jumin = o_jumin;
		this.o_date = o_date;
		this.l_numl = l_numl;
		this.q_num = q_num;
		this.q_answer = q_answer;
		this.usertype = usertype;
	}

	public String getO_id() {
		return o_id;
	}

	public void setO_id(String o_id) {
		this.o_id = o_id;
	}

	public String getO_pwd() {
		return o_pwd;
	}

	public void setO_pwd(String o_pwd) {
		this.o_pwd = o_pwd;
	}

	public String getO_name() {
		return o_name;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public int getO_gender() {
		return o_gender;
	}

	public void setO_gender(int o_gender) {
		this.o_gender = o_gender;
	}

	public String getO_nickname() {
		return o_nickname;
	}

	public void setO_nickname(String o_nickname) {
		this.o_nickname = o_nickname;
	}

	public String getO_tel() {
		return o_tel;
	}

	public void setO_tel(String o_tel) {
		this.o_tel = o_tel;
	}

	public String getO_addr() {
		return o_addr;
	}

	public void setO_addr(String o_addr) {
		this.o_addr = o_addr;
	}

	public String getO_house() {
		return o_house;
	}

	public void setO_house(String o_house) {
		this.o_house = o_house;
	}

	public String getO_jumin() {
		return o_jumin;
	}

	public void setO_jumin(String o_jumin) {
		this.o_jumin = o_jumin;
	}

	public Date getO_date() {
		return o_date;
	}

	public void setO_date(Date o_date) {
		this.o_date = o_date;
	}

	public int getL_numl() {
		return l_numl;
	}

	public void setL_numl(int l_numl) {
		this.l_numl = l_numl;
	}

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getQ_answer() {
		return q_answer;
	}

	public void setQ_answer(String q_answer) {
		this.q_answer = q_answer;
	}
	
	

}
