package com.DongGu.review;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class IdReviewDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public IdReviewDAO() {
        System.out.println("IdReviewDAO 객체 생성됨!");
    }

    // 리뷰 번호(r_num)에 해당하는 IdReviewDTO 객체를 반환하는 메서드
    public IdReviewDTO getReviewByNum(int r_num) {
        IdReviewDTO review = null;

        try {
            conn = com.DongGu.db.DongGuDB.getConn();
            String sql = "SELECT r.r_num, r.r_write_id, r.r_id_check, r.r_star, r.r_content, r.r_img, r.r_date, " +
                         "       o.o_nickname AS nickname, a.ai_name AS animal_name, " +
                         "       FLOOR(MONTHS_BETWEEN(SYSDATE, a.ai_birth) / 12) AS animal_age " +
                         "FROM review r " +
                         "LEFT JOIN owner o ON r.r_write_id = o.o_id " +
                         "LEFT JOIN animalinfo a ON o.o_id = a.o_id " +
                         "WHERE r.r_num = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, r_num);  // r_num 값을 설정

            rs = pstmt.executeQuery();

            if (rs.next()) {
                int reviewNum = rs.getInt("r_num");
                String r_write_id = rs.getString("r_write_id");
                int r_id_check = rs.getInt("r_id_check");
                int r_star = rs.getInt("r_star");
                String r_content = rs.getString("r_content");
                String r_img = rs.getString("r_img");
                String r_img_name = null;  // r_img_name은 현재 SQL 쿼리에서 가져오지 않으므로 null로 설정
                Date r_date = rs.getDate("r_date");
                String nickname = rs.getString("nickname");
                
                String animal_name = rs.getString("animal_name");
                int animal_age = rs.getInt("animal_age");
                // IdReviewDTO 객체 생성 및 데이터 설정
                review = new IdReviewDTO(reviewNum, r_write_id, r_id_check, r_star, r_content, r_img, 
                                         r_img_name, r_date, nickname, animal_name, animal_age);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return review;
    }
    
 // 특정 r_num에 해당하는 o_id 가져오기
	/*
	 * public String getO_id(int r_num) { String o_id = null; String sql =
	 * "SELECT o_id FROM review WHERE r_num = ?";
	 * 
	 * try { conn = com.DongGu.db.DongGuDB.getConn(); pstmt =
	 * conn.prepareStatement(sql); pstmt.setInt(1, r_num);
	 * 
	 * rs = pstmt.executeQuery();
	 * 
	 * if (rs.next()) { o_id = rs.getString("o_id"); // o_id 값을 가져옴 } } catch
	 * (Exception e) { e.printStackTrace(); } finally { // 데이터베이스 리소스 정리 try { if
	 * (rs != null) rs.close(); if (pstmt != null) pstmt.close(); if (conn != null)
	 * conn.close(); } catch (Exception e) { e.printStackTrace(); } }
	 * 
	 * return o_id; // o_id 반환 }
	 */
    
    
 // 특정 p_nickname에 해당하는 p_id 가져오기
    public String getP_id(String p_nickname) {
        String p_id = null;
        String sql = "SELECT p_id FROM petsitter WHERE p_nickname = ?"; // petsitter 테이블에서 p_nickname을 기준으로 p_id를 조회

        try (Connection conn = com.DongGu.db.DongGuDB.getConn();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, p_nickname);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    p_id = rs.getString("p_id");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return p_id;
    }


}

