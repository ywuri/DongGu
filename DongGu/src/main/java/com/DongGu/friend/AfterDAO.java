package com.DongGu.friend;

import java.io.File;
import java.sql.*;
import java.util.ArrayList;

public class AfterDAO {

	private Connection conn;
	private PreparedStatement ps, ps2;
	private ResultSet rs;

	public AfterDAO() {
		System.out.println("AfterDAO 객체 생성됨!");
	}

	/** --- 수아언니 --- */
	// 후기(저장)
	public int AfterWrite(AfterDTO ato) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "insert into review values(seq_review_r_num.nextval, ?,?,?, ?,?,?, sysdate)";
			
			//System.out.println(sql);

			ps = conn.prepareStatement(sql);

			ps.setString(1, ato.getR_write_id());
			ps.setInt(2, ato.getR_id_check());
			ps.setString(3, ato.getR_receive_id());
			
			ps.setInt(4, ato.getR_star()); 
			ps.setString(5, ato.getR_content());
			ps.setString(6, ato.getR_img_name());	//확장자명을 담은 파일명으로 저장

			//System.out.println(ato.getR_write_id());
			//System.out.println(ato.getR_id_check());
			//System.out.println(ato.getR_receive_id());
			//System.out.println(ato.getR_star());
			//System.out.println(ato.getR_content());
			//System.out.println(ato.getR_img_name());

			int count1 = ps.executeUpdate();
			
			
			String sql2 = "";

			//고용자, 초대장 수정
			if(ato.getR_id_check() == 0) {

				sql2 = "update invitation set m_num =5 where i_num = ? ";
				
			//구직자, 지원할래요 수정
			}else {
				sql2 = "update application set m_num =5 where ap_num = ? ";
			}
			
			//System.out.println(sql2);

			ps2 = conn.prepareStatement(sql2);
			ps2.setInt(1, ato.getR_sun_i()); //세션값에 따른 초대장, 지원할래요 키값

			int count2 = ps2.executeUpdate();
			ps2.close();
			
			
			int count = 0;
			
			//이용후기 저장 앤드 초대장or지원할래요 업데이트 된 경우는 count=1
			if(count1 == 1 && count2 == 1) {
				count = 1;
				
			//
			}else {
				//이용후기 저장만 된 경우는 count = 2
				if(count1 == 1 && count2 == 0) {
					count = 2;
					
				//초대장or지원할래요만 업데이트 된 경우는 count = 3
				}else if(count1 == 0 && count2 == 1) {
					count = 2;
					
				//둘다 안된경우 count=0
				}else {
					count = 0;
				}
			}
			
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
	
	

	/** 이용후기 저장 후 이용후기 상세로 가기위해 키값필요 */
	public int AfterWriteView() {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "select r_num from review order by r_num desc ";
			
			System.out.println(sql);
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int r_num = rs.getInt(1);
			return r_num==0?0:r_num;
			
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
	
	
	/** --- 유리가 한 것 --- 
	// 후기 뿌리기
	public ArrayList<AfterDTO> AfterList(int rIdCheck) {
	    ArrayList<AfterDTO> arr = new ArrayList<>();

	    String sql = "SELECT r.r_num, r.r_write_id, r.r_id_check, r.r_star, r.r_content, r.r_img, r.r_date, " +
	                 "       CASE " +
	                 "           WHEN r.r_write_id_check = 0 THEN o.o_nickname " +
	                 "           WHEN r.r_write_id_check = 1 THEN p.p_nickname " +
	                 "           ELSE 'Unknown' " +
	                 "       END AS nickname " +
	                 "FROM review r " +
	                 "LEFT JOIN owner o ON r.r_write_id = o.o_id AND r.r_write_id_check = 0 " +
	                 "LEFT JOIN petsitter p ON r.r_write_id = p.p_id AND r.r_write_id_check = 1 " +
	                 "WHERE r.r_write_id_check = ? " +
	                 "ORDER BY r.r_num DESC";

	    String uploadPath = "/DongGu/";  // 이 부분은 실제 프로젝트에서 설정된 경로로 바꾸어야 합니다.
	    String savepath = uploadPath + "img/webFolder/upload/";

	    try (Connection conn = com.DongGu.db.DongGuDB.getConn();
	         PreparedStatement ps = conn.prepareStatement(sql)) {
	         
	        ps.setInt(1, rIdCheck); // r_id_check 값을 설정

	        try (ResultSet rs = ps.executeQuery()) {
	            while (rs.next()) {
	                int r_num = rs.getInt("r_num");
	                String r_write_id = rs.getString("r_write_id");
	                int r_id_check = rs.getInt("r_id_check");
	                int r_star = rs.getInt("r_star");
	                String r_content = rs.getString("r_content");
	                String r_img_name = rs.getString("r_img");  // 파일 이름을 가져옴
	                Date r_date = rs.getDate("r_date");  // r_date 값을 가져옴
	                String nickname = rs.getString("nickname");  // 닉네임 가져오기

	                File r_img = new File(savepath + r_img_name);

	                AfterDTO dto = new AfterDTO(r_num, r_write_id, r_id_check, r_star, r_content, r_img, r_img_name, r_date, nickname);
	                arr.add(dto);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null; // -1 : 에러코드
	    }

	    return arr;
	}*/



}