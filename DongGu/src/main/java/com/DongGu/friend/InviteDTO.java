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
	private String o_id; /* 작성자 아이디*/
	

	
	
	// 초대장 디테일(제목,고용자닉네임,시작날짜,끝날짜,동물종류,동물품종,동물이름,
	//			동물나이(계산),성격,알레르기,병력사항,주의사항,추가입력사항,주소,지원자수,동물사진)
	private String a_num; /* 동물 종류 */
	private String at_name; /* 동물 품종*/
	private String ai_name; /*동물 이름*/
	private String age; /*동물 나이*/
	private String nature; /*성격*/
	private String ai_alergy; /*알레르기*/
	private String ai_disease; /*병력사항*/
	private String ai_caution; /*주의사항*/
	private String o_addr; /* 주소*/
	private String ai_img; /* 동물사진*/
	
	
	

	public InviteDTO() {}
	
	//초대장 리스트(초대장번호,동구냥구,제목,작성자,지원자수,작성날짜)
	//i_num,dongNang, i_title,o_nickname,doCnt,i_date
	public InviteDTO(int i_num, String i_title, String i_date, String dongNang, int doCnt, String o_nickname,String o_id) {
		super();
		this.i_num = i_num;
		this.i_title = i_title;
		this.i_date = i_date;
		this.dongNang = dongNang;
		this.doCnt = doCnt;
		this.o_nickname = o_nickname;
		this.o_id = o_id;
	}
	
	
	
	// 초대장 디테일(제목,고용자닉네임,시작날짜,끝날짜,동물종류,동물품종,동물이름,
	//			동물나이(계산),성격,알레르기,병력사항,주의사항,추가입력사항,주소,지원자수,동물사진)	
	

	public InviteDTO(int i_num, String i_title, String i_content, Date i_start, Date i_end, int doCnt,
			String o_nickname, String a_num, String at_name, String ai_name, String age, String nature, String ai_alergy,
			String ai_disease, String ai_caution, String o_addr,String ai_img,String o_id) {
		super();
		this.i_num = i_num;
		this.i_title = i_title;
		this.i_content = i_content;
		this.i_start = i_start;
		this.i_end = i_end;
		this.doCnt = doCnt;
		this.o_nickname = o_nickname;
		this.a_num = a_num;
		this.at_name = at_name;
		this.ai_name = ai_name;
		this.age = age;
		this.nature = nature;
		this.ai_alergy = ai_alergy;
		this.ai_disease = ai_disease;
		this.ai_caution = ai_caution;
		this.o_addr = o_addr;
		this.ai_img=ai_img;
		this.o_id=o_id;
	}
	
	
	
	

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

	public String getO_id() {
		return o_id;
	}

	public void setO_id(String o_id) {
		this.o_id = o_id;
	}

	public String getA_num() {
		return a_num;
	}

	public void setA_num(String a_num) {
		this.a_num = a_num;
	}

	public String getAt_name() {
		return at_name;
	}

	public void setAt_name(String at_name) {
		this.at_name = at_name;
	}

	public String getAi_name() {
		return ai_name;
	}

	public void setAi_name(String ai_name) {
		this.ai_name = ai_name;
	}

	

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getNature() {
		return nature;
	}

	public void setNature(String nature) {
		this.nature = nature;
	}

	public String getAi_alergy() {
		return ai_alergy;
	}

	public void setAi_alergy(String ai_alergy) {
		this.ai_alergy = ai_alergy;
	}

	public String getAi_disease() {
		return ai_disease;
	}

	public void setAi_disease(String ai_disease) {
		this.ai_disease = ai_disease;
	}

	public String getAi_caution() {
		return ai_caution;
	}

	public void setAi_caution(String ai_caution) {
		this.ai_caution = ai_caution;
	}

	public String getO_addr() {
		return o_addr;
	}

	public void setO_addr(String o_addr) {
		this.o_addr = o_addr;
	}

	public String getAi_img() {
		return ai_img;
	}

	public void setAi_img(String ai_img) {
		this.ai_img = ai_img;
	}

	
	
	
	
}
