package com.DongGu.board;

public class FreeCommentDTO {
	private int fc_num; /* 글번호 */
	private int f_num; /* 글번호2 */
	private String fc_id; /* 아이디 */
	private String fc_nickname;/* 닉네임 */
	private String fc_content; /* 내용 */
	private String fc_date; /* 작성날짜 */
	private int fc_ref; /* ref */
	private int fc_lev; /* lev */
	private int fc_sunbun; /* sunbun */
	private String fc_img; /* 사진 */
	
	
	public FreeCommentDTO() {
		
	}

	public FreeCommentDTO(int fc_num, int f_num, String fc_id, String fc_nickname, String fc_content, String fc_date,
			int fc_ref, int fc_lev, int fc_sunbun, String fc_img) {
		super();
		this.fc_num = fc_num;
		this.f_num = f_num;
		this.fc_id = fc_id;
		this.fc_nickname = fc_nickname;
		this.fc_content = fc_content;
		this.fc_date = fc_date;
		this.fc_ref = fc_ref;
		this.fc_lev = fc_lev;
		this.fc_sunbun = fc_sunbun;
		this.fc_img = fc_img;
	}

	public int getFc_num() {
		return fc_num;
	}

	public void setFc_num(int fc_num) {
		this.fc_num = fc_num;
	}

	public int getF_num() {
		return f_num;
	}

	public void setF_num(int f_num) {
		this.f_num = f_num;
	}

	public String getFc_id() {
		return fc_id;
	}

	public void setFc_id(String fc_id) {
		this.fc_id = fc_id;
	}

	public String getFc_nickname() {
		return fc_nickname;
	}

	public void setFc_nickname(String fc_nickname) {
		this.fc_nickname = fc_nickname;
	}

	public String getFc_content() {
		return fc_content;
	}

	public void setFc_content(String fc_content) {
		this.fc_content = fc_content;
	}

	public String getFc_date() {
		return fc_date;
	}

	public void setFc_date(String fc_date) {
		this.fc_date = fc_date;
	}

	public int getFc_ref() {
		return fc_ref;
	}

	public void setFc_ref(int fc_ref) {
		this.fc_ref = fc_ref;
	}

	public int getFc_lev() {
		return fc_lev;
	}

	public void setFc_lev(int fc_lev) {
		this.fc_lev = fc_lev;
	}

	public int getFc_sunbun() {
		return fc_sunbun;
	}

	public void setFc_sunbun(int fc_sunbun) {
		this.fc_sunbun = fc_sunbun;
	}

	public String getFc_img() {
		return fc_img;
	}

	public void setFc_img(String fc_img) {
		this.fc_img = fc_img;
	}
	


	
	
}
