package com.DongGu.mypage;

import java.sql.Date;
import java.util.ArrayList;

public class MyPageDTO {

   // 멤버변수 
   // 위시리스트
   private int w_num;
   private String w_id;
   private int w_id_check;
   private String wt_num_value;
   
   // 등급 
   private int g_num;
   private String g_name;
   private int g_price;
   private String g_img;
   
   // 구직자
   private String p_id;
   private String p_pwd;
   private String p_name;
   private String p_nickname;
   private int p_gender;
   private int p_smoke;
   private String p_tel;
   private String p_addr;
   private String p_img;
   private String p_jumin;
   private String p_ex_my;
   private String p_ex_other;
   private String p_ex_etc;
   private String p_update_date;   
      
   
   // 고용자
   private String o_id;
   private String o_pwd;   
   private String o_name;
   private int o_gender;
   private String o_nickname;
   private String o_tel;
   private String o_addr;
   
   // 동물 종류
   private int a_num;
   private String a_name;
   
   // 동물 품종
   private int at_num;
   private String at_name;
   
   // 동물 정보 
   private int ai_num;
   private String ai_img;
   private String an_num_link;
   
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
   
   // 자유게시판 
   private String f_nickname;
   private String f_title;
   private Date f_date;
   private String f_img;
   
   // QnA게시판 
   private String q_nickname;
   private String q_title;
   private Date q_date;
   
   // 알리아스 
   private double applycount;
   private double likecount;
   private double starcount;
   private int reviewcount;
   private int invitationcount;
   private String nextlevel;
   
   // 성격 키워드 처리를 위한 멤버변수 선언
   private ArrayList<String> an_words;
   
   
   // 0. 기본 생성자 
   public MyPageDTO() {
      
   }
   
