package com.DongGu.member;

public class searchmemberDTO {
	
	/* --- 구직자 --- */
	private String p_name;
	private String p_tel;
	
	/* --- 구직자 --- */
	private String o_name;
	private String o_tel;
	
	public searchmemberDTO() {
		// TODO Auto-generated constructor stub
	}

	public searchmemberDTO(String p_name, String p_tel, String o_name, String o_tel) {
		super();
		this.p_name = p_name;
		this.p_tel = p_tel;
		this.o_name = o_name;
		this.o_tel = o_tel;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_tel() {
		return p_tel;
	}

	public void setP_tel(String p_tel) {
		this.p_tel = p_tel;
	}

	public String getO_name() {
		return o_name;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public String getO_tel() {
		return o_tel;
	}

	public void setO_tel(String o_tel) {
		this.o_tel = o_tel;
	}
	
	
	
}
