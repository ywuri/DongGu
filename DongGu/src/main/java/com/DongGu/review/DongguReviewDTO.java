package com.DongGu.review;

import java.sql.Date;

public class DongguReviewDTO {
	private int r_num;
    private String r_write_id;
    private String r_receive_id;
    private int r_id_check;
    private int r_star;
    private String r_content;
    private String r_img;
    private Date r_date;
    private String p_nickname;
    private String g_name;
    private String ai_name;
    private int ai_birth;
    private int review_count;
    private double avg_star;
    private String p_img;
    
    public DongguReviewDTO() {
    	System.out.println("DongguReviewDTO 객체 생성됨!");
    }

    public DongguReviewDTO(int r_num, String r_write_id, String r_receive_id, int r_id_check, int r_star, String r_content, String r_img, Date r_date, String p_nickname, String g_name, String ai_name, int ai_birth, int review_count, double avg_star, String p_img) {
        this.r_num = r_num;
        this.r_write_id = r_write_id;
        this.r_receive_id = r_receive_id;
        this.r_id_check = r_id_check;
        this.r_star = r_star;
        this.r_content = r_content;
        this.r_img = r_img;
        this.r_date = r_date;
        this.p_nickname = p_nickname;
        this.g_name = g_name;  
        this.ai_name = ai_name;
        this.ai_birth = ai_birth;
        this.review_count = review_count;
        this.avg_star = avg_star;
        this.p_img = p_img;
        
    }

	public int getR_num() {
		return r_num;
	}

	public void setR_num(int r_num) {
		this.r_num = r_num;
	}

	public String getR_write_id() {
		return r_write_id;
	}

	public void setR_write_id(String r_write_id) {
		this.r_write_id = r_write_id;
	}

	public String getR_receive_id() {
		return r_receive_id;
	}

	public void setR_receive_id(String r_receive_id) {
		this.r_receive_id = r_receive_id;
	}

	public int getR_id_check() {
		return r_id_check;
	}

	public void setR_id_check(int r_id_check) {
		this.r_id_check = r_id_check;
	}

	public int getR_star() {
		return r_star;
	}

	public void setR_star(int r_star) {
		this.r_star = r_star;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public String getR_img() {
		return r_img;
	}

	public void setR_img(String r_img) {
		this.r_img = r_img;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public String getP_nickname() {
		return p_nickname;
	}

	public void setP_nickname(String p_nickname) {
		this.p_nickname = p_nickname;
	}

	public String getG_name() {
		return g_name;
	}

	public void setG_name(String g_name) {
		this.g_name = g_name;
	}

	public String getAi_name() {
		return ai_name;
	}

	public void setAi_name(String ai_name) {
		this.ai_name = ai_name;
	}

	public int getAi_birth() {
		return ai_birth;
	}

	public void setAi_birth(int ai_birth) {
		this.ai_birth = ai_birth;
	}

	public int getReview_count() {
		return review_count;
	}

	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}

	public double getAvg_star() {
		return avg_star;
	}

	public void setAvg_star(double avg_star) {
		this.avg_star = avg_star;
	}

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}



}
