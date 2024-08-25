package com.DongGu.board;

import java.sql.*;
import java.util.*;
import java.sql.Date;
import java.sql.PreparedStatement;

public class NoticeDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	

	
	public NoticeDAO() {}
	
	
	/* 총 게시물 갯수 가져오기*/
	public int getNoticeCnt() {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql="select count(*) from notice";
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
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	
	/* 검색결과 게시물 갯수 가져오기*/
	public int getNoticeCnt(String search_type,String search_word) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql="";
			
			if("n_title".equals(search_type)) {
				sql="select count(*) "
						+ "    from notice  "
						+ "    where n_title like ? "
						;
				
			}else if("n_content".equals(search_type)) {
				sql="select count(*) "
						+ "    from notice  "
						+ "    where n_content like ? "
						;
			}else if("n_nickname".equals(search_type)) {
				sql="select count(*) "
						+ "    from notice  "
						+ "    where n_nickname like ? "
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
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	/* 글목록 가져오기 */
	public ArrayList<NoticeDTO> getNoticeList(int cp,int listSize){
		try {
			conn=com.DongGu.db.DongGuDB.getConn();
			//String sql="select * from notice order by n_date desc";
			String sql ="select * "
					+ "from "
					+ "(select rownum as rnum, a.* from "
					+ "( "
					+ "    select *  "
					+ "    from notice  "
					+ "    order by n_ref desc, n_sunbun)a "
					+ ")b "
					+ "where rnum >= ?and rnum <=?";
			
			
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cp*listSize-(listSize-1));
			ps.setInt(2, cp*listSize);
			
			ArrayList<NoticeDTO> array = new ArrayList<>();
			rs = ps.executeQuery();
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO(rs.getInt("n_num"),rs.getString("n_id"),rs.getString("n_nickname"),
						rs.getString("n_title"),rs.getDate("n_date"),rs.getString("n_content"),rs.getInt("n_vcnt"),
						rs.getInt("n_ref"),rs.getInt("n_lev"),rs.getInt("n_sunbun"));
				
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
	
	
	/* notice 상세페이지 */
	public NoticeDTO getNoticeDetail(int n_num) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "select n_content, n_id, n_nickname, n_date, n_vcnt, n_title,n_ref,n_lev,n_sunbun from notice where n_num = ?";
			
			int up = upVcnt(n_num);
			ps=conn.prepareStatement(sql);
			ps.setInt(1, n_num);
			rs = ps.executeQuery();
			NoticeDTO dto = new NoticeDTO();
			//System.out.println("check");
			//System.out.println(n_num);
			
			if(rs.next()) {
				dto.setN_content(rs.getString(1));
				
				dto.setN_id(rs.getString(2));
				dto.setN_nickname(rs.getString(3));
				dto.setN_date(rs.getDate(4));
				dto.setN_vcnt(rs.getInt(5));
				dto.setN_title(rs.getString(6));
				dto.setN_ref(rs.getInt(7));
				dto.setN_lev(rs.getInt(8));
				dto.setN_sunbun(rs.getInt(9));
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
	
	
	/* 상세게시글에서 전 / 후 게시글 보여주기 */
	public ArrayList<NoticeDTO> getNextNotice(int n_num){
		try {
			ArrayList<NoticeDTO> array = new ArrayList<>();
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "SELECT n_num, n_title "
					+ "from "
					+ "( "
					+ "select n_num,n_title "
					+ "from notice "
					+ "where n_num > ?"
					+ "order by n_num  "
					+ ") "
					+ "where rownum=1 "
					+ "union "
					+ "SELECT n_num, n_title "
					+ "from "
					+ "( "
					+ "select n_num,n_title "
					+ "from notice "
					+ "where n_num < ?  "
					+ "order by n_num desc "
					+ ") "
					+ "where rownum=1 ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, n_num);
			ps.setInt(2, n_num);
			rs=ps.executeQuery();
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO(rs.getInt(1),rs.getString(2));
				array.add(dto);
			}
			return array;
			
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				rs.close();
				ps.close();
				conn.close();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/* 조회수 늘리기*/
	public int upVcnt(int n_num) {
		try {
			String sql="select n_vcnt from notice where n_num=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, n_num);
			rs = ps.executeQuery();
			int cnt=0;
			if(rs.next()) cnt=rs.getInt(1);
			
			String sql2 = "update notice set n_vcnt=? where n_num=?";
			ps=conn.prepareStatement(sql2);
			ps.setInt(1, cnt+1);
			ps.setInt(2, n_num);
			
			int result = ps.executeUpdate();
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	
	/* 해당글에 위시리스트 체크 했는지, 공지사항은 위시리스트 없앰*/
	/*
	public int isWishList(int n_num,String sid) {
		try {
			conn=com.DongGu.db.DongGuDB.getConn();
			String sql="select count(*) from wishlist where wt_num_value=? and w_id=? and wt_num=?";
			ps =conn.prepareStatement(sql);
			ps.setInt(1, n_num);
			ps.setString(2, sid);
			ps.setInt(3, 10);
			/////////////추후수정////////
			rs = ps.executeQuery();
			
			int result=0;
			if(rs.next()) {
				result = rs.getInt(1);
			}
			return result;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	*/
	
	/* 위시리스트 추가 또는 삭제, 공지사항은 위시리스트 삭제*/
	/*
	public int changeWishStatus(String sid,String n_num) {
		
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql="select count(*) from wishlist where w_id=? and wt_num=? and wt_num_value=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sid);
			ps.setInt(2, 10);
			ps.setString(3, n_num);
			///////나중에수정///////
			
			
			rs = ps.executeQuery();
			int isEx=0;
			if(rs.next()) {
				isEx = rs.getInt(1);
			}
			
			
			//위시리스트에 있으면 지우기
			if(isEx>=1) {
				sql = "delete from wishlist where w_id=? and wt_num=? and wt_num_value=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, sid);
				ps.setInt(2, 10);
				ps.setString(3, n_num );
			}
			//위시리스트에 없으면 추가
			else if(isEx==0) {
				
				sql =" insert into wishlist values(sen_wishlist_w_num.nextval, ?, ?, ?,?)";
				//////////////////////////이거수정////////////////
				ps = conn.prepareStatement(sql);
				ps.setString(1, sid);
				ps.setInt(2, 0);//////////////////////////이거수정////////////////
				ps.setInt(3, 10);
				ps.setString(4, n_num);
			}
			
			int result = ps.executeUpdate();
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	/* ref 알기 */
	
	public int getMaxRef() {
	    int num = 0;
        try {
            String sql = "SELECT MAX(n_ref) FROM notice";
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                num = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("here");
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return num;
    }
	
	

	/* notice 글 작성하기(답글아님)*/
	public int WriteNotice(NoticeDTO dto) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			int max = getMaxRef();
			String sql ="insert into notice(n_num, n_id, n_nickname, n_title, n_date, n_content, n_vcnt,n_ref, n_lev, n_sunbun)  values(seq_notice_n_num.nextval,?,?,?,sysdate,?,0,?,0,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getN_id());
			ps.setString(2, dto.getN_nickname());
			ps.setString(3,dto.getN_title());
			ps.setString(4, dto.getN_content());
			ps.setInt(5, max+1);
			//ref??

			/*
			private int n_ref ;// 그룹번호(1번의 글의 답글인지 2번글의 답글인지. 누구 소속인지) 
			private int n_lev; //들여쓰기횟수 (0이면 본문,1번이면 본문의 대한 답변) 
			private int n_sunbun;// 본문내에 순서. (1번본문의 답글이 2개 달리면 걔의 순서) 
			*/
			
			int result = ps.executeUpdate();
			return result;

		}catch (Exception e) {
	        e.printStackTrace();
	        System.out.println("here2");
	        return 0;
	    } finally {
	        // 자원 정리
	 
	        try {
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	} 
	
	
	
	/* 답글 작성 전 sunbun 업데이트*/
	/*
	public int ReWriteNoticeSunbun(int n_ref,int n_sunbun) {
		try {
			String sql="update notice set n_sunbun=n_sunbun+1 where n_ref=? and n_sunbun>=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, n_ref);
			ps.setInt(2, n_sunbun);
			
			int result = ps.executeUpdate();
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				ps.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	*/
	
	/* 답글 작성하기 */
	/*
	public int ReWriteNotice(NoticeDTO dto) {
		try {
			conn= com.DongGu.db.DongGuDB.getConn();
			int updateSunbun = ReWriteNoticeSunbun(dto.getN_ref(),dto.getN_sunbun()+1);
			
			String sql="insert into notice(n_num, n_id, n_nickname, n_title, n_date, n_content, n_vcnt,n_ref, n_lev, n_sunbun)  "
					+ "values(sen_notice_n_num.nextval,?,?,?,sysdate,?,0,?,?,?)";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getN_id());
			ps.setString(2, dto.getN_nickname());
			ps.setString(3,dto.getN_title());
			ps.setString(4, dto.getN_content());
			ps.setInt(5, dto.getN_ref());
			
			ps.setInt(6, dto.getN_lev()+1);
			ps.setInt(7, dto.getN_sunbun()+1);
			
			/*
			 	ref : 그룹번호 (1번의 글의 답글인지 2번글의 답글인지. 누구 소속인지)
				lev: 들여쓰기횟수 (0이면 본문,1번이면 본문의 대한 답변)
				sunbun(step): 본문내에 순서. (1번본문의 답글이 2개 달리면 걔의 순서)
				
			 	1. 본문 글쓰기를 할떄는 ref는 1씩 증가하고, level과 sunbun은 무조건 0으로 초기화
				2. 답변글을 쓸떈(답변의 답변이라도) ref는 동일, level과 순번은 1씩 증가
				3. 답변글을 쓸때 같은 그룹내의 다른 답변들이 sunbun과 동일하거나 크다면, sunbun 무조건 1씩  증가
			  */
			/*
			int result = ps.executeUpdate();
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				
				ps.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	*/
	
	/* 검색하기 */
	public ArrayList<NoticeDTO> searchNotice(String search_type,String search_word,int cp,int listSize){
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql="";
			if("n_title".equals(search_type)) {
				sql="select * "
						+ "from "
						+ "(select rownum as rnum, a.* from  "
						+ "( "
						+ "    select *  "
						+ "    from notice  "
						+ "    where n_title like ? "
						+ "    order by n_ref desc, n_sunbun)a  "
						+ ")b "
						+ "where rnum >=? and rnum <=?";
				
			}else if("n_content".equals(search_type)) {
				sql="select * "
						+ "from "
						+ "(select rownum as rnum, a.* from  "
						+ "( "
						+ "    select *  "
						+ "    from notice  "
						+ "    where n_content like ? "
						+ "    order by n_ref desc, n_sunbun)a  "
						+ ")b "
						+ "where rnum >=? and rnum <=?";
			}else if("n_nickname".equals(search_type)) {
				sql="select * "
						+ "from "
						+ "(select rownum as rnum, a.* from  "
						+ "( "
						+ "    select *  "
						+ "    from notice  "
						+ "    where n_nickname like ? "
						+ "    order by n_ref desc, n_sunbun)a  "
						+ ")b "
						+ "where rnum >=? and rnum <=?";
			}
			ps =conn.prepareStatement(sql);
			ps.setString(1, "%"+search_word+"%");
			
			ps.setInt(2, cp*listSize-(listSize-1));
			ps.setInt(3, cp*listSize);
			
			//System.out.println("search_type" +search_type);
			//System.out.println("search_word" +search_word);
			
			ArrayList<NoticeDTO>array = new ArrayList<>();
			rs=ps.executeQuery();
			
			while(rs.next()) {
				NoticeDTO dto = new NoticeDTO(rs.getInt("n_num"),rs.getString("n_id"),rs.getString("n_nickname"),
						rs.getString("n_title"),rs.getDate("n_date"),rs.getString("n_content"),rs.getInt("n_vcnt"),
						rs.getInt("n_ref"),rs.getInt("n_lev"),rs.getInt("n_sunbun"));
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
	
	/* 수정하기 */
	public int updateNotice(NoticeDTO dto) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql ="update notice set n_title=?, n_content=? where n_num=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,dto.getN_title());
			ps.setString(2,dto.getN_content());
			ps.setInt(3,dto.getN_num());
			
			int result =ps.executeUpdate();
			
			return result;

		}catch (Exception e) {
	        e.printStackTrace();
	        return 0;
	    } finally {
	        // 자원 정리
	 
	        try {
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	} 
	
	/* 삭제하기 */
	public int deleteNotice(NoticeDTO dto) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			
			//답글이 있는 게시글인지 아닌지 판명하기
			int num = hasReWrite(dto.getN_ref());
			//System.out.println("num ="+num);
			//System.out.println("dto.getN_ref() ="+dto.getN_ref());
			
			//만약 삭제할 게시글에 답글이 있다면 게시글 내용만 삭제된 게시글입니다로 변경.작성자도 변경
			if(dto.getN_sunbun()==0 && num>=2) {
				String sql = "update notice set n_content=?,n_id=?,n_nickname=? where n_num=? ";
				ps=conn.prepareStatement(sql);
				ps.setString(1, "삭제된 게시글입니다.");
				ps.setString(2," ");
				ps.setString(3," ");
				ps.setInt(4, dto.getN_num());
			}
			//답글이면, 또는 답글이 안달린 글이면. !!!! 여기서 마지막 답글이 사라진거면 본글도 사라지게!! 
			
			//답글이 안달린 원글이면
			else if(dto.getN_sunbun()==0 && num==1) {
				String sql="delete from notice where n_ref=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, dto.getN_ref());
			}
			
			//답글이면 
			else {
				
				String sql="";
				int status =isMainDelete(dto.getN_ref());
				
				
				//원글이 삭제된 답글이면
				if(status==1 && num==2) {
					sql="delete from notice where n_ref=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, dto.getN_ref());
				}
				//그냥 답글이면
				else {
					sql="delete from notice where n_num=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, dto.getN_num());
				}
				
			}
			int result= ps.executeUpdate();
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				ps.close();
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	/* 같은 그룹 게시물 갯수 알아오기 */
	public int hasReWrite(int n_ref) {
		
		try {
			String ssql="select count(*) from notice where n_ref=?";
			ps = conn.prepareStatement(ssql);
			ps.setInt(1, n_ref);
			//ps.setString(2, " ");
			rs=ps.executeQuery();
			int num =0;
			if(rs.next()) {
				num=rs.getInt(1);
			}
			
			return num;
			
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				ps.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	/* 삭제하는 답글이, 이미 원글이 지워졌는지 알아오기 */
	public int isMainDelete(int n_ref) {
		
		try {
			String ssql="select count(*) from notice where n_ref=? and n_id=?";
			ps = conn.prepareStatement(ssql);
			ps.setInt(1, n_ref);
			ps.setString(2, " ");
			rs=ps.executeQuery();
			int num =0;
			if(rs.next()) {
				num=rs.getInt(1);
			}
			
			return num;
			
		}catch(Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				ps.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
}
