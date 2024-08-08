package com.DongGu.board;

import java.sql.*;
import java.util.*;
import java.sql.Date;

public class QnABoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	

	
	public QnABoardDAO() {}
	
	
	/* 총 게시물 갯수 가져오기*/
	public int getQnABoardCnt() {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql="select count(*) from qna";
			ps =conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int result=0;
			
			if(rs.next()) { 
				result=rs.getInt(1);
			}
			
			
			//System.out.println(result);
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	
	/* 검색결과 게시물 갯수 가져오기*/
	public int getQnABoardCnt(String search_type,String search_word) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql="";
			
			if("q_title".equals(search_type)) {
				sql="select count(*) "
						+ "    from qna  "
						+ "    where q_title like ? "
						;
				
			}else if("q_content".equals(search_type)) {
				sql="select count(*) "
						+ "    from qna  "
						+ "    where q_content like ? "
						;
			}else if("q_nickname".equals(search_type)) {
				sql="select count(*) "
						+ "    from qna  "
						+ "    where q_nickname like ? "
						;
			}
			
			ps =conn.prepareStatement(sql);
			ps.setString(1, "%"+search_word+"%");
			rs = ps.executeQuery();
			int result=0;
			
			if(rs.next()) { 
				result=rs.getInt(1);
			}
			
			
			//System.out.println(result);
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	/* 글목록 가져오기 */
	public ArrayList<QnABoardDTO> getQnABoardList(int cp,int listSize){
		try {
			conn=com.DongGu.db.DongGuDB.getConn();
			//String sql="select * from qna order by q_date desc";
			String sql ="select * "
					+ "from "
					+ "(select rownum as rnum, a.* from "
					+ "( "
					+ "    select *  "
					+ "    from qna  "
					+ "    order by q_ref desc, q_sunbun)a "
					+ ")b "
					+ "where rnum >= ?and rnum <=?";
			
			
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cp*listSize-(listSize-1));
			ps.setInt(2, cp*listSize);
			
			ArrayList<QnABoardDTO> array = new ArrayList<>();
			rs = ps.executeQuery();
			while(rs.next()) {
				QnABoardDTO dto = new QnABoardDTO(rs.getInt("q_num"),rs.getString("q_id"),rs.getString("q_nickname"),
						rs.getString("q_title"),rs.getDate("q_date"),rs.getString("q_content"),rs.getInt("q_vcnt"),
						rs.getInt("q_ref"),rs.getInt("q_lev"),rs.getInt("q_sunbun"));
				
				array.add(dto);
		
			}
			return array;
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
	}
	
	
	/* qna 상세페이지 */
	public QnABoardDTO getQnABoardDetail(int q_num) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "select q_content, q_id, q_nickname, q_date, q_vcnt, q_title from qna where q_num = ?";
			
			int up = upVcnt(q_num);
			ps=conn.prepareStatement(sql);
			ps.setInt(1, q_num);
			rs = ps.executeQuery();
			QnABoardDTO dto = new QnABoardDTO();
			//System.out.println("check");
			//System.out.println(q_num);
			
			if(rs.next()) {
				dto.setQ_content(rs.getString(1));
				
				dto.setQ_id(rs.getString(2));
				dto.setQ_nickname(rs.getString(3));
				dto.setQ_date(rs.getDate(4));
				dto.setQ_vcnt(rs.getInt(5));
				dto.setQ_title(rs.getString(6));
			}
			return dto;
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("e1");
			return null;
			
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch (Exception e) {
				e.printStackTrace();
				
			}
		}
	}
	
	/* 조회수 늘리기*/
	public int upVcnt(int q_num) {
		try {
			String sql="select q_vcnt from qna where q_num=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, q_num);
			rs = ps.executeQuery();
			int cnt=0;
			if(rs.next()) cnt=rs.getInt(1);
			
			String sql2 = "update qna set q_vcnt=? where q_num=?";
			ps=conn.prepareStatement(sql2);
			ps.setInt(1, cnt+1);
			ps.setInt(2, q_num);
			
			int result = ps.executeUpdate();
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	
	
	
	/* ref 알기 */
	public int getMaxRef() {
	    int num = 0;
        try {
            String sql = "SELECT MAX(q_ref) FROM qna";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                num = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("here");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return num;
    }

	/* qna 글 작성하기(답글아님)*/
	public int WriteQnABoard(QnABoardDTO dto) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			int max = getMaxRef();
			String sql ="insert into qna(q_num, q_id, q_nickname, q_title, q_date, q_content, q_vcnt,q_ref, q_lev, q_sunbun)  values(seq_qna_q_num.nextval,?,?,?,sysdate,?,0,?,0,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getQ_id());
			ps.setString(2, dto.getQ_nickname());
			ps.setString(3,dto.getQ_title());
			ps.setString(4, dto.getQ_content());
			ps.setInt(5, max+1);
			//ref??

			/*
			private int q_ref ;// 그룹번호(1번의 글의 답글인지 2번글의 답글인지. 누구 소속인지) 
			private int q_lev; //들여쓰기횟수 (0이면 본문,1번이면 본문의 대한 답변) 
			private int q_sunbun;// 본문내에 순서. (1번본문의 답글이 2개 달리면 걔의 순서) 
			*/
			
			int result = ps.executeUpdate();
			return result;

		}catch (SQLException e) {
	        e.printStackTrace();
	        System.out.println("here2");
	        return 0;
	    } finally {
	        // 자원 정리
	 
	        try {
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	} 
	
	
	/* 검색하기 */
	public ArrayList<QnABoardDTO> searchQnABoard(String search_type,String search_word,int cp,int listSize){
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql="";
			if("q_title".equals(search_type)) {
				sql="select * "
						+ "from "
						+ "(select rownum as rnum, a.* from  "
						+ "( "
						+ "    select *  "
						+ "    from qna  "
						+ "    where q_title like ? "
						+ "    order by q_ref desc, q_sunbun)a  "
						+ ")b "
						+ "where rnum >=? and rnum <=?";
				
			}else if("q_content".equals(search_type)) {
				sql="select * "
						+ "from "
						+ "(select rownum as rnum, a.* from  "
						+ "( "
						+ "    select *  "
						+ "    from qna  "
						+ "    where q_content like ? "
						+ "    order by q_ref desc, q_sunbun)a  "
						+ ")b "
						+ "where rnum >=? and rnum <=?";
			}else if("q_nickname".equals(search_type)) {
				sql="select * "
						+ "from "
						+ "(select rownum as rnum, a.* from  "
						+ "( "
						+ "    select *  "
						+ "    from qna  "
						+ "    where q_nickname like ? "
						+ "    order by q_ref desc, q_sunbun)a  "
						+ ")b "
						+ "where rnum >=? and rnum <=?";
			}
			ps =conn.prepareStatement(sql);
			ps.setString(1, "%"+search_word+"%");
			
			ps.setInt(2, cp*listSize-(listSize-1));
			ps.setInt(3, cp*listSize);
			
			//System.out.println("search_type" +search_type);
			//System.out.println("search_word" +search_word);
			
			ArrayList<QnABoardDTO>array = new ArrayList<>();
			rs=ps.executeQuery();
			
			while(rs.next()) {
				QnABoardDTO dto = new QnABoardDTO(rs.getInt("q_num"),rs.getString("q_id"),rs.getString("q_nickname"),
						rs.getString("q_title"),rs.getDate("q_date"),rs.getString("q_content"),rs.getInt("q_vcnt"),
						rs.getInt("q_ref"),rs.getInt("q_lev"),rs.getInt("q_sunbun"));
				array.add(dto);
			}
		
			return array;
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
