package com.DongGu.friend;

import java.sql.*;
import java.util.*;

public class FriendDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public static final int NOT_ID=1;
	public static final int NOT_PWD=2;
	public static final int LOGIN_OK=3;
	public static final int ERROR=-1;
	
	public FriendDAO() {}
	

	/* 초대장(고용자글쓰기) */
	public int FriendOwnerWrite(FriendDTO fto) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "insert into invitation values(PK_invitation.nextval, ?,?,?, ?,?,?)";
			
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, fto.getI_title());
			ps.setInt(2, fto.getAi_num());			
			//ps.setInt(3, fto.getM_num());
			ps.setInt(3, 1);	//matchingstate 테이블의 1(매칭대기)로 자동설정
			
			ps.setString(4, fto.getI_content());
			ps.setString(5, fto.getI_start());
			ps.setString(6, fto.getI_end());
			
			//System.out.println("tttttt");
			
			int count = ps.executeUpdate();
			//String count = "insert into invitation values(PK_invitation.nextval, "+fto.getI_title()+", "+fto.getAi_num()+", "+fto.getM_num()+", "+fto.getI_content()+", "+fto.getI_start()+", "+fto.getI_end()+")";
			return count;
			
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
			//return "nono";
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch (Exception e2) {
				
			}
		}
	}
	
	//초대장(고용자글쓰기) - 고용자주소, 고용자자택주소 데이터 불러오기
	public String ownerData(String s_id) {
		
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "select * from owner where o_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, s_id);
			rs = ps.executeQuery();

			String ownerAddr = "";
			String ownerHouse = "";
			
			if(rs.next()) {
				ownerAddr = rs.getString("o_addr");
				ownerHouse = rs.getString("o_house");
			}
			
			return ownerAddr+"//"+ownerHouse;
			//return sql+"//"+s_id;
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
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
	
	/* 초대장(고용자글쓰기) > 동물정보 selectbox */
	public String animalName(String s_id){
		try {

			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "select * from animalinfo where o_id=?";			
			ps = conn.prepareStatement(sql);
			ps.setString(1, s_id);
			rs = ps.executeQuery();
			
			//ArrayList<FriendDTO> arr=new ArrayList<FriendDTO>();
			
			String animal_select = "";
			
			while(rs.next()) {
				int ai_num = rs.getInt("ai_num");
				String ai_name = rs.getString("ai_name");
				
				//FriendDTO fdto = new FriendDTO(ai_num, ai_name);
				
				animal_select += "<option value="+ai_num+">"+ai_name+"</option>";
				 
				//arr.add(animal_select);
			}
			return animal_select;
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
			
		}finally {
			try {
				if(rs!=null)  rs.close();
				if(ps!=null)  ps.close();
				if(conn!=null)  conn.close();
				
			}catch(Exception e2) {
				e2.printStackTrace();
				return null;
			}
		}
	}
	
	/* 초대장(고용자글쓰기) > 동물정보 selectbox > 선택에 따른 동물데이터 불러오기 */
	public String animalInfo(int a_num){
		try {

			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "select * from animalinfo where o_id=?";			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, a_num);
			rs = ps.executeQuery();
			
			//ArrayList<FriendDTO> arr=new ArrayList<FriendDTO>();
			
			String animal_select = "";
			
			while(rs.next()) {
				int ai_num = rs.getInt("ai_num");
				String ai_name = rs.getString("ai_name");
				
				//FriendDTO fdto = new FriendDTO(ai_num, ai_name);
				
				animal_select += "<option value="+ai_num+">"+ai_name+"</option>";
				 
				//arr.add(animal_select);
			}
			return animal_select;
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
			
		}finally {
			try {
				if(rs!=null)  rs.close();
				if(ps!=null)  ps.close();
				if(conn!=null)  conn.close();
				
			}catch(Exception e2) {
				e2.printStackTrace();
				return null;
			}
		}
	}
	

	/* 초대장 리스트 */
	/* 초대장 상세 */

	/* 초대장>지원자 글쓰기 */
	/* 초대장>지원자 리스트 */
	/* 초대장>지원자 글 상세 */
	
}


