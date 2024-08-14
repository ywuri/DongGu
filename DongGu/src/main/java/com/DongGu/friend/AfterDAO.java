package com.DongGu.friend;

import java.sql.*;

public class AfterDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public static final int NOT_ID = 1;
	public static final int NOT_PWD = 2;
	public static final int LOGIN_OK = 3;
	public static final int ERROR = -1;

	public AfterDAO() {
		System.out.println("AfterDAO 객체 생성됨!");
	}

	/** 후기(저장) */
	public int AfterWrite(AfterDTO ato) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "insert into review values(PK_review.nextval, ?,?,?, ?,?)";

			ps = conn.prepareStatement(sql);

			ps.setString(1, ato.getR_id());
			ps.setInt(2, ato.getR_id_check());
			ps.setInt(3, ato.getR_star()); 

			ps.setString(4, ato.getR_content());
			ps.setString(5, ato.getR_img_name());	//확장자명을 담은 파일명으로 저장

			int count = ps.executeUpdate();
			return count;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
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
}
