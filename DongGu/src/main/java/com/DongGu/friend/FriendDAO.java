package com.DongGu.friend;

import java.sql.*;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.time.format.*;
import java.time.*;
import java.time.LocalDate;
import java.time.Period;

import com.DongGu.animal.animalnatureDTO;
import com.DongGu.member.memberDTO;

public class FriendDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public static final int NOT_ID = 1;
	public static final int NOT_PWD = 2;
	public static final int LOGIN_OK = 3;
	public static final int ERROR = -1;

	public FriendDAO() {
	}

	/** 초대장(고용자글쓰기) */
	public int FriendOwnerWrite(FriendDTO fto) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "insert into invitation values(PK_invitation.nextval, ?,?,?, ?,?,?)";

			ps = conn.prepareStatement(sql);

			ps.setString(1, fto.getI_title());
			ps.setInt(2, fto.getAi_num());
			ps.setInt(3, 1); // matchingstate 테이블의 1(매칭대기)로 자동설정

			ps.setString(4, fto.getI_content());
			ps.setString(5, fto.getI_start());
			ps.setString(6, fto.getI_end());
			
			//System.out.println(fto.getI_title()+"//"+fto.getAi_num()+"//"+1+"//"+fto.getI_content()+"//"+fto.getI_start()+"//"+fto.getI_end());

			int count = ps.executeUpdate();
			return count;
			//return sql;
			
			//return fto.getI_title()+"//"+fto.getAi_num()+"//"+1+"//"+fto.getI_content()+"//"+fto.getI_start()+"//"+fto.getI_end();

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
			//return "nono";
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}
	}

	/** 초대장(고용자글쓰기) - 고용자주소, 고용자자택주소 데이터 불러오기 */
	public String ownerData(String s_id) {

		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "select * from owner where o_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, s_id);
			rs = ps.executeQuery();

			String ownerAddr = "";
			String ownerHouse = "";

			if (rs.next()) {
				ownerAddr = rs.getString("o_addr");
				ownerHouse = rs.getString("o_house");
			}

			return ownerAddr + "//" + ownerHouse;

		} catch (Exception e) {

			e.printStackTrace();
			return null;

		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();

			} catch (Exception e2) {

			}
		}
	}

	/** 초대장(고용자글쓰기) > 동물정보 select box > 동물정보 select box > option 에 담기 */
	public String animalName(String s_id) {
		try {

			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "select animalinfo.*, animaltype.at_name, animaltype.a_num, "
					+ " (SELECT a_name FROM animal WHERE animal.a_num = animaltype.a_num) AS a_name "
					+ " from animalinfo " + " left join animaltype on animaltype.at_num = animalinfo.at_num "
					+ " where o_id = ? ";

			ps = conn.prepareStatement(sql);
			ps.setString(1, s_id);
			rs = ps.executeQuery();

			String animal_select = "";

			while (rs.next()) {
				int ai_num = rs.getInt("ai_num");
				String ai_name = rs.getString("ai_name");

				String ai_img = rs.getString("ai_img");

				// String ai_birth = rs.getString("ai_birth");
				// String ai_birth = rs.getString("ai_birth").split(" ")[0];
				Date ai_birth = rs.getDate("ai_birth");

				String an_num_link = rs.getString("an_num_link");

				String link_text = "";
				String[] link_arr = an_num_link.split("\\|");	//올바른 구분자를 사용하여 문자열을 분리하려면 "\\|"를 사용해야돼
				String an_word = "";
				//int an_word = link_arr.length;
				


				for (int i = 0; i < link_arr.length; i++) {
					String secondQuery = "SELECT an_word FROM animalnature WHERE an_num = ?";
					// link_text = link_arr[i]+",";

					PreparedStatement ps2;
					ResultSet rs2;

					ps2 = conn.prepareStatement(secondQuery);

					link_text = link_arr[i];
					ps2.setString(1, link_text);
					rs2 = ps2.executeQuery();

					while (rs2.next()) {
						an_word += rs2.getString("an_word") + ",";
					}

					rs2.close();
					ps2.close();
				}
				

				//an_word가 콤마로 끝날 때 실행
				if (an_word.endsWith(",")) {
				    // 이 경우 an_word.endsWith(",")는 true를 반환하므로 이 블록이 실행됩니다.
					
				    an_word = an_word.substring(0, an_word.length() - 1); // 마지막 콤마를 제거합니다.
				}


				// String an_word = rs.getString("an_word");

				String ai_alergy = rs.getString("ai_alergy");
				String ai_disease = rs.getString("ai_disease");
				String ai_caution = rs.getString("ai_caution");

				int at_num = rs.getInt("at_num");
				String at_name = rs.getString("at_name");
				int a_num = rs.getInt("a_num");
				String a_name = rs.getString("a_name");

				animal_select += "<option value=" + ai_num + " val_name='" + ai_name + "' val_img='" + ai_img
						+ "' val_birth='" + ai_birth + "' val_link='" + an_num_link + "' val_aler='" + ai_alergy
						+ "' val_dise='" + ai_disease + "' val_caut='" + ai_caution + "' val_anitype_num=" + at_num
						+ " val_anitype_name='" + at_name + "' val_ani_num=" + a_num + " val_ani_name='" + a_name
						+ "'  val_an_nature='" + an_word + "' >" + ai_name + "</option>";
			}
			return animal_select;

		} catch (Exception e) {
			e.printStackTrace();
			return null;

		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();

			} catch (Exception e2) {
				e2.printStackTrace();
				return null;
			}
		}
	}

	/** 초대장(고용자글쓰기) > 동물정보 selectbox > 선택에 따른 동물데이터(성격) 불러오기 <작업필요> */
	public String animalInfo(int at_num_val) {
		try {

			conn = com.DongGu.db.DongGuDB.getConn();

			String sql = "SELECT animaltype.*, "
					+ " (SELECT a_name FROM animal WHERE animal.a_num = animaltype.a_num) AS a_name "
					+ " FROM animaltype " + "WHERE at_num = ?";

			ps = conn.prepareStatement(sql);
			ps.setInt(1, at_num_val);
			rs = ps.executeQuery();

			int a_num = 0;
			int at_num = 0;
			String at_name = "";
			String a_name = "";

			if (rs.next()) {
				a_num = rs.getInt("a_num");
				a_name = rs.getString("a_name");
				at_num = rs.getInt("at_num");
				at_name = rs.getString("at_name");
			}

			return a_num + "//" + a_name + "//" + at_num + "//" + at_name;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;

		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();

			} catch (Exception e2) {
				e2.printStackTrace();
				return null;
			}
		}
	}

	/* 초대장 리스트 */
	/* 초대장 상세 */

	/** 초대장>구직자 글쓰기 */
	public int FriendSitterWrite(FriendDTO2 fto2) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "insert into application values(PK_application.nextval, ?,?,?, ?,?)";

			ps = conn.prepareStatement(sql);

			// ps.setInt(1, fto2.getI_num());
			ps.setInt(1, fto2.getI_num()); // 초대장번호
			ps.setString(2, fto2.getAp_title()); // 지원제목
			ps.setInt(3, 1); // 매칭상태번호 matchingstate 테이블의 1(매칭대기)로 자동설정

			ps.setString(4, fto2.getP_id()); // 구직자아이디
			ps.setString(5, fto2.getAp_content()); // 추가내용

			int count = ps.executeUpdate();
			return count;
			// return "insert into application values(PK_application.nextval,
			// 1,"+fto2.getAp_title()+",1, "+fto2.getP_id()+","+fto2.getAp_content()+")";

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
			// return "nono";
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {

			}
		}
	}

	/** 초대장>구직자 글쓰기 - 구직자 성별, 흡연여부, 사진, 주소, 반려경험, 동구경험, 기타경험 데이터 불러오기 */
	public String sitterData(String s_id) {

		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "select * from petsitter where p_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, s_id);
			rs = ps.executeQuery();

			int sitterGender = 0;
			int sitterSmoke = 0;
			String sitterImg = "";
			String sitterAddr = "";
			String sitterMy = "";
			String sitterOther = "";
			String sitterEtc = "";

			if (rs.next()) {
				sitterGender = rs.getInt("p_gender");
				sitterSmoke = rs.getInt("p_smoke");
				sitterImg = rs.getString("p_img");
				sitterAddr = rs.getString("p_addr");
				sitterMy = rs.getString("p_ex_my").replaceAll("\n", "<br>");
				sitterOther = rs.getString("p_ex_other").replaceAll("\n", "<br>");
				sitterEtc = rs.getString("p_ex_etc").replaceAll("\n", "<br>");
			}

			return sitterGender + "//" + sitterSmoke + "//" + sitterImg + "//" + sitterAddr + "//" + sitterMy + "//"
					+ sitterOther + "//" + sitterEtc;

		} catch (Exception e) {

			e.printStackTrace();
			return null;

		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();

			} catch (Exception e2) {

			}
		}
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
						+ "        i.i_date"
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
	            dto.setI_content(rs.getString("i_content"));
	            dto.setAi_img(rs.getString("ai_img"));
	            dto.setO_id(rs.getString("o_id"));
	            
	            dto.setAi_alergy(rs.getString("ai_alergy"));
	            dto.setAi_disease(rs.getString("ai_disease"));
	            dto.setAi_caution(rs.getString("ai_caution"));
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
	
	/* ======================지현 끝 ==========================*/

}
