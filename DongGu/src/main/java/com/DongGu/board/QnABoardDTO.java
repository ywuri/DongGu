package com.DongGu.board;
import java.sql.Date;

public class QnABoardDTO {
	private int q_num; /* 글번호 */
	private String q_id; /* 아이디 */
	private String q_nickname; /* 닉네임 */
	private String q_title; /* 제목 */
	private Date q_date; /* 작성날짜 */
	private String q_content; /* 내용 */
	private int q_vcnt;/* 조회수 */
	private int q_ref ;/* 그룹번호(1번의 글의 답글인지 2번글의 답글인지. 누구 소속인지) */
	private int q_lev; /* 들여쓰기횟수 (0이면 본문,1번이면 본문의 대한 답변) */
	private int q_sunbun; /* 본문내에 순서. (1번본문의 답글이 2개 달리면 걔의 순서) */

	
	public QnABoardDTO() {}
	
	
	
	public QnABoardDTO(int q_num, String q_title) {
		super();
		this.q_num = q_num;
		this.q_title = q_title;
	}



	// insert 용 생성자
	public QnABoardDTO(String q_id, String q_nickname, String q_title, String q_content) {
		super();
		this.q_id = q_id;
		this.q_nickname = q_nickname;
		this.q_title = q_title;
		this.q_content = q_content;
	}



	public QnABoardDTO(int q_num, String q_id, String q_nickname, String q_title, Date q_date, String q_content,
			int q_vcnt, int q_ref, int q_lev, int q_sunbun) {
		super();
		this.q_num = q_num;
		this.q_id = q_id;
		this.q_nickname = q_nickname;
		this.q_title = q_title;
		this.q_date = q_date;
		this.q_content = q_content;
		this.q_vcnt = q_vcnt;
		this.q_ref = q_ref;
		this.q_lev = q_lev;
		this.q_sunbun = q_sunbun;
	}
	
	
	public int getQ_num() {
		return q_num;
	}
	public void setQ_num(int q_num) {
		this.q_num = q_num;
	}
	public String getQ_id() {
		return q_id;
	}
	public void setQ_id(String q_id) {
		this.q_id = q_id;
	}
	public String getQ_nickname() {
		return q_nickname;
	}
	public void setQ_nickname(String q_nickname) {
		this.q_nickname = q_nickname;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public Date getQ_date() {
		return q_date;
	}
	public void setQ_date(Date q_date) {
		this.q_date = q_date;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public int getQ_vcnt() {
		return q_vcnt;
	}
	public void setQ_vcnt(int q_vcnt) {
		this.q_vcnt = q_vcnt;
	}
	public int getQ_ref() {
		return q_ref;
	}
	public void setQ_ref(int q_ref) {
		this.q_ref = q_ref;
	}
	public int getQ_lev() {
		return q_lev;
	}
	public void setQ_lev(int q_lev) {
		this.q_lev = q_lev;
	}
	public int getQ_sunbun() {
		return q_sunbun;
	}
	public void setQ_sunbun(int q_sunbun) {
		this.q_sunbun = q_sunbun;
	}
	
	
}
