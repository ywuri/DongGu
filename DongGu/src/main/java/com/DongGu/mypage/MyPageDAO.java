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
   public MyPageDTO mypage_section1(String m_sid) {
      System.out.println("마이페이지 메인 - section 1 매서드 실행됨!");         
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
   
   
   
   
   // 1-2. 마이페이지 메인페이지 - section 2
   public ArrayList<MyPageDTO> mypage_section2(String m_sid) {
      System.out.println("마이페이지 메인 - section 2 매서드 실행됨!");         
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
         		+ "ORDER BY ap.ap_num desc "
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
   
   
   
     
   // 2-1. 마이페이지 지원내역 페이지 - 특정 페이지에 해당하는 목록 가져오기 
   public ArrayList<MyPageDTO> mypage_applyList1(String m_sid,int cp,int listSize) {
      System.out.println("마이페이지 지원내역 - 특정 페이지에 해당하는 목록 가져오는 매서드 실행됨!");         
      MyPageDTO dto = null;

      try {
         conn = com.DongGu.db.DongGuDB.getConn();
         String sql = "SELECT * "
         		+ "FROM (SELECT ROWNUM rnum, a.* "
         		+ "FROM ( "       		 
         		+ "SELECT a.a_num,ai.ai_img, ai.an_num_link, ms.m_name,i.i_title,i.i_start, i.i_end "
         		+ "FROM invitation i "
         		+ "JOIN animalinfo ai ON i.ai_num = ai.ai_num "
         		+ "JOIN animaltype at ON ai.at_num = at.at_num "
         		+ "JOIN animal a ON at.a_num = a.a_num "
         		+ "JOIN application ap ON i.i_id = ap.i_id "
         		+ "JOIN matchingstate ms ON ms.m_num = ap.m_num "
         		+ "WHERE ap.p_id = ? "
         		+ "ORDER BY ap.ap_num desc ) a"
         		+ ") b "
         		+ "WHERE rnum BETWEEN ? AND ? ";
         
         int start = (cp - 1) * listSize + 1;
         int end = cp * listSize;
 
         
         ps=conn.prepareStatement(sql);
         ps.setString(1, m_sid);
         ps.setInt(2, start);
		 ps.setInt(3, end);

            
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
   
   
   
   // 2-2. 마이페이지 지원내역 페이지 - 페이징 메서드(전체 게시글 카운트)
   public int getTotal(String m_sid) {
      System.out.println("마이페이지 지원내역 - 페이징 메서드(전체 게시글 카운트) 실행됨!");         
      		
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			
			String sql = "SELECT count(*) "
					+ "FROM application "
					+ "WHERE p_id = ? ";
			
			ps=conn.prepareStatement(sql);
	        ps.setString(1, m_sid);
			
			rs = ps.executeQuery();
			int result = 0;			
			if(rs.next()) {
				result = rs.getInt(1);
			}		
			
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
	         		+ "(SELECT COUNT(i.i_id) FROM invitation i JOIN animalinfo ai ON ai.ai_num = i.ai_num WHERE ai.o_id = o.o_id) AS invitationcount, "
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
	         		+ "(SELECT w.w_num FROM wishlist w WHERE w.w_id = ? AND w.wt_num = ? AND w.wt_num_value = i.i_id ) AS w_num, "
	         		+ "(SELECT w.wt_num_value FROM wishlist w WHERE w.w_id = ? AND w.wt_num = ? AND w.wt_num_value = i.i_id ) AS wt_num_value "
	         		+ "from invitation i "
	         		+ "JOIN animalinfo ai on i.ai_num = ai.ai_num "
	         		+ "JOIN owner o on ai.o_id = o.o_id "
	         		+ "where i.i_id IN (select wt_num_value "
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
	
	// 5-4. 마이페이지 회원 정보 수정페이지 - 이미지명 변경을 위해 sequnce번호 가져오기 
	public int getSequnceNumForImg() {
		try {
			conn =com.DongGu.db.DongGuDB.getConn();
			String sql="SELECT petsitter_img_SEQ.NEXTVAL FROM dual";
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int result=0;
			if(rs.next()) {
				result=rs.getInt(1);
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
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
   
}
