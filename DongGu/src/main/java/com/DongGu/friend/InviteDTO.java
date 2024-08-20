package com.DongGu.friend;
import java.sql.Date;

public class InviteDTO {
	private int	i_num; /* 초대장번호 */
	private int	ai_num; /* 동물번호 */
	private int	m_num; /* 매칭상태번호 */
	private String i_title; /* 제목 */
	private String i_content; /* 추가내용 */
	private Date i_start; /* 시작 날짜 */
	private Date i_end;  /* 끝날짜 */
	private String i_date; /* 작성날짜 */ 
	
	//초대장리스트(동구냥구,제목,작성자,지원자수,작성날짜)
	private String dongNang; /* 동구냥구  */
	private int doCnt; /* 지원자수 */
	private String o_nickname; /* 작성자 닉네임*/
	
	
	// 초대장 디테일(제목,고용자닉네임,시작날짜,끝날짜,동물종류,동물품종,동물이름,
	//			동물나이(계산),성격,알레르기,병력사항,주의사항,추가입력사항,주소,지원자수)

	
	public InviteDTO() {}
	
	//초대장 리스트(초대장번호,동구냥구,제목,작성자,지원자수,작성날짜)
	//i_num,dongNang, i_title,o_nickname,doCnt,i_date
	public InviteDTO(int i_num, String i_title, String i_date, String dongNang, int doCnt, String o_nickname) {
		super();
		this.i_num = i_num;
		this.i_title = i_title;
		this.i_date = i_date;
		this.dongNang = dongNang;
		this.doCnt = doCnt;
		this.o_nickname = o_nickname;
	}
	
	
	
	
	
	//초대장 디테일
	
	
	

	public int getI_num() {
		return i_num;
	}

	public void setI_num(int i_num) {
		this.i_num = i_num;
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

	public String getI_title() {
		return i_title;
	}

	public void setI_title(String i_title) {
		this.i_title = i_title;
	}

	public String getI_content() {
		return i_content;
	}

	public void setI_content(String i_content) {
		this.i_content = i_content;
	}

	public Date getI_start() {
		return i_start;
	}

	public void setI_start(Date i_start) {
		this.i_start = i_start;
	}

	public Date getI_end() {
		return i_end;
	}

	public void setI_end(Date i_end) {
		this.i_end = i_end;
	}

	public String getI_date() {
		return i_date;
	}

	public void setI_date(String i_date) {
		this.i_date = i_date;
	}

	public String getDongNang() {
		return dongNang;
	}

	public void setDongNang(String dongNang) {
		this.dongNang = dongNang;
	}

	public int getDoCnt() {
		return doCnt;
	}

	public void setDoCnt(int doCnt) {
		this.doCnt = doCnt;
	}

	public String getO_nickname() {
		return o_nickname;
	}

	public void setO_nickname(String o_nickname) {
		this.o_nickname = o_nickname;
	}

	
	

	
	
	

	
	
	
	
	
	
	
}
