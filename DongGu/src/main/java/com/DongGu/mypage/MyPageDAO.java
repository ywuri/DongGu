package com.DongGu.mypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class MyPageDAO {
   private Connection conn;
   private PreparedStatement ps;
   private ResultSet rs;
   
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
   public MyPageDTO mypage_section2(String m_sid) {
      System.out.println("마이페이지 메인 section 2 매서드 실행됨!");         
      MyPageDTO dto2 = null;

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
                   
               dto2 = new MyPageDTO(g_img, g_name, applycount, likecount, starcount);
                     
            }

         return dto2;
            
            
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
