package com.DongGu.member;

import java.sql.*;
import javax.naming.*;
import javax.servlet.http.HttpSession;
import javax.sql.*;

public class memberDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	 // 상수 정의
    public static final int NOT_ID = 1;
    public final static int NOT_PWD = 2;
    final static public int LOGIN_OK = 3;
    public static final int ERROR = -1;
	
	public memberDAO() {
		System.out.println("MemberDAO객체 생성됨!");
	}
	
	//	========== 고유리 시작 ============= //
	
	/** ID 중복검사 관련 메서드 */
	public boolean IdCheck(memberDTO dto) {
	    boolean isUnique = true;

	    try {
	        conn = com.DongGu.db.DongGuDB.getConn();

	        // petsitter 테이블 중복검사
	        String sql1 = "SELECT * FROM petsitter WHERE p_id=?";
	        try (PreparedStatement ps1 = conn.prepareStatement(sql1)) {
	            ps1.setString(1, dto.getP_id());
	            try (ResultSet rs1 = ps1.executeQuery()) {
	                if (rs1.next()) {
	                    isUnique = false;
	                }
	            }
	        }

	        if (isUnique) {
	            // owner 테이블 중복검사
	            String sql2 = "SELECT * FROM owner WHERE o_id=?";
	            try (PreparedStatement ps2 = conn.prepareStatement(sql2)) {
	                ps2.setString(1, dto.getO_id());
	                try (ResultSet rs2 = ps2.executeQuery()) {
	                    if (rs2.next()) {
	                        isUnique = false;
	                    }
	                }
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        isUnique = false;
	    } finally {
	        try {
	            if (conn != null) conn.close();
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }
	    }

	    return isUnique;
	}


	
	/** NickName 중복검사 관련 메서드 */
	public boolean NickNameCheck(memberDTO dto) {
	    boolean isUnique = true;

	    try {
	        conn = com.DongGu.db.DongGuDB.getConn();

	        // petsitter 테이블 중복검사
	        String sql1 = "SELECT * FROM petsitter WHERE p_nickname=?";
	        try (PreparedStatement ps1 = conn.prepareStatement(sql1)) {
	            ps1.setString(1, dto.getP_nickname());
	            try (ResultSet rs1 = ps1.executeQuery()) {
	                if (rs1.next()) {
	                    isUnique = false;
	                }
	            }
	        }

	        if (isUnique) {
	            // owner 테이블 중복검사
	            String sql2 = "SELECT * FROM owner WHERE o_nickname=?";
	            try (PreparedStatement ps2 = conn.prepareStatement(sql2)) {
	                ps2.setString(1, dto.getO_nickname());
	                try (ResultSet rs2 = ps2.executeQuery()) {
	                    if (rs2.next()) {
	                        isUnique = false;
	                    }
	                }
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	        isUnique = false;
	    } finally {
	        try {
	            if (conn != null) conn.close();
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }
	    }

	    return isUnique;
	}
	
	/** 사용자 로그인 검사 메서드 */
    public int loginCheck(String userid, String userpwd) {
        try {
        	conn = com.DongGu.db.DongGuDB.getConn();

            // petsitter 테이블에서 비밀번호 검사
            String sql1 = "SELECT p_pwd FROM petsitter WHERE p_id=?";
            ps = conn.prepareStatement(sql1);
            ps.setString(1, userid);
            rs = ps.executeQuery();

            if (rs.next()) {
                String dbpwd = rs.getString("p_pwd");
                if (dbpwd.equals(userpwd)) {
                    return LOGIN_OK;
                } else {
                    return NOT_PWD;
                }
            }
            rs.close();
            ps.close();

            // owner 테이블에서 비밀번호 검사
            String sql2 = "SELECT o_pwd FROM owner WHERE o_id=?";
            ps = conn.prepareStatement(sql2);
            ps.setString(1, userid);
            rs = ps.executeQuery();

            if (rs.next()) {
                String dbpwd = rs.getString("o_pwd");
                if (dbpwd.equals(userpwd)) {
                    return LOGIN_OK;
                } else {
                    return NOT_PWD;
                }
            }
            rs.close();
            ps.close();

            return NOT_ID; // 두 테이블 모두에서 ID를 찾지 못한 경우

        } catch(Exception e) {
            e.printStackTrace();
            return ERROR;
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch(Exception e2) {
                e2.printStackTrace();
            }
        }
    }


    /** 사용자 정보 추출 관련 메서드 */
    public String getUserInfo(String userid, HttpSession session) {
        String userInfo = "";

        try {
        	conn = com.DongGu.db.DongGuDB.getConn();

            // petsitter 테이블에서 정보 추출
            String sql1 = "SELECT p_name, p_nickname FROM petsitter WHERE p_id=?";
            ps = conn.prepareStatement(sql1);
            ps.setString(1, userid);
            rs = ps.executeQuery();

            if (rs.next()) {
                userInfo = rs.getString("p_name");
                session.setAttribute("snickname", rs.getString("p_nickname"));
                rs.close();
                ps.close();
                return userInfo;
            }
            rs.close();
            ps.close();

            // owner 테이블에서 정보 추출
            String sql2 = "SELECT o_name, o_nickname FROM owner WHERE o_id=?";
            ps = conn.prepareStatement(sql2);
            ps.setString(1, userid);
            rs = ps.executeQuery();

            if (rs.next()) {
                userInfo = rs.getString("o_name");
                session.setAttribute("snickname", rs.getString("o_nickname"));
                rs.close();
                ps.close();
                return userInfo;
            }
            rs.close();
            ps.close();

        } catch(Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return userInfo;
    }




	
	/** [Owner] 회원가입 관련 메서드 */
    public int MemberJoinOwner(memberDTO dto) {
    	try {
    		conn = com.DongGu.db.DongGuDB.getConn();
    		
    		String sql = "INSERT INTO OWNER VALUES(?,?,?,?,?,?,?,?,?,SYSDATE,?,?,?)";
    		ps  = conn.prepareStatement(sql);
    		
    		ps.setString(1, dto.getO_id());
    		ps.setString(2, dto.getO_pwd());
    		ps.setString(3, dto.getO_name());
    		ps.setInt(4, dto.getO_gender());
    		ps.setString(5, dto.getO_nickname());
    		ps.setString(6, dto.getO_tel());
    		ps.setString(7, dto.getO_addr());
    		ps.setString(8, dto.getO_house());
    		ps.setString(9, dto.getO_jumin());
    		ps.setInt(10, dto.getQ_num());
    		ps.setString(11, dto.getQ_answer());
    		ps.setInt(12, dto.getL_numl());
    		
    		int count = ps.executeUpdate();
    		return count;
    	} catch(Exception e) {
    		e.printStackTrace();
    		return -1;
    	} finally {
    		try {
    			if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
    		} catch(Exception e2) {
    			
    		}
    	}
    }
	
	
	//	========== 고유리 끝 ============= //
	
	//	========== 임수아 시작 ============= //
	//	========== 임수아 끝 ============= //
	
	//	========== 이지현 시작 ============= //
	//	========== 이지현 끝 ============= //
	
	//	========== 진예림 시작 ============= //
	//	========== 진예림 끝 ============= //
}
