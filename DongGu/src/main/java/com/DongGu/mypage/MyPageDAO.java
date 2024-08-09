package com.DongGu.mypage;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class MyPageDAO {
   private Connection conn;
   private PreparedStatement ps, ps2;
   private ResultSet rs, rs2;
   
   // 1-1. 마이페이지 메인 section 1
   public MyPageDTO mypage_section1(String m_sid) {
      System.out.println("마이페이지 메인 section 1 매서드 실행됨!");         
      MyPageDTO dto1 = null;

      try {
         conn = com.DongGu.db.DongGuDB.getConn();
         String sql = "SELECT g.g_img,g.g_name, "
        		  + "(SELECT COUNT(*) FROM application a WHERE a.p_id = ?) AS applycount, "
                  + "(SELECT COUNT(*) FROM wishlist w WHERE w.w_id = ?) AS likecount, "
                  + "(SELECT AVG(r.r_star) FROM review r WHERE r.r_receive_id = ?) AS starcount "
                  + "FROM petsitter ps JOIN grade g ON ps.g_num = g.g_num "
                  + "WHERE ps.p_id = ?";
         
         ps=conn.prepareStatement(sql);
         ps.setString(1, m_sid);
         ps.setString(2, m_sid);
         ps.setString(3, m_sid);
         ps.setString(4, m_sid);
         
         
         rs = ps.executeQuery();
         while(rs.next()) {          
                String g_img = rs.getString("g_img");
                String g_name = rs.getString("g_name");             
                int applycount = rs.getInt("applycount");  
                int likecount = rs.getInt("likecount"); 
                double starcount = rs.getDouble("starcount"); 
                
                dto1 = new MyPageDTO(g_img, g_name, applycount, likecount, starcount);
                  
             }

         return dto1;
         
         
      }catch(Exception e) {
         e.printStackTrace();
         return null;         
      }finally {
         try {
            if(rs!=null) rs.close();
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
         }catch (Exception e) {
            e.printStackTrace();
            
         }
      }
   }
   
   
   
   
   // 1-2. 마이페이지 메인 section 2
   public ArrayList<MyPageDTO> mypage_section2(String m_sid) {
      System.out.println("마이페이지 메인 section 2 매서드 실행됨!");         
      MyPageDTO dto2 = null;

      try {
         conn = com.DongGu.db.DongGuDB.getConn();
         String sql = "SELECT * FROM ( "
         		+ "SELECT a.a_num,ai.ai_img, ai.an_num_link, ms.m_name,i.i_title,i.i_start, i.i_end "
         		+ "FROM invitation i "
         		+ "JOIN animalinfo ai ON i.ai_num = ai.ai_num "
         		+ "JOIN animaltype at ON ai.at_num = at.at_num "
         		+ "JOIN animal a ON at.a_num = a.a_num "
         		+ "JOIN application ap ON i.i_id = ap.i_id "
         		+ "JOIN matchingstate ms ON ms.m_num = ap.m_num "
         		+ "WHERE ap.p_id = ? "
         		+ "order by ap.ap_num desc "
         		+ ") "
         		+ "WHERE ROWNUM <= 3 ";
            
         ps=conn.prepareStatement(sql);
         ps.setString(1, m_sid);

            
         rs = ps.executeQuery();
         ArrayList<MyPageDTO> mlist = new ArrayList<>();
         while(rs.next()) {          
        	   int a_num = rs.getInt("a_num");  
               String ai_img = rs.getString("ai_img");
               String an_num_link = rs.getString("an_num_link");             
               String m_name = rs.getString("m_name");        
               String i_title = rs.getString("i_title");  
               Date i_start = rs.getDate("i_start");
               Date i_end = rs.getDate("i_end");
               
               String[] an_nums = an_num_link.split("/");
               ArrayList<String> an_words = new ArrayList<>();
               
               for (int i = 0; i < an_nums.length; i++) {
            	   String an_num = an_nums[i].trim();       
            	   String sql2 = "SELECT an_word FROM animalnature WHERE an_num = ?";
            	   
            	   ps2=conn.prepareStatement(sql2);
            	   ps2.setString(1, an_num.trim());
                   
                   rs2 = ps2.executeQuery();                  
                   if (rs2.next()) {
                       an_words.add(rs2.getString("an_word"));
                   }
			}
               
               dto2 = new MyPageDTO(a_num, ai_img, an_num_link, m_name, i_title, i_start, i_end, an_words);
               mlist.add(dto2);
                     
            }

         return mlist;
            
            
      }catch(Exception e) {
         e.printStackTrace();
         return null;         
      }finally {
         try {
            if(rs!=null) rs.close();
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
         }catch (Exception e) {
            e.printStackTrace();
               
         }
      }
   }   
   
   
   
   
   // 2-1. 마이페이지 지원내역 리스트 
   public ArrayList<MyPageDTO> mypage_applyList1(String m_sid) {
      System.out.println("마이페이지 지원내역 매서드1 실행됨!");         
      MyPageDTO dto = null;

      try {
         conn = com.DongGu.db.DongGuDB.getConn();
         String sql = "SELECT a.a_num,ai.ai_img, ai.an_num_link, ms.m_name,i.i_title,i.i_start, i.i_end "
         		+ "FROM invitation i "
         		+ "JOIN animalinfo ai ON i.ai_num = ai.ai_num "
         		+ "JOIN animaltype at ON ai.at_num = at.at_num "
         		+ "JOIN animal a ON at.a_num = a.a_num "
         		+ "JOIN application ap ON i.i_id = ap.i_id "
         		+ "JOIN matchingstate ms ON ms.m_num = ap.m_num "
         		+ "WHERE ap.p_id = ? "
         		+ "order by ap.ap_num desc ";
            
         ps=conn.prepareStatement(sql);
         ps.setString(1, m_sid);

            
         rs = ps.executeQuery();
         ArrayList<MyPageDTO> malist = new ArrayList<>();
         while(rs.next()) {          
        	   int a_num = rs.getInt("a_num");  
               String ai_img = rs.getString("ai_img");
               String an_num_link = rs.getString("an_num_link");             
               String m_name = rs.getString("m_name");        
               String i_title = rs.getString("i_title");  
               Date i_start = rs.getDate("i_start");
               Date i_end = rs.getDate("i_end");
               
               String[] an_nums = an_num_link.split("/");
               ArrayList<String> an_words = new ArrayList<>();
               
               for (int i = 0; i < an_nums.length; i++) {
            	   String an_num = an_nums[i].trim();       
            	   String sql2 = "SELECT an_word FROM animalnature WHERE an_num = ?";
            	   
            	   ps2=conn.prepareStatement(sql2);
            	   ps2.setString(1, an_num.trim());
                   
                   rs2 = ps2.executeQuery();                  
                   if (rs2.next()) {
                       an_words.add(rs2.getString("an_word"));
                   }
			}
               
               dto = new MyPageDTO(a_num, ai_img, an_num_link, m_name, i_title, i_start, i_end, an_words);
               malist.add(dto);
                     
            }

         return malist;
            
            
      }catch(Exception e) {
         e.printStackTrace();
         return null;         
      }finally {
         try {
            if(rs!=null) rs.close();
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
         }catch (Exception e) {
            e.printStackTrace();
               
         }
      }
   }   
   
   
   
   
}
