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

}
