package com.DongGu.cafe;

public class CafeDTO {

	private int c_num;	//동구의추천번호
	private String c_name;	//카페이름
	private String c_img; //카페이미지
	private String c_addr; //카페주소
	private String c_time; //카페영업시간

	private String c_url; //인터넷주소
	private String c_info;	//상세내용
	
	private String c_vtag;	//상세태그
	private String c_ltag; 	//리스트태그
	
	
	public CafeDTO() {}
	
	public CafeDTO(int c_num, String c_name, String c_img, String c_addr, String c_time, String c_url, String c_info, String c_vtag, String c_ltag) {

		super();
		this.c_num = c_num;
		this.c_name = c_name;
		this.c_img = c_img;
		this.c_addr = c_addr;
		this.c_time = c_time;
		this.c_url = c_url;
		this.c_info = c_info;
		this.c_vtag = c_vtag;
		this.c_ltag = c_ltag;
	}


	public int getC_num() {
		return c_num;
	}


	public void setC_num(int c_num) {
		this.c_num = c_num;
	}


	public String getC_name() {
		return c_name;
	}


	public void setC_name(String c_name) {
		this.c_name = c_name;
	}


	public String getC_img() {
		return c_img;
	}


	public void setC_img(String c_img) {
		this.c_img = c_img;
	}


	public String getC_addr() {
		return c_addr;
	}


	public void setC_addr(String c_addr) {
		this.c_addr = c_addr;
	}


	public String getC_time() {
		return c_time;
	}


	public void setC_time(String c_time) {
		this.c_time = c_time;
	}


	public String getC_url() {
		return c_url;
	}


	public void setC_url(String c_url) {
		this.c_url = c_url;
	}


	public String getC_info() {
		return c_info;
	}


	public void setC_info(String c_info) {
		this.c_info = c_info;
	}


	public String getC_vtag() {
		return c_vtag;
	}


	public void setC_vtag(String c_vtag) {
		this.c_vtag = c_vtag;
	}


	public String getC_ltag() {
		return c_ltag;
	}


	public void setC_ltag(String c_ltag) {
		this.c_ltag = c_ltag;
	}
	
	

}
