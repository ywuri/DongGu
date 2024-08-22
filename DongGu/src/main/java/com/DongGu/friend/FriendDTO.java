package com.DongGu.friend;

import java.sql.Date;

//초대장
public class FriendDTO {

	private int i_num;	//초대장번호
	private String i_title;	//추가내용
	private int ai_num; //동물번호 
	private int m_num; 	//매칭상태번호
	private String i_content;	//추가내용
	
	private String i_start;	//시작날짜
	private String i_end; 	//끝날짜
	private Date i_date; 	//저장일
	
	
	public FriendDTO() {}
	
	public FriendDTO(int i_num, int ai_num, int m_num, String i_title, String i_content, String i_start, String i_end, Date i_date) {
		super();
		this.i_num = i_num;
		this.i_title = i_title;
		this.ai_num = ai_num;
		this.m_num = m_num;
		this.i_content = i_content;
		this.i_start = i_start;
		this.i_end = i_end;
		this.i_date = i_date;
	}

	public int getI_num() {
		return i_num;
	}

	public void setI_num(int i_num) {
		this.i_num = i_num;
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

	public Date getI_date() {
		return i_date;
	}

	public void setI_date(Date i_date) {
		this.i_date = i_date;
	}
	
	
}
