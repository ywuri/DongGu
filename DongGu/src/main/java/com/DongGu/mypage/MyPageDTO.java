package com.DongGu.mypage;

import java.sql.Date;

public class MyPageDTO {

   // 멤버변수 
   // 위시리스트
   private int w_num;
   private String w_id;
   private int w_id_check;
   
   // 등급 
   private int g_num;
   private String g_name;
   private int g_price;
   private String g_img;
   
   // 구직자
   private String p_id;
   private String p_name;
   private String p_nickname;
   
   // 고용자
   private String o_id;
   private String o_name;
   private String o_nickname;
   
   // 동물 종류
   private int a_num;
   private String a_name;
   
   // 동물 품종
   private int at_num;
   private String at_name;
   
   // 동물 정보 
   private int ai_num;
   private String ai_img;
   
   // 동물 성격 
   private int an_num;
   private String an_word;
   
   // 매칭 상태 
   private int m_num;
   private String m_name;
   
   // 초대장
   private int i_num;
   private String i_title;
   private Date i_start;
   private Date i_end;
   
   // 지원자 등록폼
   private int ap_num;
   
   // 후기
   private int r_num;
   private String r_write_id;
   private String r_receive_id;
   private int r_type;
   private int r_star;
   
   // 알리아스 
   private double applycount;
   private double likecount;
   private double starcount;
   
   
   // 0. 기본 생성자 
   public MyPageDTO() {
      
   }
   
   // 1-1. 인자 생성자(마이페이지 메인 section 1)
   public MyPageDTO (String g_img,String g_name,double applycount,double likecount,double starcount) {
      super();
      this.g_img = g_img;
      this.g_name = g_name;
      this.applycount = applycount;
      this.likecount = likecount;   
      this.starcount = starcount;   
   }
   
   
   
   
   
   // getter, setter
   public int getW_num() {
      return w_num;
   }

   public void setW_num(int w_num) {
      this.w_num = w_num;
   }

   public String getW_id() {
      return w_id;
   }

   public void setW_id(String w_id) {
      this.w_id = w_id;
   }

   public int getW_id_check() {
      return w_id_check;
   }

   public void setW_id_check(int w_id_check) {
      this.w_id_check = w_id_check;
   }

   public int getG_num() {
      return g_num;
   }

   public void setG_num(int g_num) {
      this.g_num = g_num;
   }

   public String getG_name() {
      return g_name;
   }

   public void setG_name(String g_name) {
      this.g_name = g_name;
   }

   public int getG_price() {
      return g_price;
   }

   public void setG_price(int g_price) {
      this.g_price = g_price;
   }

   public String getG_img() {
      return g_img;
   }

   public void setG_img(String g_img) {
      this.g_img = g_img;
   }

   public String getP_id() {
      return p_id;
   }

   public void setP_id(String p_id) {
      this.p_id = p_id;
   }

   public String getP_name() {
      return p_name;
   }

   public void setP_name(String p_name) {
      this.p_name = p_name;
   }

   public String getP_nickname() {
      return p_nickname;
   }

   public void setP_nickname(String p_nickname) {
      this.p_nickname = p_nickname;
   }

   public String getO_id() {
      return o_id;
   }

   public void setO_id(String o_id) {
      this.o_id = o_id;
   }

   public String getO_name() {
      return o_name;
   }

   public void setO_name(String o_name) {
      this.o_name = o_name;
   }

   public String getO_nickname() {
      return o_nickname;
   }

   public void setO_nickname(String o_nickname) {
      this.o_nickname = o_nickname;
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

   public int getAt_num() {
      return at_num;
   }

   public void setAt_num(int at_num) {
      this.at_num = at_num;
   }

   public String getAt_name() {
      return at_name;
   }

   public void setAt_name(String at_name) {
      this.at_name = at_name;
   }

   public int getAi_num() {
      return ai_num;
   }

   public void setAi_num(int ai_num) {
      this.ai_num = ai_num;
   }

   public String getAi_img() {
      return ai_img;
   }

   public void setAi_img(String ai_img) {
      this.ai_img = ai_img;
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

   public int getM_num() {
      return m_num;
   }

   public void setM_num(int m_num) {
      this.m_num = m_num;
   }

   public String getM_name() {
      return m_name;
   }

   public void setM_name(String m_name) {
      this.m_name = m_name;
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

   public int getAp_num() {
      return ap_num;
   }

   public void setAp_num(int ap_num) {
      this.ap_num = ap_num;
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

   public int getR_type() {
      return r_type;
   }

   public void setR_type(int r_type) {
      this.r_type = r_type;
   }

   public int getR_star() {
      return r_star;
   }

   public void setR_star(int r_star) {
      this.r_star = r_star;
   }

   public double getApplycount() {
      return applycount;
   }

   public void setApplycount(int applycount) {
      this.applycount = applycount;
   }

   public double getLikecount() {
      return likecount;
   }

   public void setLikecount(int likecount) {
      this.likecount = likecount;
   }

   public double getStarcount() {
      return starcount;
   }

   public void setStarcount(double starcount) {
      this.starcount = starcount;
   }
   
   
   
}
 