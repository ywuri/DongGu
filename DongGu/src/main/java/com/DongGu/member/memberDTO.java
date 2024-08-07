package com.DongGu.member;

import java.sql.Date;

public class memberDTO {
	
	/* 구직자 */
	private String p_id;
	private String p_pwd;
	private String name;
	private int p_gender;
	private int p_smoke;
	private String p_nickname;
	private String p_img;
	private String p_tel;
	private String p_jumin;
	private String p_ex_my;
	private String p_ex_other;
	private String p_ex_etc;
	private Date p_date;
	private int l_numl;
	private int q_num;
	private String q_answer;
	
	public memberDTO() {
		System.out.println("memberDTO 생성자 호출됨!");
	}

	public memberDTO(String p_id, String p_pwd, String name, int p_gender, int p_smoke, String p_nickname, String p_img,
			String p_tel, String p_jumin, String p_ex_my, String p_ex_other, String p_ex_etc, Date p_date, int l_numl,
			int q_num, String q_answer) {
		super();
		this.p_id = p_id;
		this.p_pwd = p_pwd;
		this.name = name;
		this.p_gender = p_gender;
		this.p_smoke = p_smoke;
		this.p_nickname = p_nickname;
		this.p_img = p_img;
		this.p_tel = p_tel;
		this.p_jumin = p_jumin;
		this.p_ex_my = p_ex_my;
		this.p_ex_other = p_ex_other;
		this.p_ex_etc = p_ex_etc;
		this.p_date = p_date;
		this.l_numl = l_numl;
		this.q_num = q_num;
		this.q_answer = q_answer;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Date getP_date() {
		return p_date;
	}

	public void setP_date(Date p_date) {
		this.p_date = p_date;
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
	
	/* 고용자 */
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

	public memberDTO(String o_id, String o_pwd, String o_name, int o_gender, String o_nickname, String o_tel,
			String o_addr, String o_house, String o_jumin, Date o_date) {
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
	
	
	
}
