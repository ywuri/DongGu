package com.DongGu.member;

import java.sql.*;
import java.util.ArrayList;

import javax.naming.*;
import javax.servlet.http.HttpSession;
import javax.sql.*;

import oracle.net.aso.p;

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
	public boolean IdCheck(memberDTO dto, ownermemberDTO odto) {
	    boolean isUnique = true;

	    try {
	        conn = com.DongGu.db.DongGuDB.getConn();

	        // p_id 검사
	        if (dto.getP_id() != null && !dto.getP_id().trim().isEmpty()) {
	            // petsitter 테이블에서 p_id 검사
	            String sql1 = "SELECT * FROM petsitter WHERE p_id=?";
	            try (PreparedStatement ps1 = conn.prepareStatement(sql1)) {
	                ps1.setString(1, dto.getP_id());
	                try (ResultSet rs1 = ps1.executeQuery()) {
	                    if (rs1.next()) {
	                        isUnique = false;
	                    }
	                }
	            }

	            // owner 테이블에서도 p_id와 동일한 o_id 검사
	            if (isUnique) {
	                String sql2 = "SELECT * FROM owner WHERE o_id=?";
	                try (PreparedStatement ps2 = conn.prepareStatement(sql2)) {
	                    ps2.setString(1, dto.getP_id());
	                    try (ResultSet rs2 = ps2.executeQuery()) {
	                        if (rs2.next()) {
	                            isUnique = false;
	                        }
	                    }
	                }
	            }
	        }

	        // o_id 검사
	        if (isUnique && odto.getO_id() != null && !odto.getO_id().trim().isEmpty()) {
	            // owner 테이블에서 o_id 검사
	            String sql3 = "SELECT * FROM owner WHERE o_id=?";
	            try (PreparedStatement ps3 = conn.prepareStatement(sql3)) {
	                ps3.setString(1, odto.getO_id());
	                try (ResultSet rs3 = ps3.executeQuery()) {
	                    if (rs3.next()) {
	                        isUnique = false;
	                    }
	                }
	            }

	            // petsitter 테이블에서도 o_id와 동일한 p_id 검사
	            if (isUnique) {
	                String sql4 = "SELECT * FROM petsitter WHERE p_id=?";
	                try (PreparedStatement ps4 = conn.prepareStatement(sql4)) {
	                    ps4.setString(1, odto.getO_id());
	                    try (ResultSet rs4 = ps4.executeQuery()) {
	                        if (rs4.next()) {
	                            isUnique = false;
	                        }
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
	public boolean NickNameCheck(memberDTO mdto, ownermemberDTO odto) {
	    boolean isUnique = true;

	    try {
	        conn = com.DongGu.db.DongGuDB.getConn();

	        // p_nickname이 petsitter 또는 owner 테이블에 있는지 확인
	        if (mdto.getP_nickname() != null && !mdto.getP_nickname().trim().isEmpty()&&!("").equals(mdto.getP_nickname().trim())) {
	            String sql1 = "SELECT 1 FROM petsitter WHERE p_nickname = ? UNION SELECT 1 FROM owner WHERE o_nickname = ?";
	            try (PreparedStatement ps1 = conn.prepareStatement(sql1)) {
	                ps1.setString(1, mdto.getP_nickname());
	                ps1.setString(2, mdto.getP_nickname());
	                try (ResultSet rs1 = ps1.executeQuery()) {
	                    if (rs1.next()) {
	                        isUnique = false;
	                    }
	                }
	            }
	        }

	        // o_nickname이 owner 또는 petsitter 테이블에 있는지 확인
	        if (isUnique && odto.getO_nickname() != null && !odto.getO_nickname().trim().isEmpty()&&!("").equals(odto.getO_nickname().trim()))  {
	            String sql2 = "SELECT 1 FROM owner WHERE o_nickname = ? UNION SELECT 1 FROM petsitter WHERE p_nickname = ?";
	            try (PreparedStatement ps2 = conn.prepareStatement(sql2)) {
	                ps2.setString(1, odto.getO_nickname());
	                ps2.setString(2, odto.getO_nickname());
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
            
            // admin 테이블에서 비밀번호 검사
            String sql3 = "SELECT ad_pwd FROM admin WHERE ad_id=?";
            ps = conn.prepareStatement(sql3);
            ps.setString(1, userid);
            rs = ps.executeQuery();

            if (rs.next()) {
                String ad_pwd = rs.getString("ad_pwd");
                if (ad_pwd.equals(userpwd)) {
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
                session.setAttribute("usertype", 1);
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
                session.setAttribute("usertype", 0);
                rs.close();
                ps.close();
                return userInfo;
            }
            rs.close();
            ps.close();
            
            // admin 테이블에서 정보 추출
            String sql3 = "SELECT * FROM admin WHERE ad_id=?";
            ps = conn.prepareStatement(sql3);
            ps.setString(1, userid);
            rs = ps.executeQuery();

            if (rs.next()) {
                session.setAttribute("usertype", 2);
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
    public int MemberJoinOwner(ownermemberDTO odto) {
    	try {
    		conn = com.DongGu.db.DongGuDB.getConn();
    		
    		String sql = "INSERT INTO owner VALUES(?,?,?,?,?,?,?,?,?,SYSDATE,?,?,?)";
    		ps  = conn.prepareStatement(sql);
    		
    		ps.setString(1, odto.getO_id());
    		ps.setString(2, odto.getO_pwd());
    		ps.setString(3, odto.getO_name());
    		ps.setInt(4, odto.getO_gender());
    		ps.setString(5, odto.getO_nickname());
    		ps.setString(6, odto.getO_tel());
    		ps.setString(7, odto.getO_addr());
    		ps.setString(8, odto.getO_house());
    		ps.setString(9, odto.getO_jumin());
    		ps.setInt(10, odto.getQ_num());
    		ps.setString(11, odto.getQ_answer());
    		ps.setInt(12, odto.getL_numl());
    		
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
    
    /** [Petsitter] 회원가입 관련 메서드 */
    public int MemberJoinDonggu(memberDTO dto) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = com.DongGu.db.DongGuDB.getConn();
            System.out.println("Database connection established");

            String sql = "INSERT INTO petsitter (p_id, p_pwd, p_name, p_gender, p_smoke, p_nickname, p_img, p_tel, p_addr, p_jumin, p_ex_my, p_ex_other, p_ex_etc, p_date, q_num, p_answer, g_num, p_bank_name, p_bank_num) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? , ?, ?)";
            ps = conn.prepareStatement(sql);

            // 각 파라미터 설정 시점에 로그 출력
            ps.setString(1, dto.getP_id());
            ps.setString(2, dto.getP_pwd());
            ps.setString(3, dto.getP_name());
            ps.setInt(4, dto.getP_gender());
            ps.setInt(5, dto.getP_smoke());
            ps.setString(6, dto.getP_nickname());
            ps.setString(7, dto.getP_img());
            ps.setString(8, dto.getP_tel());
            ps.setString(9, dto.getP_addr());
            ps.setString(10, dto.getP_jumin());
            ps.setString(11, dto.getP_ex_my());
            ps.setString(12, dto.getP_ex_other());
            ps.setString(13, dto.getP_ex_etc());
            ps.setDate(14, dto.getP_date());
            ps.setInt(15, dto.getQ_num());
            ps.setString(16, dto.getP_answer());
            ps.setInt(17, dto.getG_num());  // L_NUM 값 설정
            ps.setString(18, dto.getP_bank_name());  
            ps.setString(19, dto.getP_bank_num());  
            
            int count = ps.executeUpdate();
            return count;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Database operation failed: " + e.getMessage(), e);
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e2) {
                e2.printStackTrace();
            }
        }
    }


    /** ID 찾기 관련 메서드 */
    public String IdSearch(String name, String tel) {
        String id = null;

        try {
            conn = com.DongGu.db.DongGuDB.getConn();

            // owner 테이블에서 검색
            String sql = "SELECT o_id FROM owner WHERE o_name = ? AND o_tel = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, tel);

            rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getString("o_id");
                return id; // owner 테이블에서 찾으면 반환
            }

            rs.close();
            ps.close();

            // petsitter 테이블에서 검색
            sql = "SELECT p_id FROM petsitter WHERE p_name = ? AND p_tel = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, tel);

            rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getString("p_id");
                return id; // petsitter 테이블에서 찾으면 반환
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e2) {
                e2.printStackTrace();
            }
        }
        return null; // ID를 찾지 못한 경우 null 반환
    }
    
    /** PW 찾기 관련 메서드 */
    public String PwSearch(String id, String answer) {
        String pw = null;

        try {
            conn = com.DongGu.db.DongGuDB.getConn();

            // owner 테이블에서 검색
            String sql = "SELECT o_pwd FROM owner WHERE o_id = ? AND q_answer = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, answer);

            rs = ps.executeQuery();
            if (rs.next()) {
            	pw = rs.getString("o_pwd");
                return pw; // owner 테이블에서 찾으면 반환
            }

            rs.close();
            ps.close();

            // petsitter 테이블에서 검색
            sql = "SELECT p_pwd FROM petsitter WHERE p_id = ? AND p_answer = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, answer);

            rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getString("p_pwd");
                return id; // petsitter 테이블에서 찾으면 반환
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e2) {
                e2.printStackTrace();
            }
        }
        return null; // ID를 찾지 못한 경우 null 반환
    }
    
    

	
	//	========== 고유리 끝 ============= //
	
	//	========== 임수아 시작 ============= //
	//	========== 임수아 끝 ============= //
	
	//	========== 이지현 시작 ============= //
	//	========== 이지현 끝 ============= //
	
	//	========== 진예림 시작 ============= //
	//	========== 진예림 끝 ============= //
}
