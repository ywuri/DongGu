package com.DongGu.member;

import java.sql.Date;

public class memberDTO {
	
	/* --- 사용자 유형 --- */
	private int usertype; // 0:고용자 , 1:구직자
	
	public memberDTO(int usertype) {
		super();
		this.usertype = usertype;
	}

	public int getUsertype() {
		return usertype;
	}

	public void setUsertype(int usertype) {
		this.usertype = usertype;
	}


	/* --- 구직자 --- */
	private String p_id;
	private String p_pwd;
	private String p_name;
	private int p_gender;
	private int p_smoke;
	private String p_nickname;
	private String p_img;
	private String p_tel;
	private String p_addr;
	private String p_jumin;
	private String p_ex_my;
	private String p_ex_other;
	private String p_ex_etc;
	private java.sql.Date p_date;
	private int g_num;
	private int q_num;
	private String p_answer;
	private String p_bank_name;
	private String p_bank_num;
	
	
	public memberDTO() {
		System.out.println("memberDTO 생성자 호출됨!");
	}
	
	
	public memberDTO(int usertype, String p_id, String p_pwd, String p_name, int p_gender, int p_smoke,
			String p_nickname, String p_img, String p_tel, String p_addr, String p_jumin, String p_ex_my,
			String p_ex_other, String p_ex_etc, Date p_date, int g_num, int q_num, String p_answer, String p_bank_name, String p_bank_num) {
		super();
		this.usertype = usertype;
		this.p_id = p_id;
		this.p_pwd = p_pwd;
		this.p_name = p_name;
		this.p_gender = p_gender;
		this.p_smoke = p_smoke;
		this.p_nickname = p_nickname;
		this.p_img = p_img;
		this.p_tel = p_tel;
		this.p_addr = p_addr;
		this.p_jumin = p_jumin;
		this.p_ex_my = p_ex_my;
		this.p_ex_other = p_ex_other;
		this.p_ex_etc = p_ex_etc;
		this.p_date = p_date;
		this.g_num = g_num;
		this.q_num = q_num;
		this.p_answer = p_answer;
		this.p_bank_name = p_bank_name;
		this.p_bank_num = p_bank_num;
	}

	public String getP_id() {
		return p_id;
	}

	public void setP_id(String p_id) {
		this.p_id = p_id;
	}

	public String getP_pwd() {
		return p_pwd;
	}

	public void setP_pwd(String p_pwd) {
		this.p_pwd = p_pwd;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public int getP_gender() {
		return p_gender;
	}

	public void setP_gender(int p_gender) {
		this.p_gender = p_gender;
	}

	public int getP_smoke() {
		return p_smoke;
	}

	public void setP_smoke(int p_smoke) {
		this.p_smoke = p_smoke;
	}

	public String getP_nickname() {
		return p_nickname;
	}

	public void setP_nickname(String p_nickname) {
		this.p_nickname = p_nickname;
	}

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}

	public String getP_tel() {
		return p_tel;
	}

	public void setP_tel(String p_tel) {
		this.p_tel = p_tel;
	}

	public String getP_jumin() {
		return p_jumin;
	}
	
	public String getP_addr() {
		return p_addr;
	}

	public void setP_addr(String p_addr) {
		this.p_addr = p_addr;
	}

	public void setP_jumin(String p_jumin) {
		this.p_jumin = p_jumin;
	}

	public String getP_ex_my() {
		return p_ex_my;
	}

	public void setP_ex_my(String p_ex_my) {
		this.p_ex_my = p_ex_my;
	}

	public String getP_ex_other() {
		return p_ex_other;
	}

	public void setP_ex_other(String p_ex_other) {
		this.p_ex_other = p_ex_other;
	}

	public String getP_ex_etc() {
		return p_ex_etc;
	}

	public void setP_ex_etc(String p_ex_etc) {
		this.p_ex_etc = p_ex_etc;
	}

	public java.sql.Date getP_date() {
        return p_date;
    }

    public void setP_date(java.sql.Date p_date) {
        this.p_date = p_date;
    }

	public int getG_num() {
		return g_num;
	}

	public void setG_num(int g_num) {
		this.g_num = g_num;
	}

	public int getQ_num() {
		return q_num;
	}

	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}

	public String getP_answer() {
		return p_answer;
	}

	public void setP_answer(String p_answer) {
		this.p_answer = p_answer;
	}

	public String getP_bank_name() {
		return p_bank_name;
	}

	public void setP_bank_name(String p_bank_name) {
		this.p_bank_name = p_bank_name;
	}

	public String getP_bank_num() {
		return p_bank_num;
	}

	public void setP_bank_num(String p_bank_num) {
		this.p_bank_num = p_bank_num;
	}
	
}
