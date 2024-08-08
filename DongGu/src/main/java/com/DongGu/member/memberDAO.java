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
			
			String sql = "SELECT * FROM petsitter WHERE p_id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getP_id());
			rs = ps.executeQuery();
			
			if (rs.next()) {
				isUnique = false;
			}
			rs.close();
			ps.close();
			
			if(isUnique) {
				// owner 테이블 중복검사
				String sql2 = "SELECT * FROM owner WHERE o_id=?";
				ps.setString(1, dto.getO_id());
				rs = ps.executeQuery();
				
				if (rs.next()) {
					isUnique = false;
				}
				rs.close();
				ps.close();
			}
			
			
			} catch(Exception e) {
				e.printStackTrace();
				isUnique = false;
			} finally {
				try {
					 if (rs != null) rs.close();
		             if (ps != null) ps.close();
		             if (conn != null) conn.close();
				} catch(Exception e2) {
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
			
			String sql = "SELECT * FROM petsitter WHERE p_nickname=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getP_nickname());
			rs = ps.executeQuery();
			
			if (rs.next()) {
				isUnique = false;
			}
			rs.close();
			ps.close();
			
			if(isUnique) {
				// owner 테이블 중복검사
				String sql2 = "SELECT * FROM owner WHERE o_nickname=?";
				ps.setString(1, dto.getO_nickname());
				rs = ps.executeQuery();
				
				if (rs.next()) {
					isUnique = false;
				}
				rs.close();
				ps.close();
			}
			
			
			} catch(Exception e) {
				e.printStackTrace();
				isUnique = false;
			} finally {
				try {
					 if (rs != null) rs.close();
		             if (ps != null) ps.close();
		             if (conn != null) conn.close();
				} catch(Exception e2) {
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




	
	/** 회원가입 관련 메서드 */
	
	
	//	========== 고유리 끝 ============= //
	
	//	========== 임수아 시작 ============= //
	//	========== 임수아 끝 ============= //
	
	//	========== 이지현 시작 ============= //
	//	========== 이지현 끝 ============= //
	
	//	========== 진예림 시작 ============= //
	//	========== 진예림 끝 ============= //
}
