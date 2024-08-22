package com.DongGu.animal;

public class animalnatureDTO {
	private int an_num;
	private String an_word;
	
	
	
	public animalnatureDTO() {
		super();
	}
	
	public animalnatureDTO(int an_num, String an_word) {
		super();
		this.an_num = an_num;
		this.an_word = an_word;
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
	
	
	
}
