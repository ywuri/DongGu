package com.DongGu.friend;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.time.format.*;
import java.time.*;
import java.time.LocalDate;
import java.time.Period;

import com.DongGu.animal.animalnatureDTO;
import com.DongGu.member.memberDTO;

public class InviteDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public InviteDAO() {
	}
	
	/* ======================지현 시작 ==========================*/
	
	/* 총 게시물 갯수 가져오기*/
	public int getInviteCnt() {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql="select count(*) from invitation";
			ps =conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int result=0;
			
			if(rs.next()) { 
				result=rs.getInt(1);
			}
			
			//System.out.println(result);
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	
	/* 검색결과 게시물 갯수 가져오기*/
	public int getInviteCnt(String search_type,String search_word) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql="";
			
			if("i_title".equals(search_type)) {
				sql="select count(*) "
						+ "    from invitation  "
						+ "    where i_title like ? "
						;
			
			}else if("o_nickname".equals(search_type)) {
				sql="select count(*) "
						+ "    from invitation i, animalinfo a,owner o  "
						+ "    where i.ai_num = a.ai_num "
						+ "    and o.o_id = a.o_id and  o.o_nickname like ?  "
						; 
			}
			
			ps =conn.prepareStatement(sql);
			ps.setString(1, "%"+search_word+"%");
			rs = ps.executeQuery();
			int result=0;
			
			if(rs.next()) { 
				result=rs.getInt(1);
			}
			
			
			//System.out.println(result);
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	/* 글목록 가져오기 */
	public ArrayList<InviteDTO> getInviteList(int cp,int listSize,int int_dongNang){
		try {
			conn=com.DongGu.db.DongGuDB.getConn();

			String sql ="select *  "
					+ "from  "
					+ "(select rownum as rnum, a.* from  "
					+ "    (  "
					+ "        SELECT  "
					+ "            i.i_num as i_num,  "
					+ "            at.a_num as str_dongNang,  "
					+ "            i.i_title as i_title,  "
					+ "            o.o_nickname as o_nickname,  "
					+ "            i.i_date as i_date ,  "
					+ "            COUNT(a.i_num) AS doCnt,"
					+ "			   o.o_id as o_id "
					+ "        FROM  "
					+ "            invitation i "
					+ "            JOIN animalinfo ai ON i.ai_num = ai.ai_num "
					+ "            JOIN animaltype at ON ai.at_num = at.at_num "
					+ "            JOIN owner o ON o.o_id = ai.o_id "
					+ "            LEFT JOIN application a ON i.i_num = a.i_num ";
				
			
			if (int_dongNang != 0) {
	            sql += " WHERE at.a_num = ? ";
	        }
			
			sql+="        GROUP BY  "
					+ "            i.i_num,  "
					+ "            at.a_num,  "
					+ "            i.i_title,  "
					+ "            o.o_nickname,  "
					+ "            i.i_date, "
					+ "			   o.o_id"
					+ "        order by i_num desc  "
					+ "    )a  "
					+ ")b  "
					+ "where rnum >= ? and rnum <=?";
					
					
			ps=conn.prepareStatement(sql);
			
			
			if(int_dongNang==0) {
				ps.setInt(1, cp*listSize-(listSize-1));
				ps.setInt(2, cp*listSize);
			}else if(int_dongNang==1) {
				ps.setInt(1, 1);
				ps.setInt(2, cp*listSize-(listSize-1));
				ps.setInt(3, cp*listSize);
			}else if(int_dongNang==2) {
				ps.setInt(1, 2);
				ps.setInt(2, cp*listSize-(listSize-1));
				ps.setInt(3, cp*listSize);
			}else if(int_dongNang==3) {
				ps.setInt(1, 3);
				ps.setInt(2, cp*listSize-(listSize-1));
				ps.setInt(3, cp*listSize);
			}
					
			
			ArrayList<InviteDTO> array = new ArrayList<>();
			rs = ps.executeQuery();
			
			while(rs.next()) {
				InviteDTO dto = new InviteDTO();
				
				int dongNang = rs.getInt("str_dongNang");
				
				if(dongNang==1) {
					dto.setDongNang("멍구");
				}
				else if(dongNang==2) {
					dto.setDongNang("냥구");
				}else {
					dto.setDongNang("칭구");
				}
				
				dto.setI_num(rs.getInt("i_num"));
				dto.setI_title(rs.getString("i_title"));
				dto.setO_nickname(rs.getString("o_nickname"));
				dto.setDoCnt(rs.getInt("doCnt"));
				dto.setI_date(rs.getString("i_date"));
				dto.setO_id(rs.getString("o_id"));
				
				array.add(dto);
		
			}
			return array;
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
	}
	

	
	/* 검색하기 */
	public ArrayList<InviteDTO> searchInvite(String search_type,String search_word,int cp,int listSize){
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql="";
			if("i_title".equals(search_type)) {
				sql="select *  "
						+ "from  "
						+ "(select rownum as rnum, c.* from   "
						+ "(  "
						+ "    SELECT  "
						+ "    i.i_num as i_num,  "
						+ "    at.a_num as str_dongNang,  "
						+ "    i.i_title as i_title,  "
						+ "    o.o_nickname as o_nickname,  "
						+ "    i.i_date as i_date ,  "
						+ "    COUNT(a.i_num) AS doCnt"
						+ "	   ,o.o_id as o_id "
						+ "    FROM  "
						+ "        invitation i  "
						+ "        JOIN animalinfo ai ON i.ai_num = ai.ai_num  "
						+ "        JOIN animaltype at ON ai.at_num = at.at_num "
						+ "        JOIN owner o ON o.o_id = ai.o_id "
						+ "        LEFT JOIN application a ON i.i_num = a.i_num "
						+ "    where i.i_title like ?    "
						+ "         "
						+ "    GROUP BY  "
						+ "        i.i_num,  "
						+ "        at.a_num,  "
						+ "        i.i_title,  "
						+ "        o.o_nickname,  "
						+ "        i.i_date,"
						+ "		   o.o_id "
						+ "    order by i_num desc )c   "
						+ ")b "
						+ "where rnum >=? and rnum <=?";
				
			}else if("o_nickname".equals(search_type)) {
				sql="select *  "
						+ "from  "
						+ "(select rownum as rnum, c.* from   "
						+ "(  "
						+ "    SELECT  "
						+ "    i.i_num as i_num,  "
						+ "    at.a_num as str_dongNang,  "
						+ "    i.i_title as i_title,  "
						+ "    o.o_nickname as o_nickname,  "
						+ "    i.i_date as i_date ,  "
						+ "    COUNT(a.i_num) AS doCnt,"
						+ "	   o.o_id as o_id "
						+ "    FROM  "
						+ "        invitation i  "
						+ "        JOIN animalinfo ai ON i.ai_num = ai.ai_num  "
						+ "        JOIN animaltype at ON ai.at_num = at.at_num "
						+ "        JOIN owner o ON o.o_id = ai.o_id "
						+ "        LEFT JOIN application a ON i.i_num = a.i_num "
						+ "    where o.o_nickname like ?    "
						+ "         "
						+ "    GROUP BY  "
						+ "        i.i_num,  "
						+ "        at.a_num,  "
						+ "        i.i_title,  "
						+ "        o.o_nickname,  "
						+ "        i.i_date,"
						+ "        o.o_id "
						+ "    order by i_num desc )c   "
						+ ")b "
						+ "where rnum >=? and rnum <=?";
			}
			ps =conn.prepareStatement(sql);
			ps.setString(1, "%"+search_word+"%");
			
			ps.setInt(2, cp*listSize-(listSize-1));
			ps.setInt(3, cp*listSize);
			
			//System.out.println("search_type" +search_type);
			//System.out.println("search_word" +search_word);
			
			ArrayList<InviteDTO>array = new ArrayList<>();
			rs=ps.executeQuery();
			
			while(rs.next()) {
				InviteDTO dto = new InviteDTO();
				
				int dongNang = rs.getInt("str_dongNang");
				
				if(dongNang==1) {
					dto.setDongNang("멍구");
				}
				else if(dongNang==2) {
					dto.setDongNang("냥구");
				}else {
					dto.setDongNang("칭구");
				}
				
				dto.setI_num(rs.getInt("i_num"));
				dto.setI_title(rs.getString("i_title"));
				dto.setO_nickname(rs.getString("o_nickname"));
				dto.setDoCnt(rs.getInt("doCnt"));
				dto.setI_date(rs.getString("i_date"));
				dto.setO_id(rs.getString("o_id"));
				
				
				array.add(dto);
			}
		
			return array;
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/* 동구 상세보기 */
	public InviteDTO getDongGuDetail(int i_num) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			
			ArrayList<animalnatureDTO> array=getNatureList();
			
			String sql=" SELECT  "
					+ "    i.i_num as i_num, i.i_title as i_title, i.i_start as i_start, i.i_end as i_end, i.i_content as i_content, "
					+ "    ai.ai_img as ai_img, ai.ai_birth as age, ai.an_num_link as nature, ai.ai_alergy as ai_alergy,ai.ai_disease as ai_disease, "
					+ "    ai.ai_caution as ai_caution, ai.ai_name as ai_name, "
					+ "    at.a_num as a_num, at.at_name as at_name, "
					+ "    o.o_nickname as o_nickname, o.o_addr as o_addr, o.o_id as o_id,"
					+ "    COUNT(a.i_num) AS doCnt  "
					+ " "
					+ "FROM  "
					+ "    invitation i "
					+ "    JOIN animalinfo ai ON ai.ai_num = i.ai_num "
					+ "    JOIN animaltype at ON ai.at_num = at.at_num "
					+ "    JOIN owner o ON o.o_id = ai.o_id "
					+ "    LEFT JOIN application a ON i.i_num = a.i_num "
					+ " "
					+ "WHERE "
					+ "    i.i_num = ? "
					+ " "
					+ "GROUP BY  "
					+ "    i.i_num, i.i_title, i.i_start, i.i_end, i.i_content, "
					+ "    ai.ai_img, ai.ai_birth, ai.an_num_link, ai.ai_alergy, ai.ai_disease, "
					+ "    ai.ai_caution,  ai.ai_name,  "
					+ "    at.a_num, at.at_name, "
					+ "    o.o_nickname,  o.o_addr, o.o_id "
					+ "";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, i_num);
			rs = ps.executeQuery();
			
			

			//nature ->1|2 : 성격 , a_num -> 3, at_name ->앵무새, ai_name : 쪼롱이
			
			
			InviteDTO dto = new InviteDTO();
			if(rs.next()) {
				dto.setI_num(rs.getInt("i_num"));
	            dto.setI_title(rs.getString("i_title"));
	            dto.setI_start(rs.getDate("i_start"));
	            dto.setI_end(rs.getDate("i_end"));
	            
	            dto.setAi_img(rs.getString("ai_img"));
	            dto.setO_id(rs.getString("o_id"));
	            
	            //만약 널이라면
	            if(rs.getString("ai_alergy")==null||("").equals(rs.getString("ai_alergy").trim())) {
	            	dto.setAi_alergy("없고");
	            }else {
	            	dto.setAi_alergy(rs.getString("ai_alergy"));
	            }
	            
	            if(rs.getString("ai_disease")==null||("").equals(rs.getString("ai_disease").trim())) {
	            	dto.setAi_disease("없습니다.");
	            }else {
	            	dto.setAi_disease(rs.getString("ai_disease"));
	            }
	            
	            if(rs.getString("ai_caution")==null||("").equals(rs.getString("ai_caution").trim())) {
	            	dto.setAi_caution("특별한 건 없어요.");
	            }else {
	            	dto.setAi_caution(rs.getString("ai_caution"));
	            }
	            
	            if(rs.getString("i_content")==null||("").equals(rs.getString("i_content").trim())) {
	            	dto.setAi_alergy("");
	            }else {
	            	dto.setI_content(rs.getString("i_content"));
	            }
	            
	            
	            
	            
	            dto.setAi_name(rs.getString("ai_name"));
	            dto.setAt_name(rs.getString("at_name"));
	            dto.setO_nickname(rs.getString("o_nickname"));
	            dto.setO_addr(rs.getString("o_addr"));
	            dto.setDoCnt(rs.getInt("doCnt"));
	            
	            int int_a_num =rs.getInt("a_num");
	            if(int_a_num==1) {
	            	dto.setA_num("강아지");
	            }else if(int_a_num==2) {
	            	dto.setA_num("고양이");
	            }else if(int_a_num==3) {
	            	dto.setA_num("조류");
	            }else if(int_a_num==4) {
	            	dto.setA_num("설치류");
	            }else if(int_a_num==5) {
	            	dto.setA_num("파충류");
	            }else if(int_a_num==6) {
	            	dto.setA_num("어류");
	            }else if(int_a_num==7) {
	            	dto.setA_num("기타");
	            }
	            
	            
	            //성격 계산
	            String list_nature =rs.getString("nature");

		         // '|'를 기준으로 문자열을 자르기
		         String[] natureArray = list_nature.split("\\|");
		
		         String str_nature="";
		         // 배열을 사용하여 처리 // array
		         for (String nature : natureArray) {
		             for(int i=0;i<array.size();i++) {
		            	 if(Integer.parseInt(nature) == array.get(i).getAn_num() ) {
		            		 str_nature+=array.get(i).getAn_word()+" ";
		            		 
		            	 }
		             }
		         }
	            dto.setNature(str_nature);
	            
	            
	            
	            //나이 1년전이면 개월수, 아니면 나이
	            LocalDate now = LocalDate.now();
	            String ageString = rs.getString("age").substring(0, 10);
	            
	            // 문자열을 LocalDate로 변환 (포맷이 "yyyy-MM-dd" 라고 가정)
	            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	            LocalDate birthDate = LocalDate.parse(ageString, formatter);
	            
	            Period period = Period.between(birthDate, now);

	            int years = period.getYears();
	            int months = period.getMonths();

	            String result="";

	            if (years > 0) {
	                if (years == 1 && months > 0) {
	                    result = years + "살 " + months + "개월";
	                } else {
	                    result = years + "살";
	                }
	            } else {
	                result = months + "개월";
	            }
	            
	            dto.setAge(result);
			}
		

			return dto;
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
			
		}finally {
			try {
				if (rs != null) rs.close();
		        if (ps != null) ps.close();
		        if (conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/* 동물성격 테이블 전부 가져오기*/
	public ArrayList<animalnatureDTO> getNatureList(){
		try {
			conn=com.DongGu.db.DongGuDB.getConn();
			String sql ="select * from animalnature ";
			ps = conn.prepareStatement(sql);
		
			rs=ps.executeQuery();
			ArrayList<animalnatureDTO> array = new ArrayList<>();
			while(rs.next()) {
				animalnatureDTO dto = new animalnatureDTO(
						);
				dto.setAn_num(rs.getInt("an_num"));
				dto.setAn_word(rs.getString("an_word")); 
				array.add(dto);
			}
			return array;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	/* 해당글에 위시리스트 체크 했는지*/
	public int isWishList(int i_num,String sid) {
		try {
			conn=com.DongGu.db.DongGuDB.getConn();
			String sql="select count(*) from wishlist "
					+ " where wt_num_value=? and w_id=? and wt_num=?";
			ps =conn.prepareStatement(sql);
			ps.setInt(1, i_num);
			ps.setString(2, sid);
			ps.setInt(3, 30);
			
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
	public int changeWishStatus(String sid,String i_num,int usertype) {
		
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql="select count(*) from wishlist where w_id=? and wt_num=? and wt_num_value=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sid);
			ps.setInt(2, 30);
			ps.setString(3, i_num);
			
			rs = ps.executeQuery();
			int isEx=0;
			if(rs.next()) {
				isEx = rs.getInt(1);
			}
			
			
			
			//위시리스트에 있으면 지우기
			if(isEx>=1) {
				sql = "delete from wishlist where w_id=? and wt_num=? and wt_num_value=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, sid);
				ps.setInt(2, 30);
				ps.setString(3, i_num );
			}
			//위시리스트에 없으면 추가
			else if(isEx==0) {
				
				sql =" insert into wishlist values(seq_wishlist_w_num.nextval, ?, ?, ?,?)";
				
				ps = conn.prepareStatement(sql);
				ps.setString(1, sid);
				ps.setInt(2, usertype);
				ps.setInt(3, 30);
				ps.setString(4, i_num);
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
	
	//로그인한 아이디로 해당 초대장 지원헀는지 여부 알아오기
	public int isApplyInvite(String sid, int i_num) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String slq="select count(*) from application where"
					+ "	i_num =? and p_id =?";
			ps = conn.prepareStatement(slq);
			ps.setInt(1, i_num);
			ps.setString(2, sid);
			
			
			rs=ps.executeQuery();
			int result=-1;
			if(rs.next()){
				result =rs.getInt(1);
			}
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/* ======================지현 끝 ==========================*/
}
