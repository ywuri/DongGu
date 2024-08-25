package com.DongGu.cafe;

import java.sql.*;
import java.util.ArrayList;

public class CafeDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public CafeDAO() {
		// TODO Auto-generated constructor stub
	}

	
	/** 동구의 추천 리스트 */
	public ArrayList<CafeDTO> cafeList(int cp, int ls){
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			
			int start=(cp-1)*ls+1;
			int end=cp*ls;
			String sql = " select * from "
							+ " ( "
							+ "    select rownum as rnum, a.* "
							+ "    from (select * from cafe order by c_num desc)a "
							+ " )b "
							+ " where rnum >= ? and rnum <= ? ";
			
			ps=conn.prepareStatement(sql);
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			
			rs=ps.executeQuery();
			
			ArrayList<CafeDTO> arr = new ArrayList<CafeDTO>();
			int c_num = 0;
			String c_name = "";
			while(rs.next()) {
				c_num = rs.getInt("c_num");
				c_name = rs.getString("c_name");
				String c_img = rs.getString("c_img");
				String c_addr = rs.getString("c_addr");
				String c_time = rs.getString("c_time");
				String c_url = rs.getString("c_url");
				String c_info = rs.getString("c_info");
				String c_vtag = rs.getString("c_vtag");
				String c_ltag = rs.getString("c_ltag");
				
				//int readnum = rs.getInt("readnum");
				//int ref = rs.getInt("ref");
				//int lev = rs.getInt("lev");
				//int sunbun = rs.getInt("sunbun");
				
				CafeDTO dto = new CafeDTO(c_num, c_name, c_img, c_addr, c_time, c_url, c_info, c_vtag, c_ltag);
				
				arr.add(dto);
			}
			return arr;
			//return cp+"//"+ls+"//"+c_num+"//"+c_name;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
			
		}finally {
			try {
				
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
				
			} catch (Exception e2) {
				
			}
		}
	}
	
	/** 동구의 추천 총 게시글 수 */
	public int cafeTotalCnt() {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "select count(*) from cafe ";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count==0?1:count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
			
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
				
			} catch (Exception e2) {
				
			}
		}
	}
	
	/** 동구의 추천 리스트 (지역검색) */
	public ArrayList<CafeDTO> cafeListArea(int cp, int ls, int area) {
		
		System.out.println(area);
		
		String sql = "";
		int start = 0;
		int end = 0;
		String s_area = "";
		
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			
			start=(cp-1)*ls+1;
			end=cp*ls;
			sql = " select * from "
							+ " ( "
							+ "    select rownum as rnum, a.* "
							+ "    from (select * from cafe where c_addr like ? order by c_num desc)a "
							+ " )b "
							+ " where rnum >= ? and rnum <= ? ";
			
			ps=conn.prepareStatement(sql);
			
			ps.setInt(2, start);
			ps.setInt(3, end);
			
			if(area == 1) {
				ps.setString(1, "%서울%");
				s_area = "서울";
				
			}else if(area == 2) {
				ps.setString(1, "%경기%");
				s_area = "경기";
				
			}else if(area == 3) {
				ps.setString(1, "%인천%");
				s_area = "인천";
				
			}
			
			rs=ps.executeQuery();
			
			ArrayList<CafeDTO> arr = new ArrayList<CafeDTO>();
			int c_num = 0;
			String c_name = "";
			while(rs.next()) {
				c_num = rs.getInt("c_num");
				c_name = rs.getString("c_name");
				String c_img = rs.getString("c_img");
				String c_addr = rs.getString("c_addr");
				String c_time = rs.getString("c_time");
				String c_url = rs.getString("c_url");
				String c_info = rs.getString("c_info");
				String c_vtag = rs.getString("c_vtag");
				String c_ltag = rs.getString("c_ltag");
				
				//int readnum = rs.getInt("readnum");
				//int ref = rs.getInt("ref");
				//int lev = rs.getInt("lev");
				//int sunbun = rs.getInt("sunbun");
				
				CafeDTO dto = new CafeDTO(c_num, c_name, c_img, c_addr, c_time, c_url, c_info, c_vtag, c_ltag);
				
				arr.add(dto);
			}
			
			System.out.println(sql);
			System.out.println(start+"//"+end+"//"+s_area);
			return arr;
			//return sql+area;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
			
		}finally {
			try {
				
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
				
			} catch (Exception e2) {
				
			}
		}
	}

	
	/** 동구의 추천 총 게시글 수 (지역검색) */
	public int cafeTotalCntArea(int area) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "select count(*) from cafe where c_addr like ? ";

			ps = conn.prepareStatement(sql);
			
			if(area == 1) {
				ps.setString(1, "%서울%");
				
			}else if(area == 2) {
				ps.setString(1, "%경기%");
				
			}else if(area == 3) {
				ps.setString(1, "%인천%");
				
			}
			
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count==0?1:count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
			
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
				
			} catch (Exception e2) {
				
			}
		}
	}
	

	/** 동구의 추천 리스트 > 상세 */
	public ArrayList<CafeDTO> cafeData(int idx){
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "select * from cafe where c_num = ? ";
			ps = conn.prepareStatement(sql);			

			ps.setInt(1, idx);
			rs=ps.executeQuery();
			
			
			ArrayList<CafeDTO> arr = new ArrayList<CafeDTO>();
			while(rs.next()) {
				int c_num  = rs.getInt("c_num");
				String c_name = rs.getString("c_name");
				String c_img = rs.getString("c_img");
				String c_addr = rs.getString("c_addr");
				String c_time = rs.getString("c_time");
				String c_url = rs.getString("c_url");
				String c_info = rs.getString("c_info");
				String c_vtag = rs.getString("c_vtag");
				String c_ltag = rs.getString("c_ltag");
				
				CafeDTO dto = new CafeDTO(c_num, c_name, c_img, c_addr, c_time, c_url, c_info, c_vtag, c_ltag);
				
				arr.add(dto);
			}
			return arr;
			
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

	/** 동구의 추천 리스트 > 상세 > 태그 데이터3 */
	public String detailTag3(String vtag) {
		try {

			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "select * from cafetype ";

			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			
			String vtag_print = "";
			//int arr_no = 0;
			
			String[] vtag_arr = vtag.split(",");
			int[] int_arr = new int[vtag_arr.length];
			
			//boolean test = false;
			
			while (rs.next()) {
				int ct_num = rs.getInt("ct_num");
				String ct_word = rs.getString("ct_word");
				
				//체크 여부 기본 설정 false로 설정
				boolean checkYN = false;

				for (int i = 0; i < vtag_arr.length; i++) {
					int_arr[i] = Integer.parseInt(vtag_arr[i].trim()); // trim()으로 공백 제거
					//System.out.println(ct_num+"////"+int_arr[i]);
					
					//cafetype테이블(코드)값과 cafe테이블에 콤마로 담아놓은 값이 일치하면 체크로 표시
					if(ct_num == int_arr[i]) {
						checkYN = true;
						//vtag += "<li><input type='checkbox' checked>" + ct_word + "oooo</li>";
						vtag_print += "<li><img src='/DongGu/img/check.png' class='tag_img'><span>" + ct_word + "</span></li>";
					}
	            }
				//System.out.println("for끝");
				
				//바로 위 for에서 true가 아닌 경우 체크안함으로 표시
				if(checkYN == false) {
					//vtag += "<li><input type='checkbox' disabled>" + ct_word + "xxxx</li>";
					vtag_print += "<li><img src='/DongGu/img/checkno.png' class='tag_img'><span>" + ct_word + "</span></li>";
				}
	            
				
				
				
				
				//vtag += "<li><input type='checkbox' checked>" + ct_word + "//" + ct_num + "</li>";
				
				
			}

			return vtag_print;

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

}
