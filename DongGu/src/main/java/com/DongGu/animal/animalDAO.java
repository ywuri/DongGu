package com.DongGu.animal;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.DongGu.member.ownermemberDTO;

public class animalDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/** [대분류] 동물종류 리스트 관련 메서드 */
	public List<String[]> animalList(){ // 문자열 배열('string[]')을 요소로 가지는 리스트
		List<String[]> BigAnimalList = new ArrayList<String[]>();
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			
			// 동물 정보를 가져오는 SQL 쿼리 작성
			String sql = "SELECT a_num, a_name FROM animal ORDER BY a_num ASC";
			
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			
			while(rs.next()) {
				int a_num = rs.getInt("a_num");
				String a_name = rs.getString("a_name");
				
				// 동물 번호와 이름을 문자열 배열로 만들어 리스트에 추가
				BigAnimalList.add(new String[] {String.valueOf(a_num),a_name});

			}
		}catch(Exception e) {
			  e.printStackTrace(); 
		}finally{
			try {
				if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
			} catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return BigAnimalList;
		
	}
	
	/** [소분류] 동물종류 리스트 관련 메서드 */
	public List<String[]> animalTypeList(){
		List<String[]> SmallAnimalList = new ArrayList<String[]>();
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			
			String sql = "SELECT * FROM animaltype ORDER BY a_num ASC";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				int at_num = rs.getInt("at_num");
				int a_num = rs.getInt("a_num");
				String at_name = rs.getString("at_name");

				SmallAnimalList.add(new String[] {String.valueOf(at_num),String.valueOf(a_num),at_name});
			}
			
		} catch(Exception e){
			 e.printStackTrace(); 
		} finally {
			try {
				if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return SmallAnimalList;
	}
	
	/** 동물성격 관련 메서드 */
	public List<String> animalNature() {
		List<String> natureList = new ArrayList<>();
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			
			String sql = "SELECT * FROM animalnature ORDER BY an_num ASC";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				natureList.add(rs.getString("an_word"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
			}catch(Exception e2) {
				e2.printStackTrace();
			}
		}
		return natureList; 
	}
	
	/** 동물성격 DB전송 관련 메서드 */
	public int saveAnimalNature(String o_id, String natureString) {
    try {
        conn = com.DongGu.db.DongGuDB.getConn();
        
        String sql = "UPDATE ANIMALINFO SET an_num_link = ? WHERE o_id = ?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, natureString);
        ps.setString(2, o_id);

        return ps.executeUpdate();
        
    } catch(Exception e) {
        e.printStackTrace();
        return -1;
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch(Exception e2) {}
    }
}
	
	
	/** 동물정보 입력 관련 메서드 */
	public int MemberJoinOwnerAnimal(animalDTO adto) {
	    Connection conn = null;
	    PreparedStatement ps = null;
	    try {
	        conn = com.DongGu.db.DongGuDB.getConn();
	        
	        String sql = "INSERT INTO ANIMALINFO (ai_num, o_id, at_num, ai_name, ai_gender, ai_img, ai_birth, an_num_link, ai_alergy, ai_disease, ai_caution) " +
	                     "VALUES (seq_animalinfo_ai_num.NEXTVAL, ?, ?, ?, ?, ?, to_date(?, 'YYYY-MM-DD'), ?, ?, ?, ?)";
	        ps = conn.prepareStatement(sql);
	        
	        ps.setString(1, adto.getO_id());
	        ps.setInt(2, adto.getAt_num());
	        ps.setString(3, adto.getAi_name());
	        ps.setInt(4, adto.getAi_gender());
	        ps.setString(5, adto.getAi_img());
	        ps.setString(6, adto.getAi_birth()); // ai_birth는 "YYYY-MM-DD" 형식의 문자열이어야 함
	        ps.setString(7, adto.getAn_num_link());
	        ps.setString(8, adto.getAi_alergy());
	        ps.setString(9, adto.getAi_disease());
	        ps.setString(10, adto.getAi_caution());
	        
	        int count = ps.executeUpdate();
	        return count;
	    } catch(Exception e) {
	        e.printStackTrace();
	        return -1;
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch(Exception e2) {
	            e2.printStackTrace();
	        }
	    }
	}
	
}
