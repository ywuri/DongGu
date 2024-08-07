package com.DongGu.friend;

import java.sql.*;

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
	

	/* 초대장 리스트 */
	/* 초대장 상세 */

	/* 초대장>지원자 글쓰기 */
	/* 초대장>지원자 리스트 */
	/* 초대장>지원자 글 상세 */
	
}