   // 1-1. 인자 생성자(마이페이지 메인 section 1)
   public MyPageDTO (String g_img,String g_name,int invitationcount,double likecount,double starcount) {
      super();
      this.g_img = g_img;
      this.g_name = g_name;
      this.invitationcount = invitationcount;
      this.likecount = likecount;   
      this.starcount = starcount;   
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
   
   // 1-2. 인자 생성자(마이페이지 메인 section 2 / 나의 지원 - 지원내역)	
   public MyPageDTO(int i_num, int ap_num, int a_num, String ai_img, String an_num_link, String m_name, String i_title, Date i_start, Date i_end, ArrayList<String> an_words) {
	   super();
	   this.i_num = i_num;
	   this.ap_num = ap_num;
	   this.a_num = a_num;
	   this.ai_img = ai_img;
	   this.an_num_link = an_num_link;
	   this.m_name = m_name;
	   this.i_title = i_title;
	   this.i_start = i_start;
	   this.i_end = i_end;
	   this.an_words = an_words;
   }
   
   // 1-3. 인자 생성자(마이페이지 나의 지원 - 지원서 관리 메인)	 
   public MyPageDTO(String p_update_date, String g_name, int g_price) {
	   super();
	   this.p_update_date = p_update_date;
	   this.g_name = g_name;
	   this.g_price = g_price;
   }
   
   // 1-4. 인자 생성자(마이페이지 나의 지원 - 지원서 관리 수정하기)	 
   public MyPageDTO(String p_jumin, String p_tel, String p_addr, String p_img, String p_ex_my, String p_ex_oher, String p_ex_etc) {
	   super();
	   this.p_jumin = p_jumin;
	   this.p_tel = p_tel;
	   this.p_addr = p_addr;
	   this.p_img = p_img;
	   this.p_ex_my = p_ex_my;
	   this.p_ex_other = p_ex_oher;
	   this.p_ex_etc = p_ex_etc;
	   
   }
   
   // 1-5. 인자 생성자(마이페이지 관심내역 - 관심 초대장 정보 불러오기)
   public MyPageDTO(String ai_img, String i_title, Date i_start, Date i_end, double starcount, int reviewcount, int w_num, String wt_num_value) {
	  super();
	  this.ai_img = ai_img;
	  this.i_title = i_title;
	  this.i_start = i_start;
	  this.i_end = i_end;
	  this.starcount = starcount;
	  this.reviewcount = reviewcount;
	  this.w_num =  w_num;
	  this.wt_num_value =  wt_num_value;
  }
  
   // 1-6. 인자 생성자(마이페이지 관심내역 - 관심 고용자 정보 불러오기)
   public MyPageDTO(String o_name,String o_nickname,double starcount,int reviewcount,int invitationcount, int w_num, String wt_num_value) {
	  super();  
	  this.o_name = o_name;
	  this.o_nickname = o_nickname;
	  this.starcount = starcount;
	  this.reviewcount = reviewcount;
	  this.invitationcount = invitationcount;
	  this.w_num =  w_num;
	  this.wt_num_value =  wt_num_value;
   } 

    //1-7. 인자 생성자(마이페이지 관심내역 - 관심 구직자 정보 불러오기)
  	public MyPageDTO(String p_name, String p_nickname, String p_img, double starcount, int reviewcount, int applycount,  int w_num, String wt_num_value) {
  	  super();
  	  this.p_name = p_name;
  	  this.p_nickname = p_nickname;
  	  this.p_img = p_img;
  	  this.starcount = starcount;
  	  this.reviewcount = reviewcount;
  	  this.applycount = applycount;
  	  this.w_num =  w_num;
	  this.wt_num_value =  wt_num_value;
    }
  	
  	//1-8. 인자 생성자(마이페이지 관심내역 - 관심 자유게시판 정보 불러오기)
  	public MyPageDTO(String f_img, String f_title, Date f_date, String f_nickname, String o_name, String p_name, int w_num, String wt_num_value ) {
  		super();
  		this.f_img = f_img;
  		this.f_title = f_title;
  		this.f_date = f_date;
  		this.f_nickname = f_nickname;
    	this.o_name = o_name;
    	this.p_name = p_name;
    	this.w_num =  w_num;
  	    this.wt_num_value =  wt_num_value;
    }
  	
  	//1-9. 인자 생성자(마이페이지 관심내역 - 관심 QnA게시판 정보 불러오기)
  	public MyPageDTO(String q_title, Date q_date, String q_nickname, String o_name, String p_name, int w_num, String wt_num_value ) {
  		super();
  		this.q_title = q_title;
  		this.q_date = q_date;
  		this.q_nickname = q_nickname;
    	this.o_name = o_name;
    	this.p_name = p_name;
    	this.w_num =  w_num;
  	    this.wt_num_value =  wt_num_value;
    }
  	
  	//1-10. 인자 생성자(마이페이지 회원정보 - 고용자일때 정보 불러오기)
  	public MyPageDTO(String o_id, String o_pwd, String o_name, int o_gender, String o_nickname, String o_tel, String o_addr ) {
  		super();
  		this.o_id = o_id;
  		this.o_pwd = o_pwd;
  		this.o_name = o_name;
  		this.o_gender = o_gender;
  		this.o_nickname = o_nickname;
  		this.o_tel = o_tel;  	
    	this.o_addr = o_addr;
    }
  	
  	//1-11. 인자 생성자(마이페이지 회원정보 - 구직자일때 정보 불러오기)
  	public MyPageDTO(String p_id, String p_pwd, String p_name, int p_gender, int p_smoke, String p_nickname, String p_img, String p_tel, String p_addr ) {
  		super();
  		this.p_id = p_id;
  		this.p_pwd = p_pwd;
  		this.p_name = p_name;
  		this.p_gender = p_gender;
  		this.p_smoke= p_smoke;
  		this.p_nickname = p_nickname;
  		this.p_img = p_img;
  		this.p_tel = p_tel;  	
    	this.p_addr = p_addr;
    }
  	
  	// 1-12. 인자 생성자(마이페이지 회원등급 - 정보 불러오기 )
    public MyPageDTO (String g_img,String g_name, String nextlevel) {
       super();
       this.g_img = g_img;
       this.g_name = g_name;
       this.nextlevel = nextlevel;
    }

    
	// getter, setter 
  	public String getNextlevel() {
		return nextlevel;
	}

	public void setNextlevel(String nextlevel) {
		this.nextlevel = nextlevel;
	}
	
  	public String getP_pwd() {
		return p_pwd;
	}
	
	public void setP_pwd(String p_pwd) {
		this.p_pwd = p_pwd;
	}

	public int getP_gender() {
		return p_gender;
	}

	public void setP_gender(int p_gender) {
		this.p_gender = p_gender;
	}

	public int getP_smoke() {
		return p_smoke;
	}

	public void setP_smoke(int p_smoke) {
		this.p_smoke = p_smoke;
	}
  	  	
  	public String getQ_nickname() {
		return q_nickname;
	}

	public String getO_pwd() {
		return o_pwd;
	}

	public void setO_pwd(String o_pwd) {
		this.o_pwd = o_pwd;
	}

	public int getO_gender() {
		return o_gender;
	}

	public void setO_gender(int o_gender) {
		this.o_gender = o_gender;
	}

	public String getO_tel() {
		return o_tel;
	}

	public void setO_tel(String o_tel) {
		this.o_tel = o_tel;
	}

	public String getO_addr() {
		return o_addr;
	}

	public void setO_addr(String o_addr) {
		this.o_addr = o_addr;
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
  	
  	public String getF_nickname() {
		return f_nickname;
	}

	public void setF_nickname(String f_nickname) {
		this.f_nickname = f_nickname;
	}

	public String getF_title() {
		return f_title;
	}

	public void setF_title(String f_title) {
		this.f_title = f_title;
	}

	public Date getF_date() {
		return f_date;
	}

	public void setF_date(Date f_date) {
		this.f_date = f_date;
	}

	public String getF_img() {
		return f_img;
	}

	public void setF_img(String f_img) {
		this.f_img = f_img;
	}
  	
  	public int getInvitationcount() {
		return invitationcount;
	}

	public void setInvitationcount(int invitationcount) {
		this.invitationcount = invitationcount;
	}
  
  	public int getReviewcount() {
  		return reviewcount;
  	}

	public void setReviewcount(int reviewcount) {
  		this.reviewcount = reviewcount;
  	}

   public String getP_update_date() {
	   return p_update_date;
   }

   public void setP_update_date(String p_update_date) {
	   this.p_update_date = p_update_date;
   }
   
   public String getP_tel() {
	   return p_tel;
   }

   public void setP_tel(String p_tel) {
	   this.p_tel = p_tel;
   }

   public String getP_addr() {
	   return p_addr;
   }

   public void setP_addr(String p_addr) {
	   this.p_addr = p_addr;
   }

   public String getP_img() {
	   return p_img;
   }

   public void setP_img(String p_img) {
	   this.p_img = p_img;
   }

   public String getP_jumin() {
	   return p_jumin;
   }

   public void setP_jumin(String p_jumin) {
	   this.p_jumin = p_jumin;
   }

   public String getP_ex_my() {
	   return p_ex_my;
   }

   public void setP_ex_my(String p_ex_my) {
	   this.p_ex_my = p_ex_my;
   }

   public String getP_ex_other() {
	   return p_ex_other;
   }

   public void setP_ex_other(String p_ex_other) {
	   this.p_ex_other = p_ex_other;
   }

   public String getP_ex_etc() {
	   return p_ex_etc;
   }

   public void setP_ex_etc(String p_ex_etc) {
	   this.p_ex_etc = p_ex_etc;
   }

	public ArrayList<String> getAn_words() {
	return an_words;
	}

	public void setAn_words(ArrayList<String> an_words) {
		this.an_words = an_words;
	}

   public String getAn_num_link() {
		return an_num_link;
	}	
	
	public void setAn_num_link(String an_num_link) {
		this.an_num_link = an_num_link;
	}
	
    public String getWt_num_value() {
		return wt_num_value;
	}

	public void setWt_num_value(String wt_num_value) {
		this.wt_num_value = wt_num_value;
	}

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
 