package com.DongGu.animal;

import java.sql.Date;

public class animalDTO {
	
	/* --- 동물정보 --- */
	private int ai_num;
	private int at_num;
	private String ai_name;
	private int ai_gender;
	private String ai_img;
	private String ai_birth;
	private String an_num_link;
	private String ai_alergy;
	private String ai_disease;
	private String ai_caution;
	
	/* --- 동물 종류 --- */
	private int a_num;
	private String a_name;

	/* --- 동물 성격 --- */
	private int an_num;
	private String an_word;

	/* --- 동물 품종 --- */
    private String at_name;
    
    /* --- 오너 아이디 --- */
    private String o_id;
    
    public animalDTO() {
		System.out.println("animalDTO 생성자 호출됨!");
	}

	public animalDTO(int ai_num, int at_num, String ai_name, int ai_gender, String ai_img, String ai_birth,
			String an_num_link, String ai_alergy, String ai_disease, String ai_caution, int a_num, String a_name,
			int an_num, String an_word, String at_name) {
		super();
		this.ai_num = ai_num;
		this.at_num = at_num;
		this.ai_name = ai_name;
		this.ai_gender = ai_gender;
		this.ai_img = ai_img;
		this.ai_birth = ai_birth;
		this.an_num_link = an_num_link;
		this.ai_alergy = ai_alergy;
		this.ai_disease = ai_disease;
		this.ai_caution = ai_caution;
		this.a_num = a_num;
		this.a_name = a_name;
		this.an_num = an_num;
		this.an_word = an_word;
		this.at_name = at_name;
	}
	

	public int getAi_num() {
		return ai_num;
	}

	public void setAi_num(int ai_num) {
		this.ai_num = ai_num;
	}

	public int getAt_num() {
		return at_num;
	}

	public void setAt_num(int at_num) {
		this.at_num = at_num;
	}

	public String getAi_name() {
		return ai_name;
	}

	public void setAi_name(String ai_name) {
		this.ai_name = ai_name;
	}

	public int getAi_gender() {
		return ai_gender;
	}

	public void setAi_gender(int ai_gender) {
		this.ai_gender = ai_gender;
	}

	public String getAi_img() {
		return ai_img;
	}

	public void setAi_img(String ai_img) {
		this.ai_img = ai_img;
	}

	public String getAi_birth() {
		return ai_birth;
	}

	public void setAi_birth(String ai_birth) {
		this.ai_birth = ai_birth;
	}

	public String getAn_num_link() {
		return an_num_link;
	}

	public void setAn_num_link(String an_num_link) {
		this.an_num_link = an_num_link;
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

	public int getA_num() {
		return a_num;
	}

	public void setA_num(int a_num) {
		this.a_num = a_num;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}

	public int getAn_num() {
		return an_num;
	}

	public void setAn_num(int an_num) {
		this.an_num = an_num;
	}

	public String getAn_word() {
		return an_word;
	}

	public void setAn_word(String an_word) {
		this.an_word = an_word;
	}

	public String getAt_name() {
		return at_name;
	}

	public void setAt_name(String at_name) {
		this.at_name = at_name;
	}

	public String getO_id() {
		return o_id;
	}

	public void setO_id(String o_id) {
		this.o_id = o_id;
	}
    

	
    
}
