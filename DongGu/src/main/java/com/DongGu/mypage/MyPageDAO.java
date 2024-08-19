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
   public ArrayList<MyPageDTO> mypage_Like1(String m_sid, String likeValue, int usertype) {
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
	         
	         String sql40_owner = "select f.f_img, f.f_title,f.f_date, f.f_nickname, "
	         		+ "(SELECT o.o_name FROM owner o WHERE o.o_id = f.f_id) AS o_name, "
	         		+ "(SELECT w.w_num FROM wishlist w WHERE w.w_id = ? AND w.wt_num = ? AND w.wt_num_value = f.f_num ) AS w_num, "
	         		+ "(SELECT w.wt_num_value FROM wishlist w WHERE w.w_id = ? AND w.wt_num = ? AND w.wt_num_value = f.f_num ) AS wt_num_value "
	         		+ "from free f 	"
	         		+ "where f.f_num IN (select w.wt_num_value "
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
				 
				 if (usertype == 0) {
					 
					 ps=conn.prepareStatement(sql40_owner);
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
			                int w_num = rs.getInt("w_num");
			                String wt_num_value = rs.getString("wt_num_value");
			                	                                 
			                dto = new MyPageDTO(f_img,f_title,f_date,f_nickname,o_name,w_num,wt_num_value);
			                mlist.add(dto);
			             }
			         
				}else if (usertype == 1) {
					
				} 
				 
				
		         
			 }else if ("50".equals(likeValue)) {
				 
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

	        String sql = "DELETE FROM wishlist WHERE w_num = ?";
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
	
	
	
	
   
   
}
