package com.DongGu.mypage;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;



public class MyPageDAO {
   private Connection conn;
   private PreparedStatement ps, ps2;
   private ResultSet rs, rs2;
   
   // 1-1. 마이페이지 메인페이지 - section 1
   public MyPageDTO mypage_section1(String m_sid, int m_usertype) {
      System.out.println("마이페이지 메인 - section 1 매서드 실행됨!");         
      MyPageDTO dto1 = null;

      try {
         conn = com.DongGu.db.DongGuDB.getConn();
         String sql_owner = "SELECT g.g_img,g.g_name, "
         		+ "(SELECT COUNT(*)FROM invitation i WHERE i.ai_num IN (SELECT ai.ai_num FROM animalinfo ai WHERE ai.o_id = ? ))AS invitationcount , "
         		+ "(SELECT COUNT(*) FROM wishlist w WHERE w.w_id = ? ) AS likecount, "
         		+ "(SELECT AVG(r.r_star) FROM review r WHERE r.r_receive_id = ? ) AS starcount "
         		+ "FROM owner o JOIN grade g ON o.g_num = g.g_num "
         		+ "WHERE o.o_id = ? ";
         
         String sql_petsitter = "SELECT g.g_img,g.g_name, "
       		    + "(SELECT COUNT(*) FROM application a WHERE a.p_id = ?) AS applycount, "
                + "(SELECT COUNT(*) FROM wishlist w WHERE w.w_id = ?) AS likecount, "
                + "(SELECT AVG(r.r_star) FROM review r WHERE r.r_receive_id = ?) AS starcount "
                + "FROM petsitter ps JOIN grade g ON ps.g_num = g.g_num "
                + "WHERE ps.p_id = ?";
         
         
         if (m_usertype == 0) {
        	 ps=conn.prepareStatement(sql_owner);
        	 ps.setString(1, m_sid);
             ps.setString(2, m_sid);
             ps.setString(3, m_sid);
             ps.setString(4, m_sid);    
             
             rs = ps.executeQuery();		   		         
	         while(rs.next()) { 	                
	        	 String g_img = rs.getString("g_img");
	             String g_name = rs.getString("g_name");          
	             int invitationcount = rs.getInt("invitationcount");   
	             int likecount = rs.getInt("likecount"); 
	             double starcount = rs.getDouble("starcount"); 
	                
	             dto1 = new MyPageDTO(g_img, g_name, invitationcount, likecount, starcount);
	         }
		} else if (m_usertype == 1) {
			ps=conn.prepareStatement(sql_petsitter);
       	 	ps.setString(1, m_sid);
       	 	ps.setString(2, m_sid);
            ps.setString(3, m_sid);
            ps.setString(4, m_sid);
            
            rs = ps.executeQuery();		   		         
	         while(rs.next()) { 	                
	        	 String g_img = rs.getString("g_img");
	             String g_name = rs.getString("g_name");          
	             double applycount = rs.getDouble("applycount");  
	             int likecount = rs.getInt("likecount"); 
	             double starcount = rs.getDouble("starcount"); 
	                
	             dto1 = new MyPageDTO(g_img, g_name, applycount, likecount, starcount);
	         }
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
   
   
   
   
   // 1-2. 마이페이지 메인페이지 - section 2
   public ArrayList<MyPageDTO> mypage_section2(String m_sid, int m_usertype) {
      System.out.println("마이페이지 메인 - section 2 매서드 실행됨!");         
      MyPageDTO dto2 = null;

      try {
         conn = com.DongGu.db.DongGuDB.getConn();
         
         String sql_owner = "SELECT * FROM ( "
          		+ "SELECT i.i_num, ap.ap_num, a.a_num,ai.ai_img, ai.an_num_link, ms.m_name,i.i_title,i.i_start, i.i_end "
          		+ "FROM invitation i "
          		+ "JOIN animalinfo ai ON i.ai_num = ai.ai_num "
          		+ "JOIN animaltype at ON ai.at_num = at.at_num "
          		+ "JOIN animal a ON at.a_num = a.a_num "
         		+ "LEFT OUTER JOIN application ap ON i.i_num = ap.i_num "
          		+ "JOIN matchingstate ms ON ms.m_num = i.m_num "
          		+ "WHERE i.ai_num in (select ai.ai_num from animalinfo i where ai.o_id = ?) "
          		+ "ORDER BY i.i_num desc  "
          		+ ") "
          		+ "WHERE ROWNUM <= 3 ";
         
         String sql_petsitter = "SELECT * FROM ( "
         		+ "SELECT i.i_num, ap.ap_num, a.a_num,ai.ai_img, ai.an_num_link, ms.m_name,i.i_title,i.i_start, i.i_end "
         		+ "FROM invitation i "
         		+ "JOIN animalinfo ai ON i.ai_num = ai.ai_num "
         		+ "JOIN animaltype at ON ai.at_num = at.at_num "
         		+ "JOIN animal a ON at.a_num = a.a_num "
         		+ "JOIN application ap ON i.i_num = ap.i_num "
         		+ "JOIN matchingstate ms ON ms.m_num = ap.m_num "
         		+ "WHERE ap.p_id = ? "
         		+ "ORDER BY ap.ap_num desc "
         		+ ") "
         		+ "WHERE ROWNUM <= 3 ";
         
         
         
         if (m_usertype == 0) {
        	 ps=conn.prepareStatement(sql_owner);
         } else if(m_usertype == 1) {
        	 ps=conn.prepareStatement(sql_petsitter);
         }
         ps.setString(1, m_sid);

         
         rs = ps.executeQuery();
         ArrayList<MyPageDTO> mlist = new ArrayList<>();
         while(rs.next()) {          
        	   int i_num = rs.getInt("i_num");  
        	   int ap_num = rs.getInt("ap_num");  
        	   int a_num = rs.getInt("a_num");  
               String ai_img = rs.getString("ai_img");
               String an_num_link = rs.getString("an_num_link");             
               String m_name = rs.getString("m_name");        
               String i_title = rs.getString("i_title");  
               Date i_start = rs.getDate("i_start");
               Date i_end = rs.getDate("i_end");
               
               String[] an_nums = an_num_link.split("\\|");
               ArrayList<String> an_words = new ArrayList<>();
               
               for (int i = 0; i < an_nums.length; i++) {
            	   
            	   String an_num = an_nums[i].trim();       
            	   String sql2 = "SELECT an_word FROM animalnature WHERE an_num = ?";
            	   
            	   ps2=conn.prepareStatement(sql2);
            	   ps2.setString(1, an_num);
                   
                   rs2 = ps2.executeQuery();                  
                   if (rs2.next()) {
                       an_words.add(rs2.getString("an_word"));
                   }
			}
               
               dto2 = new MyPageDTO(i_num,ap_num,a_num, ai_img, an_num_link, m_name, i_title, i_start, i_end, an_words);
               mlist.add(dto2);
                     
            }

         return mlist;           
            
      }catch(Exception e) {
         e.printStackTrace();
         System.err.println("여기 " );
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
   
   
   
     
   // 2-1. 마이페이지 지원내역 페이지 - 특정 페이지에 해당하는 목록 가져오기 
   public ArrayList<MyPageDTO> mypage_applyList1(String m_sid,int cp,int listSize, int m_usertype) {
      System.out.println("마이페이지 지원내역 - 특정 페이지에 해당하는 목록 가져오는 매서드 실행됨!");         
      MyPageDTO dto = null;

      try {
         conn = com.DongGu.db.DongGuDB.getConn();
         
         String sql_owner = "SELECT * "
           		+ "FROM (SELECT ROWNUM rnum, a.* "
           		+ "FROM ( "
           		+ "SELECT i.i_num, ap.ap_num, a.a_num,ai.ai_img, ai.an_num_link, ms.m_name,i.i_title,i.i_start, i.i_end "
           		+ "FROM invitation i "
           		+ "JOIN animalinfo ai ON i.ai_num = ai.ai_num "
           		+ "JOIN animaltype at ON ai.at_num = at.at_num "
           		+ "JOIN animal a ON at.a_num = a.a_num "
           		+ "JOIN application ap ON i.i_num = ap.i_num "
           		+ "JOIN matchingstate ms ON ms.m_num = i.m_num "
           		+ "WHERE i.ai_num in (select ai.ai_num from animalinfo i where ai.o_id = ?) "
           		+ "ORDER BY i.i_num desc ) a "
           		+ ") b "
           		+ "WHERE rnum BETWEEN ? AND ?  ";
         
         
         String sql_petsitter = "SELECT * "
          		+ "FROM (SELECT ROWNUM rnum, a.* "
          		+ "FROM ( "  
          		+ "SELECT i.i_num, ap.ap_num, a.a_num,ai.ai_img, ai.an_num_link, ms.m_name,i.i_title,i.i_start, i.i_end "
          		+ "FROM invitation i "
          		+ "JOIN animalinfo ai ON i.ai_num = ai.ai_num "
          		+ "JOIN animaltype at ON ai.at_num = at.at_num "
          		+ "JOIN animal a ON at.a_num = a.a_num "
          		+ "JOIN application ap ON i.i_num = ap.i_num "
          		+ "JOIN matchingstate ms ON ms.m_num = ap.m_num "
          		+ "WHERE ap.p_id = ? "
          		+ "ORDER BY ap.ap_num desc ) a "
          		+ ") b "
          		+ "WHERE rnum BETWEEN ? AND ?  ";
                      
         
         int start = (cp - 1) * listSize + 1;
         System.out.println("start:"+start);
         int end = cp * listSize;
         System.out.println("end:"+end);
 
         if (m_usertype == 0) {
        	 ps=conn.prepareStatement(sql_owner);
         } else if(m_usertype == 1) {
        	 ps=conn.prepareStatement(sql_petsitter);
         }
                
         ps.setString(1, m_sid);
         ps.setInt(2, start);
		 ps.setInt(3, end);

            
         rs = ps.executeQuery();
         ArrayList<MyPageDTO> malist = new ArrayList<>();
         while(rs.next()) {     
        	   int i_num = rs.getInt("i_num"); 
        	   int ap_num = rs.getInt("ap_num");       	   
        	   int a_num = rs.getInt("a_num");  
               String ai_img = rs.getString("ai_img");
               String an_num_link = rs.getString("an_num_link");             
               String m_name = rs.getString("m_name");        
               String i_title = rs.getString("i_title");  
               Date i_start = rs.getDate("i_start");
               Date i_end = rs.getDate("i_end");
               
               String[] an_nums = an_num_link.split("\\|");
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
               
               dto = new MyPageDTO(i_num, ap_num,a_num, ai_img, an_num_link, m_name, i_title, i_start, i_end, an_words);
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
   
   
   
   // 2-2. 마이페이지 지원내역 페이지 - 페이징 메서드(전체 게시글 카운트)
   public int getTotal(String m_sid,int m_usertype) {
      System.out.println("마이페이지 지원내역 - 페이징 메서드(전체 게시글 카운트) 실행됨!");    
      		
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			
			String sql_owner = "SELECT count(*) "
					+ "FROM invitation i "
					+ "JOIN animalinfo ai ON ai.ai_num = i.ai_num "
					+ "JOIN owner o ON o.o_id = ai.o_id "
					+ "WHERE o.o_id = ? ";
			
			String sql_petsitter = "SELECT count(*) "
					+ "FROM application "
					+ "WHERE p_id = ? ";
			
			 if (m_usertype == 0) {
	        	 ps=conn.prepareStatement(sql_owner);
	         } else if(m_usertype == 1) {
	        	 ps=conn.prepareStatement(sql_petsitter);
	         }

	        ps.setString(1, m_sid);
			
			rs = ps.executeQuery();
			int result = 0;			
			if(rs.next()) {
				result = rs.getInt(1);
			}		
			System.out.println("전체 게시글:"+result);
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if(rs!=null)rs.close();
		        if(ps!=null)ps.close();
		        if(conn!=null)conn.close();
			} catch (Exception e2) {
		
			}
		}
	}
   
   
   
   // 3-1. 마이페이지 지원서 관리 메인페이지 - 정보 가져오기 
   public MyPageDTO mypage_ApplyManage1(String m_sid) {
	      System.out.println("마이페이지 지원서 관리 - 메인 매서드 실행됨!");         
	      MyPageDTO dto = null;

	      try {
	         conn = com.DongGu.db.DongGuDB.getConn();
	         String sql = "SELECT p.p_update_date,g.g_name, g.g_price "
	         		+ "FROM petsitter p "
	         		+ "JOIN grade g ON p.g_num = g.g_num "
	         		+ "WHERE p.p_id = ? ";
	         
	         ps=conn.prepareStatement(sql);
	         ps.setString(1, m_sid);	      	         
	         
	         rs = ps.executeQuery();
	         while(rs.next()) { 
	        	 	String p_update_date = rs.getString("p_update_date");
	                String g_name = rs.getString("g_name");             
	                int g_price = rs.getInt("g_price");    	           
	                
	                dto = new MyPageDTO(p_update_date, g_name, g_price);
	                  
	             }

	         return dto;
	         	         
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

   
 
   
   // 3-2. 마이페이지 지원서 관리 수정페이지 -  정보 가져오기 
   public MyPageDTO mypage_ApplyManage2(String m_sid) {
	      System.out.println("마이페이지 지원서 관리 - 수정페이지 정보 가져오기 매서드 실행됨!");         
	      MyPageDTO dto = null;

	      try {
	         conn = com.DongGu.db.DongGuDB.getConn();
	         String sql = "SELECT p_jumin, p_tel, p_addr, p_img, p_ex_my, p_ex_other, p_ex_etc "
	         		+ "FROM petsitter "
	         		+ "WHERE p_id = ? ";
	         
	         ps=conn.prepareStatement(sql);
	         ps.setString(1, m_sid);	      	         
	         
	         rs = ps.executeQuery();
	         while(rs.next()) {          
	                String p_jumin = rs.getString("p_jumin");	                
	                String p_tel = rs.getString("p_tel");
	                String p_addr = rs.getString("p_addr");
	                String p_img = rs.getString("p_img");
	                String p_ex_my = rs.getString("p_ex_my");
	                String p_ex_other = rs.getString("p_ex_other");
	                String p_ex_etc = rs.getString("p_ex_etc");
	                	                                 
	                dto = new MyPageDTO(p_jumin,p_tel,p_addr,p_img,p_ex_my,p_ex_other,p_ex_etc);
	             }

	         return dto;	         
	         
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

   
   
   // 3-3. 마이페이지 지원서 관리 수정페이지 -  실제 수정 실행 
   public int mypage_ApplyManage3(MyPageDTO dto, String m_sid) {
	    System.out.println("마이페이지 지원서 관리 - 수정페이지 실제 수정 매서드 실행됨!");
	    try {
	    	 conn = com.DongGu.db.DongGuDB.getConn();

	        String sql = "UPDATE petsitter SET p_ex_my=?, p_ex_other=?, p_ex_etc =?, p_update_date=SYSDATE WHERE p_id = ? ";

	        ps = conn.prepareStatement(sql);

	        // DTO에서 값을 가져와서 PreparedStatement에 설정
	        ps.setString(1, dto.getP_ex_my());
	        ps.setString(2, dto.getP_ex_other());	 		      
	        ps.setString(3, dto.getP_ex_etc());	 
	        ps.setString(4, m_sid);	 	        

	        // SQL 실행
	        int count = ps.executeUpdate();
	        
	        // 확인용 출력 
	        System.out.println(count);

	        return count;
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1; // 오류 발생 시 -1 반환
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }
	    }
	}	  
   
   
   // 4-1. 마이페이지 관심내역 관심초대장 페이지 -  정보 가져오기 
   public ArrayList<MyPageDTO> mypage_Like1(String m_sid, String likeValue) {
	      System.out.println("마이페이지 관심내역 관심초대장 페이지 - 정보 가져오기 매서드 실행됨!");         
	      MyPageDTO dto = null;
	      ArrayList<MyPageDTO> mlist = new ArrayList<>(); 
	      try {
	         conn = com.DongGu.db.DongGuDB.getConn();
	         
	         String sql10 = "SELECT o.o_name, o.o_nickname, "
	         		+ "(SELECT AVG(r.r_star) FROM review r WHERE r.r_receive_id = o.o_id) AS starcount, "
	         		+ "(SELECT COUNT(r.r_num) FROM review r  WHERE r.r_receive_id = o.o_id) AS reviewcount, "
	         		+ "(SELECT COUNT(i.i_num) FROM invitation i JOIN animalinfo ai ON ai.ai_num = i.ai_num WHERE ai.o_id = o.o_id) AS invitationcount, "
	         		+ "(SELECT w.w_num FROM wishlist w WHERE w.w_id = ? AND w.wt_num = ? AND w.wt_num_value = o.o_id) AS w_num, "
	         		+ "(SELECT w.wt_num_value FROM wishlist w WHERE w.w_id = ? AND w.wt_num = ? AND w.wt_num_value = o.o_id) AS wt_num_value "
	         		+ "FROM owner o "
	         		+ "WHERE o.o_id IN ( "
	         		+ "SELECT w.wt_num_value "
	         		+ "FROM wishlist w "
	         		+ "WHERE w.w_id = ? "
	         		+ "AND w.wt_num = ? ) ";
	         
	         String sql20 = "SELECT p.p_name, p.p_nickname, p.p_img, "
	         		+ "(SELECT AVG(r.r_star) FROM review r WHERE r.r_receive_id = p.p_id) AS starcount, "
	         		+ "(SELECT COUNT(r.r_num) FROM review r WHERE r.r_receive_id = p.p_id) AS reviewcount, "
	         		+ "(SELECT COUNT(*) FROM application a WHERE a.p_id = p.p_id) AS applycount, "
	         		+ "(SELECT w.w_num FROM wishlist w WHERE w.w_id = ? AND w.wt_num = ? AND w.wt_num_value = p.p_id ) AS w_num, "
	         		+ "(SELECT w.wt_num_value FROM wishlist w WHERE w.w_id = ? AND w.wt_num = ? AND w.wt_num_value = p.p_id ) AS wt_num_value "
	         		+ "FROM petsitter p "
	         		+ "WHERE p.p_id IN ( "
	         		+ "SELECT w.wt_num_value "
	         		+ "FROM wishlist w "
	         		+ "WHERE w.w_id = ? "
	         		+ "AND w.wt_num = ? )"; 
	         
	         String sql30 = "select ai.ai_img, i.i_title, i.i_start, i.i_end, "
	         		+ "(SELECT AVG(r.r_star) FROM review r WHERE r.r_receive_id = o.o_id) AS starcount, "
	         		+ "(SELECT count(r.r_num) FROM review r WHERE r.r_receive_id = o.o_id) AS reviewcount, "
	         		+ "(SELECT w.w_num FROM wishlist w WHERE w.w_id = ? AND w.wt_num = ? AND w.wt_num_value = i.i_num ) AS w_num, "
	         		+ "(SELECT w.wt_num_value FROM wishlist w WHERE w.w_id = ? AND w.wt_num = ? AND w.wt_num_value = i.i_num ) AS wt_num_value "
	         		+ "from invitation i "
	         		+ "JOIN animalinfo ai on i.ai_num = ai.ai_num "
	         		+ "JOIN owner o on ai.o_id = o.o_id "
	         		+ "where i.i_num IN (select wt_num_value "
	         		+ "from wishlist "
	         		+ "where w_id = ? and wt_num = ? ) ";
	         
	         String sql40 = "select f.f_img, f.f_title,f.f_date, f.f_nickname, "
	         		+ "(SELECT o.o_name FROM owner o WHERE o.o_id = f.f_id) AS o_name, "
	         		+ "(SELECT p.p_name FROM petsitter p WHERE p.p_id = f.f_id) AS p_name, "
	         		+ "(SELECT w.w_num FROM wishlist w WHERE w.w_id = ? AND w.wt_num = ? AND w.wt_num_value = f.f_num ) AS w_num, "
	         		+ "(SELECT w.wt_num_value FROM wishlist w WHERE w.w_id = ? AND w.wt_num = ? AND w.wt_num_value = f.f_num ) AS wt_num_value "
	         		+ "from free f 	"
	         		+ "where f.f_num IN (select w.wt_num_value "
	         		+ "from wishlist w "
	         		+ "where w.w_id = ? and wt_num = ? ) ";
	         
	         String sql50 = "select q.q_title,q.q_date, q.q_nickname, "
	         		+ "(SELECT o.o_name FROM owner o WHERE o.o_id = q.q_id) AS o_name, "
	         		+ "(SELECT p.p_name FROM petsitter p WHERE p.p_id = q.q_id) AS p_name, "
	         		+ "(SELECT w.w_num FROM wishlist w WHERE w.w_id = ? AND w.wt_num = ? AND w.wt_num_value = q.q_num ) AS w_num, "
	         		+ "(SELECT w.wt_num_value FROM wishlist w WHERE w.w_id = ? AND w.wt_num = ? AND w.wt_num_value = q.q_num ) AS wt_num_value "
	         		+ "from qna q "
	         		+ "where q.q_num IN (select w.wt_num_value "
	         		+ "from wishlist w "
	         		+ "where w.w_id = ? and wt_num = ? ) ";
	         
	         
	         if ("10".equals(likeValue)) {
	        	 ps=conn.prepareStatement(sql10);
	        	 ps.setString(1, m_sid);	      	 
		         ps.setString(2, likeValue);	 
		         ps.setString(3, m_sid);	      	 
		         ps.setString(4, likeValue);	 
		         ps.setString(5, m_sid);	      	 
		         ps.setString(6, likeValue);	 
		         
		         rs = ps.executeQuery();
		         
		         
		         while(rs.next()) {          
		                String o_name = rs.getString("o_name");	                
		                String o_nickname = rs.getString("o_nickname");
		                double starcount = rs.getDouble("starcount"); 
		                int reviewcount = rs.getInt("reviewcount");
		                int invitationcount = rs.getInt("invitationcount");
		                int w_num = rs.getInt("w_num");
		                String wt_num_value = rs.getString("wt_num_value");
		                	                                 
		                dto = new MyPageDTO(o_name,o_nickname,starcount,reviewcount,invitationcount,w_num,wt_num_value);
		                mlist.add(dto);
		             }		     
		         
	         }else if ("20".equals(likeValue)) {
	        	 ps=conn.prepareStatement(sql20);
	        	 ps.setString(1, m_sid);	      	 
		         ps.setString(2, likeValue);	  
		         ps.setString(3, m_sid);	      	 
		         ps.setString(4, likeValue);	
		         ps.setString(5, m_sid);	      	 
		         ps.setString(6, likeValue);	
		         
		         rs = ps.executeQuery();
		         
		         
		         while(rs.next()) {          
		                String p_name = rs.getString("p_name");	                
		                String p_nickname = rs.getString("p_nickname");
		                String p_img = rs.getString("p_img");
		                double starcount = rs.getDouble("starcount"); 
		                int reviewcount = rs.getInt("reviewcount");
		                int applycount = rs.getInt("applycount"); 
		                int w_num = rs.getInt("w_num");
		                String wt_num_value = rs.getString("wt_num_value");
		                	                                 
		                dto = new MyPageDTO(p_name,p_nickname,p_img,starcount,reviewcount,applycount,w_num,wt_num_value);
		                mlist.add(dto);
		             }		    
	         
	      	 }else if ("30".equals(likeValue)) {
	        	 ps=conn.prepareStatement(sql30);
	        	 ps.setString(1, m_sid);	      	 
		         ps.setString(2, likeValue);	
		         ps.setString(3, m_sid);	      	 
		         ps.setString(4, likeValue);	
		         ps.setString(5, m_sid);	      	 
		         ps.setString(6, likeValue);	
         
		         rs = ps.executeQuery();		      
		         		         
		         while(rs.next()) { 
		                String ai_img = rs.getString("ai_img");	                
		                String i_title = rs.getString("i_title");
		                Date i_start = rs.getDate("i_start");
		                Date i_end = rs.getDate("i_end");		
		                double starcount = rs.getDouble("starcount"); 
		                int reviewcount = rs.getInt("reviewcount");
		                int w_num = rs.getInt("w_num");
		                String wt_num_value = rs.getString("wt_num_value");
		                	                                 
		                dto = new MyPageDTO(ai_img,i_title,i_start,i_end,starcount,reviewcount,w_num,wt_num_value);
		                mlist.add(dto);
		             }
       
			 }else if ("40".equals(likeValue)) {
					 ps=conn.prepareStatement(sql40);
		        	 ps.setString(1, m_sid);	      	 
			         ps.setString(2, likeValue);
			         ps.setString(3, m_sid);	      	 
			         ps.setString(4, likeValue);	
			         ps.setString(5, m_sid);	      	 
			         ps.setString(6, likeValue);

			         rs = ps.executeQuery();		   
	 		         
			         while(rs.next()) { 
			                String f_img = rs.getString("f_img");	                
			                String f_title = rs.getString("f_title");
			                Date f_date = rs.getDate("f_date");
			                String f_nickname = rs.getString("f_nickname");
			                String o_name = rs.getString("o_name");
			                String p_name = rs.getString("p_name");
			                int w_num = rs.getInt("w_num");
			                String wt_num_value = rs.getString("wt_num_value");
			                	                                 
			                dto = new MyPageDTO(f_img,f_title,f_date,f_nickname,o_name,p_name,w_num,wt_num_value);
			                mlist.add(dto);
			             }
			         
			 }else if ("50".equals(likeValue)) {
					 ps=conn.prepareStatement(sql50);
		        	 ps.setString(1, m_sid);	      	 
			         ps.setString(2, likeValue);
			         ps.setString(3, m_sid);	      	 
			         ps.setString(4, likeValue);	
			         ps.setString(5, m_sid);	      	 
			         ps.setString(6, likeValue);
	
			         rs = ps.executeQuery();		   
	 		         
			         while(rs.next()) { 	                
			                String q_title = rs.getString("q_title");
			                Date q_date = rs.getDate("q_date");
			                String q_nickname = rs.getString("q_nickname");
			                String o_name = rs.getString("o_name");
			                String p_name = rs.getString("p_name");
			                int w_num = rs.getInt("w_num");
			                String wt_num_value = rs.getString("wt_num_value");
			                	                                 
			                dto = new MyPageDTO(q_title,q_date,q_nickname,o_name,p_name,w_num,wt_num_value);
			                mlist.add(dto);
			             }
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

   
   
   	// 4-2. 마이페이지 관심내역 관심고용자 페이지 -  위시리스트 삭제하기
	public int deleteWishlist(int removeHeartValue) {			
		System.out.println("마이페이지 관심내역 관심고용자 페이지 - 위시리스트 삭제 매서드 실행됨!");
	    try {
	    	 conn = com.DongGu.db.DongGuDB.getConn();

	        String sql = "DELETE FROM wishlist WHERE w_num = ? ";
	        ps = conn.prepareStatement(sql);	
	        ps.setInt(1, removeHeartValue);	 
			int count = ps.executeUpdate();
				
			return count;
			} catch (Exception e) {
				e.printStackTrace();
				return -1;
			} finally {
				try {
					if(ps!=null) ps.close();
		            if(conn!=null) conn.close();
				} catch (Exception e2) {
				}
			}
		}
	
	
	// 4-3. 마이페이지 관심내역 관심고용자 페이지 - 성별에 따른 사진 랜덤으로 설정하기 
	public ArrayList<String> mypage_Like2(String gendercheck_nickname) {
	      System.out.println("마이페이지 관심내역 관심고용자 페이지 - 성별에 따른 사진 랜덤으로 설정하기 매서드 실행됨!");         	   
	      ArrayList<String> mlist = new ArrayList<>(); 
	      try {
	         conn = com.DongGu.db.DongGuDB.getConn();
	         
	         String sql = "SELECT o_jumin FROM owner WHERE o_nickname = ? ";        
	         ps = conn.prepareStatement(sql);	
		     ps.setString(1, gendercheck_nickname);
		         
		     rs = ps.executeQuery();
		         
		     while(rs.next()) {          
		          String o_jumin = rs.getString("o_jumin");	                
		          mlist.add(o_jumin);
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



	// 5-1. 마이페이지 회원 정보 수정페이지 -  정보 가져오기 
	public MyPageDTO mypage_InfoUpdate1(String m_sid, int m_usertype) {
		      System.out.println("마이페이지 회원 정보 - 수정페이지 정보 가져오기 매서드 실행됨!");         
		      MyPageDTO dto = null;

		      try {
		         conn = com.DongGu.db.DongGuDB.getConn();
		         String sql_owner = "select o_id, o_pwd,o_name,o_gender,o_nickname,o_tel,o_addr "
		         		+ "from owner "
		         		+ "where o_id = ? ";
		         
		         String sql_petsitter = "select p_id, p_pwd,p_name,p_gender,p_smoke,p_nickname,p_img,p_tel,p_addr "
		         		+ "from petsitter "
		         		+ "where p_id = ? ";
		         
		         if (m_usertype == 0) {
		        	 ps=conn.prepareStatement(sql_owner);
		        	 ps.setString(1, m_sid);	      	 
	
			         rs = ps.executeQuery();		   
	 		         
			         while(rs.next()) { 	                
			                String o_id = rs.getString("o_id");	
			                String o_pwd = rs.getString("o_pwd");
			                String o_name = rs.getString("o_name");
			                int o_gender = rs.getInt("o_gender");
			                String o_nickname = rs.getString("o_nickname");
			                String o_tel = rs.getString("o_tel");
			                String o_addr = rs.getString("o_addr");
			                	                                 
			                dto = new MyPageDTO(o_id,o_pwd,o_name,o_gender,o_nickname,o_tel,o_addr);
			         }
				} else if (m_usertype == 1) {
					 ps=conn.prepareStatement(sql_petsitter);
		        	 ps.setString(1, m_sid);	      	 
	
			         rs = ps.executeQuery();		   
	 		         
			         while(rs.next()) { 	                
			                String p_id = rs.getString("p_id");	
			                String p_pwd = rs.getString("p_pwd");
			                String p_name = rs.getString("p_name");
			                int p_gender = rs.getInt("p_gender");
			                int p_smoke = rs.getInt("p_smoke");
			                String p_nickname = rs.getString("p_nickname");
			                String p_img = rs.getString("p_img");
			                String p_tel = rs.getString("p_tel");
			                String p_addr = rs.getString("p_addr");
			                	                                 
			                dto = new MyPageDTO(p_id,p_pwd,p_name,p_gender,p_smoke,p_nickname,p_img,p_tel,p_addr);
			         } 		         
				} 

		         return dto;	         
		         
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
	
	
	
	// 5-2. 마이페이지 회원 정보 수정페이지 -  비밀번호 맞는지 확인하기 
	public boolean mypage_InfoUpdate2(String m_sid, int m_usertype, String pwd) {
		System.out.println("마이페이지 회원 정보 - 수정페이지 정보 가져오기 매서드 실행됨!");         
	    boolean check = false;

	      try {
	         conn = com.DongGu.db.DongGuDB.getConn();
	         String sql_owner = "select * "
	         		+ "from owner "
	         		+ "where o_id = ? and o_pwd = ? ";
	         
	         String sql_petsitter =  "select * "
		         	+ "from petsitter "
		         	+ "where p_id = ? and p_pwd = ? ";
	         
	         if (m_usertype == 0) {
	        	 ps=conn.prepareStatement(sql_owner);
	        	 ps.setString(1, m_sid);	      	
	        	 ps.setString(2, pwd);

		         rs = ps.executeQuery();		   
		         
		         while(rs.next()) { 	                
		             check = true;
		         }
		         
			} else if (m_usertype == 1) {
				 ps=conn.prepareStatement(sql_petsitter);
				 ps.setString(1, m_sid);	      	
	        	 ps.setString(2, pwd);      	 

		         rs = ps.executeQuery();		   
		         
		         while(rs.next()) { 	                
		        	 check = true;
		         } 		         
			} 

	         return check;	         
	         
	      }catch(Exception e) {
	         e.printStackTrace();
	         return false;         
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
	   
	   
	
	// 5-3. 마이페이지 회원 정보 수정페이지 - 실제 수정 실행 
	public int mypage_InfoUpdate3(MyPageDTO dto, String m_sid, int m_usertype) {
		    System.out.println("마이페이지 회원 정보 - 수정페이지 실제 수정 매서드 실행됨!");
		    int count = 0;
		    try {
		    	 conn = com.DongGu.db.DongGuDB.getConn();

		        String sql_owner = "UPDATE owner SET o_nickname = ?, o_tel = ?, o_addr = ? WHERE o_id = ? ";
		        String sql_petsitter = "UPDATE petsitter SET p_smoke = ?, p_nickname = ?, p_tel = ?, p_addr = ?, p_img = ? WHERE p_id = ? ";

		        if (m_usertype == 0) {
			        ps = conn.prepareStatement(sql_owner);
	
			        // DTO에서 값을 가져와서 PreparedStatement에 설정
			        ps.setString(1, dto.getO_nickname());
			        ps.setString(2, dto.getO_tel());	 		      
			        ps.setString(3, dto.getO_addr());	 	
			        ps.setString(4, m_sid);	
	
			        // SQL 실행
			        count = ps.executeUpdate();
			        
			        // 확인용 출력 
			        System.out.println(count);

		        } else if (m_usertype == 1) {
		        	ps = conn.prepareStatement(sql_petsitter);
		        	
			        // DTO에서 값을 가져와서 PreparedStatement에 설정
		        	ps.setInt(1, dto.getP_smoke());
			        ps.setString(2, dto.getP_nickname());
			        ps.setString(3, dto.getP_tel());	 		      
			        ps.setString(4, dto.getP_addr());	 
			        ps.setString(5, dto.getP_img());	
			        ps.setString(6, m_sid);	
	
			        // SQL 실행
			        count = ps.executeUpdate();
			        
			        // 확인용 출력 
			        System.out.println(count);
		        }
		        return count;
		        
		    } catch (Exception e) {
		        e.printStackTrace();
		        return -1; // 오류 발생 시 -1 반환
		    } finally {
		        try {
		            if (ps != null) ps.close();
		            if (conn != null) conn.close();
		        } catch (Exception e2) {
		            e2.printStackTrace();
		        }
		    }
		}	 
	
	

	// 6-1. 마이페이지 회원 정보 페이지 - 회원등급 정보 뿌리기
	public MyPageDTO mypage_memberLevel(String m_sid, int m_usertype) {
	      System.out.println("마이페이지 회원 정보 페이지 - 회원등급 정보 뿌리기 매서드 실행됨!");         
	      MyPageDTO dto = null;

	      try {
	         conn = com.DongGu.db.DongGuDB.getConn();
	         String sql_owner = "SELECT g.g_img, g.g_name, NVL(next_grade.g_name, '다이아메달') AS nextlevel "
		         		+ "FROM owner o "
		         		+ "JOIN grade g ON o.g_num = g.g_num "
		         		+ "LEFT JOIN grade next_grade ON g.g_num  = next_grade.g_num + 1 "
		         		+ "WHERE o.o_id = ? ";
	         
	         String sql_petsitter = "SELECT g.g_img, g.g_name, NVL(next_grade.g_name, '다이아메달') AS nextlevel "
	         		+ "FROM petsitter p "
	         		+ "JOIN grade g ON p.g_num = g.g_num "
	         		+ "LEFT JOIN grade next_grade ON g.g_num  = next_grade.g_num + 1 "
	         		+ "WHERE p.p_id = ? ";
	         
	         
	         if (m_usertype == 0) {
			        ps = conn.prepareStatement(sql_owner);
	         } else if (m_usertype == 1) {
		        	ps = conn.prepareStatement(sql_petsitter);
	         }
	         ps.setString(1, m_sid);	         
	         
	         rs = ps.executeQuery();
	         while(rs.next()) {          
	                String g_img = rs.getString("g_img");
	                String g_name = rs.getString("g_name");             
	                String nextlevel = rs.getString("nextlevel");  
	                
	                dto = new MyPageDTO(g_img, g_name, nextlevel);
	                  
	             }

	         return dto;         
	         
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

	
	
	// 7-1. 마이페이지 매칭별 기능 (구직자 - 지원 취소)
	public int mypage_p_Ap_delete(String ap_num) {
		System.out.println("마이페이지 매칭별 기능 1 (구직자 - 지원 취소) 매서드 실행됨!");         

		      try {
		         conn = com.DongGu.db.DongGuDB.getConn();
		         String sql = "DELETE FROM application "
		         		+ "WHERE ap_num = ? ";
		         
		         ps=conn.prepareStatement(sql);
		         ps.setString(1, ap_num);	         
		         
		         int rs = ps.executeUpdate();

		         return rs;         
		         
		      }catch(Exception e) {
		         e.printStackTrace();
		         return -1;         
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
	
	
	// 7-2. 마이페이지 매칭별 기능 (고용자 - 초대 취소 1, 고용자 - 매칭 취소 1)
	public int mypage_o_Ap_delete1(String i_num) {
		System.out.println("마이페이지 매칭별 기능 (고용자 - 초대 취소 1, 고용자 - 매칭 취소1) 매서드 실행됨!");         

			   try {
			       conn = com.DongGu.db.DongGuDB.getConn();
			       String sql = "DELETE FROM application "
			         		+ "WHERE i_num = ? ";
			         
			         ps=conn.prepareStatement(sql);
			         ps.setString(1, i_num);	         
			         
			         int rs = ps.executeUpdate();
			         System.out.println(rs);
			         return rs;         
			         
			      }catch(Exception e) {
			         e.printStackTrace();
			         return -1;         
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
	
	
	
	// 7-3. 마이페이지 매칭별 기능 (고용자 - 초대 취소 2, 고용자 - 매칭 취소 2)
	public int mypage_o_Ap_delete2(String i_num) {
				System.out.println("마이페이지 매칭별 기능  (고용자 - 초대 취소 2, 고용자 - 매칭 취소 2) 매서드 실행됨!");         

				      try {
				         conn = com.DongGu.db.DongGuDB.getConn();
				         String sql = "DELETE FROM invitation "
				         		+ "WHERE i_num = ? ";
				         
				         ps=conn.prepareStatement(sql);
				         ps.setString(1, i_num);	         
				         
				         int rs = ps.executeUpdate();
				         System.out.println(rs);
				         return rs;         
				         
				      }catch(Exception e) {
				         e.printStackTrace();
				         return -1;         
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
		
		
	
		// 7-4. 마이페이지 매칭별 기능 (고용자 - 선택하기1)
		public int mypage_o_Ap_update2 (String ap_num) {
			System.out.println("마이페이지 매칭별 기능 (고용자 - 선택하기1) 매서드 실행됨!");         

					      try {
					         conn = com.DongGu.db.DongGuDB.getConn();
					         String sql = "UPDATE application SET m_num = 2 where ap_num = ? ";
					         
					         ps=conn.prepareStatement(sql);
					         ps.setString(1, ap_num);	         
					         
					         int rs = ps.executeUpdate();

					         return rs;         
					         
					      }catch(Exception e) {
					         e.printStackTrace();
					         return -1;         
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



		// 7-5. 마이페이지 매칭별 기능 (고용자 - 선택하기2)
		public int mypage_o_Iv_update2 (String i_num) {
					System.out.println("마이페이지 매칭별 기능 (고용자 - 선택하기2) 매서드 실행됨!");         

							      try {
							         conn = com.DongGu.db.DongGuDB.getConn();
							         String sql = "UPDATE invitation SET m_num = 2 where i_num = ? ";
							         
							         ps=conn.prepareStatement(sql);
							         ps.setString(1, i_num);	         
							         
							         int rs = ps.executeUpdate();

							         return rs;         
							         
							      }catch(Exception e) {
							         e.printStackTrace();
							         return -1;         
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

		
		
		// 7-6. 마이페이지 매칭별 기능 (구직자 - 매칭 수락1)
		public int mypage_Ap_update3 (String ap_num) {
			System.out.println("마이페이지 매칭별 기능 3 (구직자 - 매칭수락) 매서드 실행됨!");         

					      try {
					         conn = com.DongGu.db.DongGuDB.getConn();
					         String sql = "UPDATE application SET m_num = 3 where ap_num = ? ";
					         
					         ps=conn.prepareStatement(sql);
					         ps.setString(1, ap_num);	         
					         
					         int rs = ps.executeUpdate();

					         return rs;         
					         
					      }catch(Exception e) {
					         e.printStackTrace();
					         return -1;         
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


		
		
		// 7-7. 마이페이지 매칭별 기능 (구직자 - 매칭 수락2)
		public int mypage_Iv_update3 (String i_num) {
			System.out.println("마이페이지 매칭별 기능 4 (구직자 - 매칭수락) 매서드 실행됨!");         

						      try {
						         conn = com.DongGu.db.DongGuDB.getConn();
						         String sql = "UPDATE invitation SET m_num = 3 where i_num = ? ";
						         
						         ps=conn.prepareStatement(sql);
						         ps.setString(1, i_num);	         
						         
						         int rs = ps.executeUpdate();

						         return rs;         
						         
						      }catch(Exception e) {
						         e.printStackTrace();
						         return -1;         
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
		
		

		// 7-8. 마이페이지 매칭별 기능 (구직자 - 매칭 수락 3)
		public int mypage_p_Ap_delete2(String i_num) {
					System.out.println("마이페이지 매칭별 기능 (구직자 - 매칭 수락 3) 매서드 실행됨!");         

					      try {
					         conn = com.DongGu.db.DongGuDB.getConn();
					         String sql = "DELETE FROM application "
					         		+ "WHERE i_num = ? and m_num = 1";
					         
					         ps=conn.prepareStatement(sql);
					         ps.setString(1, i_num);	         
					         
					         int rs = ps.executeUpdate();
					         System.out.println(rs);
					         return rs;         
					         
					      }catch(Exception e) {
					         e.printStackTrace();
					         return -1;         
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
		
		
		
	// 7-9. 마이페이지 매칭별 기능 (구직자 - 매칭거절 1)
	public int mypage_Ap_delete(String ap_num) {
		System.out.println("마이페이지 매칭별 기능 (구직자 - 매칭거절 1) 매서드 실행됨!");         

			      try {
			         conn = com.DongGu.db.DongGuDB.getConn();
			         String sql = "DELETE FROM application "
			         		+ "WHERE ap_num = ? ";
			         
			         ps=conn.prepareStatement(sql);
			         ps.setString(1, ap_num);	         
			         
			         int rs = ps.executeUpdate();

			         return rs;         
			         
			      }catch(Exception e) {
			         e.printStackTrace();
			         return -1;         
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

	
	
	// 7-10. 마이페이지 매칭별 기능 (구직자 - 매칭 거절 2)
			public int mypage_Iv_update1 (String i_num) {
				System.out.println("마이페이지 매칭별 기능 (구직자 - 매칭 거절 2) 매서드 실행됨!");         

							      try {
							         conn = com.DongGu.db.DongGuDB.getConn();
							         String sql = "UPDATE invitation SET m_num = 1 where i_num = ? ";
							         
							         ps=conn.prepareStatement(sql);
							         ps.setString(1, i_num);	         
							         
							         int rs = ps.executeUpdate();

							         return rs;         
							         
							      }catch(Exception e) {
							         e.printStackTrace();
							         return -1;         
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

			

			// 7-11. 마이페이지 매칭별 기능 (구직자 - 케어완료 1)
			public int mypage_Ap_update4 (String ap_num) {
				System.out.println("마이페이지 매칭별 기능 (고용자 - 선택하기1) 매서드 실행됨!");         

						      try {
						         conn = com.DongGu.db.DongGuDB.getConn();
						         String sql = "UPDATE application SET m_num = 4 where ap_num = ? ";
						         
						         ps=conn.prepareStatement(sql);
						         ps.setString(1, ap_num);	         
						         
						         int rs = ps.executeUpdate();

						         return rs;         
						         
						      }catch(Exception e) {
						         e.printStackTrace();
						         return -1;         
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



			// 7-12. 마이페이지 매칭별 기능 (구직자 - 케어완료 2)
			public int mypage_Iv_update4 (String i_num) {
						System.out.println("마이페이지 매칭별 기능 (고용자 - 선택하기2) 매서드 실행됨!");         

								      try {
								         conn = com.DongGu.db.DongGuDB.getConn();
								         String sql = "UPDATE invitation SET m_num = 4 where i_num = ? ";
								         
								         ps=conn.prepareStatement(sql);
								         ps.setString(1, i_num);	         
								         
								         int rs = ps.executeUpdate();

								         return rs;         
								         
								      }catch(Exception e) {
								         e.printStackTrace();
								         return -1;         
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



			// 7-13. 마이페이지 매칭별 기능 (구직자 - 후기작성)
			public String mypage_p_review (String i_num) {
				System.out.println("마이페이지 매칭별 기능 (구직자 - 후기작성) 매서드 실행됨!");         
				String o_id = "";
				
				try {
			         conn = com.DongGu.db.DongGuDB.getConn();
			         String sql = "SELECT o.o_id "
			         		+ "FROM owner o "
			         		+ "JOIN animalinfo ai ON o. o_id = ai.o_id "
			         		+ "JOIN invitation i ON ai.ai_num = i.ai_num "
			         		+ "WHERE i.i_num = ? ";
			         
			         ps=conn.prepareStatement(sql);	    
			         ps.setString(1, i_num);
			         
			         rs = ps.executeQuery();
			         while(rs.next()) {          
			        	    o_id = rs.getString("o_id");
			         }

			         return o_id;
			         
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
			
			
			// 7-14. 마이페이지 매칭별 기능 (구직자 - 내지원서)
			public String mypage_p_LookApply (String ap_num) {
				System.out.println("마이페이지 매칭별 기능 (구직자 - 후기작성) 매서드 실행됨!");         
				String p_id = "";
							
					try {
						conn = com.DongGu.db.DongGuDB.getConn();
						String sql = "SELECT p.p_id "
								+ "FROM application ap "
								+ "JOIN invitation i ON i.i_num = ap.i_num "
								+ "JOIN petsitter p ON ap.p_id = p.p_id "
								+ "WHERE ap.ap_num = ? ";
						         
						ps=conn.prepareStatement(sql);	    
						ps.setString(1, ap_num);
						         
						rs = ps.executeQuery();
						while(rs.next()) {          
						      p_id = rs.getString("p_id");
						 }

						return p_id;
						         
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
			
			// 7-15. 마이페이지 매칭별 기능 (고용자 - 후기작성)
						public String mypage_o_review (String i_num) {
							System.out.println("마이페이지 매칭별 기능 (구직자 - 후기작성) 매서드 실행됨!");         
							String p_id = "";
							
							try {
						         conn = com.DongGu.db.DongGuDB.getConn();
						         String sql = "SELECT p.p_id "
						         		+ "FROM application ap "
						         		+ "JOIN invitation i on i.i_num = ap.i_num "
						         		+ "JOIN petsitter p on ap.p_id = p.p_id "
						         		+ "WHERE i.i_num = ? ";
						         
						         ps=conn.prepareStatement(sql);	    
						         ps.setString(1, i_num);
						         
						         rs = ps.executeQuery();
						         while(rs.next()) {          
						        	    p_id = rs.getString("p_id");
						         }

						         return p_id;
						         
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
						
						
		// 7-16. 마이페이지 매칭별 기능 (고용자 - 결제 요청)
		public MyPageDTO mypage_o_pay (String i_num) {
			System.out.println("마이페이지 매칭별 기능 (고용자 - 결제 요청) 매서드 실행됨!");         
			 MyPageDTO dto = null;
							
			try {
				conn = com.DongGu.db.DongGuDB.getConn();
				 String sql = "SELECT p.p_date, p.p_name, p.p_bank_name,p.p_bank_num "
				 		+ "FROM application ap "
				 		+ "JOIN invitation i on i.i_num = ap.i_num "
				 		+ "JOIN petsitter p on ap.p_id = p.p_id "
				 		+ "WHERE i.i_num = ? ";
						         
						ps=conn.prepareStatement(sql);	    
						ps.setString(1, i_num);
						         
						rs = ps.executeQuery();
						while(rs.next()) {          
							 Date p_date = rs.getDate("p_date");
							 String p_name = rs.getString("p_name");
						     String p_bank_name = rs.getString("p_bank_name");
						     String p_bank_num = rs.getString("p_bank_num");
						     
						     dto = new MyPageDTO(p_date,p_name, p_bank_name,p_bank_num);
						     }

						    return dto;
						         
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
						
	// 8-1. 마이페이지 지원현황 페이지 - 해당 초대장에 지원한 지원서 목록 가져오기 
	public ArrayList<MyPageDTO> mypage_InviteList(int i_num) {
		      System.out.println("마이페이지 지원현황 - 해당 초대장에 지원한 지원서 목록 가져오는 매서드 실행됨!");         
		      MyPageDTO dto = null;
		      ArrayList<MyPageDTO> mlist = new ArrayList<>();
		      try {
		         conn = com.DongGu.db.DongGuDB.getConn();
		         String sql = "SELECT p.p_id,ap.ap_num,p.p_name,g.g_name, g.g_price "
		         		+ "FROM petsitter p "
		         		+ "JOIN grade g ON p.g_num = g.g_num "
		         		+ "JOIN application ap ON p.p_id = ap.p_id "
		         		+ "JOIN invitation i ON ap.i_num = i.i_num "
		         		+ "WHERE i.i_num = ? "
		         		+ "ORDER BY g.g_price desc";
		         
		         ps=conn.prepareStatement(sql);
		         ps.setInt(1, i_num);	      	         
		         
		         rs = ps.executeQuery();
		         
		         while(rs.next()) {         
		        	 	String p_id = rs.getString("p_id");  
		        	 	int ap_num = rs.getInt("ap_num");  
		                String g_name = rs.getString("g_name");             
		                int g_price = rs.getInt("g_price");  
		                String p_name = rs.getString("p_name");  
		                
		                dto = new MyPageDTO(i_num,p_id,ap_num,g_name, g_price,p_name);
		                mlist.add(dto);
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
	
	
	
	// 7-17. 마이페이지 매칭별 기능 (고용자 - 후기보기)
	public String mypage_o_Lookreview (String m_sid,String ap_num) {
		System.out.println("마이페이지 매칭별 기능 (고용자 - 후기보기) 매서드 실행됨!");        
		
		String r_num = "";
		try {
	         conn = com.DongGu.db.DongGuDB.getConn();
	         String sql = "SELECT r.r_num "
	         		+ "FROM review r  "
	         		+ "WHERE r.r_write_id = ? and r.r_receive_id "
	         		+ "= ( SELECT p.p_id FROM application ap JOIN petsitter p ON ap.p_id=p.p_id WHERE ap.ap_num = ?)";
	         
	         ps=conn.prepareStatement(sql);	    
	         ps.setString(1, m_sid);
	         ps.setString(2, ap_num);
	         
	         rs = ps.executeQuery();
	         while(rs.next()) {          
	        	 r_num = rs.getString("r_num");
	         }

	         return r_num;
	         
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
	
	
	
	// 7-18. 마이페이지 매칭별 기능 (구직자 - 후기보기)
		public String mypage_p_Lookreview (String m_sid,String i_num) {
			System.out.println("마이페이지 매칭별 기능 (고용자 - 후기보기) 매서드 실행됨!");        
			
			String r_num = "";
			try {
		         conn = com.DongGu.db.DongGuDB.getConn();
		         String sql = "SELECT r.r_num "
		         		+ "FROM review r "
		         		+ "WHERE r.r_write_id = ? and r.r_receive_id  "
		         		+ "= ( SELECT o.o_id "
		         		+ "FROM owner o "
		         		+ "JOIN animalinfo ai ON o. o_id = ai.o_id "
		         		+ "JOIN invitation i ON ai.ai_num = i.ai_num "
		         		+ "WHERE i.i_num = ? ) ";
		         
		         ps=conn.prepareStatement(sql);	    
		         ps.setString(1, m_sid);
		         ps.setString(2, i_num);
		         
		         rs = ps.executeQuery();
		         while(rs.next()) {          
		        	 r_num = rs.getString("r_num");
		         }

		         return r_num;
		         
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
	
	// 8-1. 마이페이지 지원현황 페이지 - 해당 초대장 제목 가져오기 
	public String mypage_InviteList_i_title(int i_num) {
			      System.out.println("마이페이지 지원현황 - 해당 초대장 제목 가져오는 매서드 실행됨!");         
			      String i_title = ""; 
			      try {
			         conn = com.DongGu.db.DongGuDB.getConn();
			         String sql = "SELECT i_title "
			         		+ "FROM invitation "			         		
			         		+ "WHERE i_num = ? ";
			         
			         ps=conn.prepareStatement(sql);
			         ps.setInt(1, i_num);	      	         
			         
			         rs = ps.executeQuery();
			         
			         while(rs.next()) {         
			        	 	i_title = rs.getString("i_title");  		              
			             }
			                        
			         return i_title;          
			            
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

	
	// 8-2. 마이페이지 지원현황 페이지 - 해당 초대장에 지원한 지원서 정보 가져오기 
	   public MyPageDTO mypage_ApplyLook(String p_id, int i_num) {
		   	  System.out.println("마이페이지 지원현황 - 해당 초대장에 지원한 지원서 정보 가져오는 매서드 실행됨!");   
		      MyPageDTO dto = null;

		      try {
		         conn = com.DongGu.db.DongGuDB.getConn();
		         String sql = "SELECT p.p_name,p.p_jumin, p.p_tel, p.p_addr, p.p_img, "
		         		+ "NVL(p.p_ex_my, '없음') AS p_ex_my, NVL(p.p_ex_other, '없음') AS p_ex_other, "
		         		+ "NVL(p.p_ex_etc, '없음') AS p_ex_etc, NVL(ap.ap_content, '없음') AS ap_content "
		         		+ "FROM petsitter p JOIN application ap ON p.p_id = ap.p_id "
		         		+ "WHERE p.p_id = ? and i_num = ? ";
		         
		         ps=conn.prepareStatement(sql);
		         ps.setString(1, p_id);	    
		         ps.setInt(2, i_num);
		         
		         rs = ps.executeQuery();
		         while(rs.next()) {          
		        	    String p_name = rs.getString("p_name");
		                String p_jumin = rs.getString("p_jumin");	                
		                String p_tel = rs.getString("p_tel");
		                String p_addr = rs.getString("p_addr");
		                String p_img = rs.getString("p_img");
		                String p_ex_my = rs.getString("p_ex_my");
		                String p_ex_other = rs.getString("p_ex_other");
		                String p_ex_etc = rs.getString("p_ex_etc");
		                String ap_content = rs.getString("ap_content");
		                	                                 
		                dto = new MyPageDTO(p_name,p_jumin,p_tel,p_addr,p_img,p_ex_my,p_ex_other,p_ex_etc,ap_content);
		             }

		         return dto;	         
		         
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
	  ////////////////////지현////////////////////////
	   // 마이페이지 고용자 (이름 생년월일 고용자평점 번호 주소 사진)
	   public MyPageDTO mypage_memberDetailOwner(String m_sid) {     
	         MyPageDTO dto = new MyPageDTO();

	         try {
	            conn = com.DongGu.db.DongGuDB.getConn();
	            String sql = "SELECT  "
	                  + "    o.o_jumin AS o_jumin, "
	                  + "    o.o_tel AS o_tel, "
	                  + "    o.o_addr AS o_addr, "
	                  + "    o.o_name AS o_name, "
	                  + "    NVL((SELECT ROUND(AVG(r.r_star), 1) FROM review r WHERE r.r_receive_id = o.o_id), 0) AS avg_star, "
	                  + "    (SELECT COUNT(*) FROM review r WHERE r.r_receive_id = o.o_id) AS review_count "
	                  + "FROM  "
	                  + "    owner o "
	                  + "LEFT JOIN  "
	                  + "    review r ON o.o_id = r.r_receive_id "
	                  + "WHERE  "
	                  + "    o.o_id = ? ";
	            
	            
	            ps=conn.prepareStatement(sql);
	            ps.setString(1, m_sid);                     
	            
	            rs = ps.executeQuery();
	            while(rs.next()) {          
	                   String p_jumin = rs.getString("o_jumin");                   
	                   String o_tel = rs.getString("o_tel");
	                   String o_addr = rs.getString("o_addr");
	                   String o_name = rs.getString("o_name");
	                   Double avg_star = rs.getDouble("avg_star");
	                   int reviewcount = rs.getInt("review_count");
	                                                       
	                   dto.setP_jumin(p_jumin);
	                   dto.setP_tel(o_tel);
	                   dto.setP_addr(o_addr);
	                   dto.setP_name(o_name);
	                   dto.setStarcount(avg_star);
	                   dto.setReviewcount(reviewcount);
	                }

	            return dto;            
	            
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
	   
	   
	   // 마이페이지 구직자(이름 생년월일 고용자평점 번호 주소 사진)
	   public MyPageDTO mypage_memberDetailPet(String m_sid) {      
	         MyPageDTO dto =new MyPageDTO();

	         try {
	            conn = com.DongGu.db.DongGuDB.getConn();
	            String sql = "SELECT  "
	                  + "    p.p_jumin AS p_jumin, "
	                  + "    p.p_tel AS p_tel, "
	                  + "    p.p_addr AS p_addr, "
	                  + "    p.p_name AS p_name, "
	                  + "    NVL((SELECT ROUND(AVG(r.r_star), 1) FROM review r WHERE r.r_receive_id = p.p_id), 0) AS avg_star, "
	                  + "    p.p_img AS p_img, "
	                  + "    (SELECT COUNT(*) FROM review r WHERE r.r_receive_id = p.p_id) AS review_count "
	                  + "FROM  "
	                  + "    petsitter p "
	                  + "LEFT JOIN  "
	                  + "    review r ON p.p_id = r.r_receive_id "
	                  + "WHERE  "
	                  + "    p.p_id = ? ";
	            
	            ps=conn.prepareStatement(sql);
	            ps.setString(1, m_sid);                    
	            
	            rs = ps.executeQuery();
	            while(rs.next()) {          
	               String p_jumin = rs.getString("p_jumin");                   
	                   String p_tel = rs.getString("p_tel");
	                   String p_addr = rs.getString("p_addr");
	                   String p_name = rs.getString("p_name");
	                   Double avg_star = rs.getDouble("avg_star");
	                   String p_img = rs.getString("p_img");
	                   int reviewcount = rs.getInt("review_count");
	                                                       
	                   dto.setP_jumin(p_jumin);
	                   dto.setP_tel(p_tel);
	                   dto.setP_addr(p_addr);
	                   dto.setP_name(p_name);
	                   dto.setStarcount(avg_star);
	                   dto.setP_img(p_img);
	                   dto.setReviewcount(reviewcount);
	                   
	                  }

	            return dto;            
	            
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
	   
	   
	   /* 해당 회원에 위시리스트 체크 했는지*/
	   public int isWishList(String review_id,String sid,String id_check) {
	      try {
	         // m_sid = jihyeon314 , review_id = keria
	         conn=com.DongGu.db.DongGuDB.getConn();
	         String sql="select count(*) from wishlist "
	               + "where wt_num_value=? and w_id=? and wt_num=?";
	         ps =conn.prepareStatement(sql);
	         
	         
	         ps.setString(1, review_id);
	         ps.setString(2, sid);
	         
	         //고용자인경우
	         if(id_check.equals("0")) {
	            ps.setInt(3, 20);
	         }
	         //구직자의 경우
	         else if(id_check.equals("1")){
	            ps.setInt(3, 10);
	         }
	         
	         rs = ps.executeQuery();
	         
	         int result=0;
	         if(rs.next()) {
	            result = rs.getInt(1);
	         }
	         return result;
	      }catch(Exception e) {
	         e.printStackTrace();
	         return -1;
	      }finally {
	         try {
	            rs.close();
	            ps.close();
	            conn.close();
	         }catch (Exception e) {
	            e.printStackTrace();
	         }
	      }
	   }
	   
	   
	   /* 위시리스트 추가 또는 삭제*/
	   public int changeWishStatus(String review_id,String m_sid,String id_check) {
	      
	      try {
	         conn = com.DongGu.db.DongGuDB.getConn();
	         String sql="select count(*) from wishlist "
	               + "where w_id=? and wt_num=? and wt_num_value=?";
	         ps = conn.prepareStatement(sql);
	         ps.setString(1, m_sid);
	         
	         //고용자인경우
	         if(id_check.equals("0")) {
	            ps.setInt(2, 20);
	         }
	         //구직자의 경우
	         else if(id_check.equals("1")){
	            ps.setInt(2, 10);
	         }
	         ps.setString(3,review_id);
	         
	         rs = ps.executeQuery();
	         int isEx=0;
	         if(rs.next()) {
	            isEx = rs.getInt(1);
	         }
	         
	         
	         //위시리스트에 있으면 지우기
	         if(isEx>=1) {
	            sql = "delete from wishlist where w_id=? and wt_num=? and wt_num_value=?";
	            ps = conn.prepareStatement(sql);
	            
	            
	            ps.setString(1, m_sid);
	            
	            //고용자인경우
	            if(id_check.equals("0")) {
	               ps.setInt(2, 20);
	            }
	            //구직자의 경우
	            else if(id_check.equals("1")){
	               ps.setInt(2, 10);
	            }
	            
	            ps.setString(3, review_id );
	         }
	         //위시리스트에 없으면 추가
	         else if(isEx==0) {
	            //reviewid = 케리아, sid=지현
	            sql =" insert into wishlist values(seq_wishlist_w_num.nextval, ?, ?, ?,?)";
	            
	            // m_sid = jihyeon314 , review_id = keria

	                  
	            ps = conn.prepareStatement(sql);
	            ps.setString(1, m_sid);
	            ps.setInt(2, Integer.parseInt(id_check));
	            //고용자인경우
	            if(id_check.equals("0")) {
	               ps.setInt(3, 20);
	            }
	            //구직자의 경우
	            else if(id_check.equals("1")){
	               ps.setInt(3, 10);
	            }
	            
	            ps.setString(4, review_id);
	            
	         }
	         
	         int result = ps.executeUpdate();
	         return result;
	         
	      }catch(Exception e) {
	         e.printStackTrace();
	         return -1;
	      }finally {
	         try {
	            rs.close();
	            ps.close();
	            conn.close();
	         }catch(Exception e) {
	            e.printStackTrace();
	         }
	      }
	   }

	   
	   
	   
	
	   
}
