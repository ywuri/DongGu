package com.DongGu.review;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DongguReviewDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public DongguReviewDAO() {
        System.out.println("DongguReviewDAO 객체 생성됨!");
    }

    public DongguReviewDTO getReviewByNum(int r_num) {
        DongguReviewDTO review = null;

        try {
            conn = com.DongGu.db.DongGuDB.getConn();
            String sql = "SELECT r.r_num, r.r_write_id, r.r_receive_id, r.r_id_check, r.r_star, r.r_content, r.r_img, r.r_date, " +
                    "       p.p_nickname, p.p_img, g.g_name, " +
                    "       a.ai_name AS ai_name, " +
                    "       FLOOR(MONTHS_BETWEEN(SYSDATE, a.ai_birth) / 12) AS ai_birth, " +
                    "       (SELECT COUNT(*) FROM review WHERE r_receive_id = r.r_receive_id) AS review_count, " +
                    "       (SELECT ROUND(AVG(r_star), 1) FROM review WHERE r_receive_id = r.r_receive_id) AS avg_star " +
                    "FROM review r " +
                    "LEFT JOIN petsitter p ON r.r_receive_id = p.p_id " +
                    "LEFT JOIN grade g ON p.g_num = g.g_num " +
                    "LEFT JOIN animalinfo a ON r.r_write_id = a.o_id " +
                    "WHERE r.r_num = ?";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, r_num);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                int rNum = rs.getInt("r_num");
                String r_write_id = rs.getString("r_write_id");
                String r_receive_id = rs.getString("r_receive_id");
                int r_id_check = rs.getInt("r_id_check");
                int r_star = rs.getInt("r_star");
                String r_content = rs.getString("r_content");
                String r_img = rs.getString("r_img");
                Date r_date = rs.getDate("r_date");
                String p_nickname = rs.getString("p_nickname");
                String g_name = rs.getString("g_name");
                String ai_name = rs.getString("ai_name");
                int ai_birth = rs.getInt("ai_birth");
                int review_count = rs.getInt("review_count");
                double avg_star = rs.getDouble("avg_star");
                String p_img = rs.getString("p_img");
                
                review = new DongguReviewDTO(rNum, r_write_id, r_receive_id, r_id_check, r_star, r_content, r_img, r_date, p_nickname, g_name, ai_name, ai_birth, review_count, avg_star, p_img);
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
}
