package com.DongGu.friend;


public class FriendDTO {

	private int i_id;	//초대장번호
	private String i_title;	//추가내용
	private int ai_num; //동물번호 
	private int m_num; 	//매칭상태번호
	private String i_content;	//추가내용
	private String i_start;	//시작날짜
	private String i_end; 	//끝날짜

	
	public FriendDTO() {}
	
	public FriendDTO(int i_id, String i_title, int ai_num, int m_num, String i_content, String i_start, String i_end) {
		super();
		this.i_id = i_id;
		this.i_title = i_title;
		this.ai_num = ai_num;
		this.m_num = m_num;
		this.i_content = i_content;
		this.i_start = i_start;
		this.i_end = i_end;
	}

	public int getI_id() {
		return i_id;
	}

	public void setI_id(int i_id) {
		this.i_id = i_id;
	}
	
	public String getI_title() {
		return i_title;
	}
	
	public void setI_title(String i_title) {
		this.i_title = i_title;
	}

	public int getAi_num() {
		return ai_num;
	}

	public void setAi_num(int ai_num) {
		this.ai_num = ai_num;
	}

	public int getM_num() {
		return m_num;
	}

	public void setM_num(int m_num) {
		this.m_num = m_num;
	}

	public String getI_content() {
		return i_content;
	}

	public void setI_content(String i_content) {
		this.i_content = i_content;
	}

	public String getI_start() {
		return i_start;
	}

	public void setI_start(String i_start) {
		this.i_start = i_start;
	}

	public String getI_end() {
		return i_end;
	}

	public void setI_end(String i_end) {
		this.i_end = i_end;
	}
}
