package com.DongGu.board;

import java.sql.*;
import java.util.*;
import java.sql.Date;

public class FreeBoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	

	
	public FreeBoardDAO() {}
	
	
	/* 총 게시물 갯수 가져오기*/
	public int getFreeBoardCnt() {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql="select count(*) from free";
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
	public int getFreeBoardCnt(String search_type,String search_word) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql="";
			
			if("f_title".equals(search_type)) {
				sql="select count(*) "
						+ "    from free  "
						+ "    where f_title like ? "
						;
				
			}else if("f_content".equals(search_type)) {
				sql="select count(*) "
						+ "    from free  "
						+ "    where f_content like ? "
						;
			}else if("f_nickname".equals(search_type)) {
				sql="select count(*) "
						+ "    from free  "
						+ "    where f_nickname like ? "
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
	
	/* 글목록 가져오기, 댓글 말고 본글만 */
	public ArrayList<FreeBoardDTO> getFreeBoardList(int cp,int listSize){
		try {
			conn=com.DongGu.db.DongGuDB.getConn();
			//String sql="select * from free order by f_date desc";
			String sql ="select * "
					+ "from  "
					+ "(select rownum as rnum, a.* from  "
					+ "( "
					+ "		select * "
					+ "		from free "
					+ "		order by f_num desc )a "
					+ ")b "
					+ "where rnum >=? and rnum <=?";
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cp*listSize-(listSize-1));
			ps.setInt(2, cp*listSize);
			
			ArrayList<FreeBoardDTO> array = new ArrayList<>();
			rs = ps.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO( rs.getInt("f_num"),rs.getString("f_id"),
						rs.getString("f_nickname"),rs.getString("f_title"),rs.getString("f_date"),
						rs.getString("f_content"),rs.getInt("f_vcnt"),rs.getString("f_img"));
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
	
	/* 댓글갯수가 몇개인지 */
	public HashMap<Integer,Integer> getCommentCnt() {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql="select f_num, count(*) from freecomment group by f_num";
			
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			HashMap<Integer,Integer> map = new HashMap<>();
			
			while(rs.next()) {
				
				//댓글이없으면 아무것도 하지말아라
				map.put(rs.getInt(1), rs.getInt(2));
				
			}
			return map;
			
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
	
	
	/* free 상세페이지 */
	public FreeBoardDTO getFreeBoardDetail(int f_num) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "select * from free where f_num = ?";
			
			int up = upVcnt(f_num);
			ps=conn.prepareStatement(sql);
			ps.setInt(1, f_num);
			rs = ps.executeQuery();
			FreeBoardDTO dto = new FreeBoardDTO();
			//System.out.println("check");
			//System.out.println(f_num);
			
			if(rs.next()) {
				 dto = new FreeBoardDTO( rs.getInt("f_num"),rs.getString("f_id"),
						rs.getString("f_nickname"),rs.getString("f_title"),rs.getString("f_date"),
						rs.getString("f_content"),rs.getInt("f_vcnt"),rs.getString("f_img"));
				
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
	
	
	/* 상세에서 댓글 가져오기 */
	public ArrayList<FreeCommentDTO> getCommentList(int f_ref){
		try {
			conn=com.DongGu.db.DongGuDB.getConn();
			String sql="select * "
					+ "from freecomment "
					+ "where f_num = ? "
					+ " order by fc_ref desc, fc_sunbun ";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, f_ref);
			rs =ps.executeQuery();
			
			ArrayList<FreeCommentDTO> array2 =new ArrayList<>();
			while(rs.next()) {
				
				FreeCommentDTO dto = new FreeCommentDTO(
						rs.getInt("fc_num"),rs.getInt("f_num"),rs.getString("fc_id"),rs.getString("fc_nickname"),
						rs.getString("fc_content"),rs.getString("fc_date"),rs.getInt("fc_ref"),rs.getInt("fc_lev"),
						rs.getInt("fc_sunbun") ,rs.getString("fc_img"));
				array2.add(dto);
			}
			
			return array2;
			
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
	
	/* 상세게시글에서 전 / 후 게시글 보여주기 */
	public ArrayList<FreeBoardDTO> getNextFreeBoard(int f_num){
		try {
			ArrayList<FreeBoardDTO> array = new ArrayList<>();
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql = "SELECT f_num, f_title "
					+ "from "
					+ "( "
					+ "select f_num,f_title "
					+ "from free "
					+ "where f_num > ?"
					+ "order by f_num  "
					+ ") "
					+ "where rownum=1 "
					+ "union "
					+ "SELECT f_num, f_title "
					+ "from "
					+ "( "
					+ "select f_num,f_title "
					+ "from free "
					+ "where f_num < ?  "
					+ "order by f_num desc "
					+ ") "
					+ "where rownum=1 ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, f_num);
			ps.setInt(2, f_num);
			rs=ps.executeQuery();
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO(rs.getInt(1),rs.getString(2));
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
	public int upVcnt(int f_num) {
		try {
			String sql="select f_vcnt from free where f_num=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, f_num);
			rs = ps.executeQuery();
			int cnt=0;
			if(rs.next()) cnt=rs.getInt(1);
			
			String sql2 = "update free set f_vcnt=? where f_num=?";
			ps=conn.prepareStatement(sql2);
			ps.setInt(1, cnt+1);
			ps.setInt(2, f_num);
			
			int result = ps.executeUpdate();
			return result;
			
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	
	/* 해당글에 위시리스트 체크 했는지*/
	public int isWishList(int f_num,String sid) {
		try {
			conn=com.DongGu.db.DongGuDB.getConn();
			String sql="select count(*) from wishlist where wt_num_value=? and w_id=? and wt_num=?";
			ps =conn.prepareStatement(sql);
			ps.setInt(1, f_num);
			ps.setString(2, sid);
			ps.setInt(3, 40);
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
	
	
	/* 위시리스트 추가 또는 삭제*/
	public int changeWishStatus(String sid,String f_num) {
		
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql="select count(*) from wishlist where w_id=? and wt_num=? and wt_num_value=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, sid);
			ps.setInt(2, 40);
			ps.setString(3, f_num);
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
				ps.setInt(2, 40);
				ps.setString(3, f_num );
			}
			//위시리스트에 없으면 추가
			else if(isEx==0) {
				
				sql =" insert into wishlist values(seq_wishlist_w_num.nextval, ?, ?, ?,?)";
				//////////////////////////이거수정////////////////
				ps = conn.prepareStatement(sql);
				ps.setString(1, sid);
				ps.setInt(2, 0);//////////////////////////이거수정////////////////
				ps.setInt(3, 40);
				ps.setString(4, f_num);
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
            String sql = "SELECT MAX(fc_ref) FROM freecomment";
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
	
	

	/* free 글 작성하기(답글아님)*/
	public int WriteFreeBoard(FreeBoardDTO dto) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			
			String sql ="insert into free(f_num, f_id, f_nickname, f_title, f_date, f_content, f_vcnt, f_img) "
					+ " values(seq_free_f_num.nextval,?,?,?,sysdate,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getF_id());
			ps.setString(2, dto.getF_nickname());
			ps.setString(3,dto.getF_title());
			ps.setString(4, dto.getF_content());
			ps.setInt(5, 0);
			ps.setString(6, dto.getF_img());
			
			

			
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
	
	
	/* 사진이름 변경을 위해 sequnce번호 가져오기 */
	public int getSequnceNumForImg() {
		try {
			conn =com.DongGu.db.DongGuDB.getConn();
			String sql="SELECT seq_free_f_img.NEXTVAL FROM dual";
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int result=0;
			if(rs.next()) {
				result=rs.getInt(1);
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
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	/* 사진이름 변경을 위해 sequnce번호 가져오기 (댓글) */
	public int getSequnceNumForImgComment() {
		try {
			conn =com.DongGu.db.DongGuDB.getConn();
			String sql="SELECT seq_freecomment_fc_img.NEXTVAL FROM dual";
			ps=conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int result=0;
			if(rs.next()) {
				result=rs.getInt(1);
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
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	/* 댓글 작성하기(대댓아님) */
	public int ReWriteFreeBoard(FreeCommentDTO dto) {
		try {
			conn= com.DongGu.db.DongGuDB.getConn();
			int max = getMaxRef();
			String sql="insert into freecomment  "
					+ "values(seq_freecomment_fc_num.nextval,?,?,?,?,sysdate,?,?,?,?)";
			
						
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getF_num());
			ps.setString(2, dto.getFc_id());
			ps.setString(3, dto.getFc_nickname());
			ps.setString(4, dto.getFc_content());
			ps.setInt(5, max+1);
			ps.setInt(6, 0);
			ps.setInt(7, 0);
			ps.setString(8, dto.getFc_img());
			
			
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
	
	

	
	
	/* 댓글 작성 전 sunbun 업데이트*/
	public int ReWriteFreeCommentSunbun(int fc_ref,int fc_sunbun) {
		try {
			String sql="update freecomment set fc_sunbun=fc_sunbun+1 where fc_ref=? and fc_sunbun>=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, fc_ref);
			ps.setInt(2, fc_sunbun);
			
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
	
	/* 댓글 작성하기(대댓) */
	public int ReReWriteFreeBoard(FreeCommentDTO dto) {
		try {
			conn= com.DongGu.db.DongGuDB.getConn();
			int updateSunbun = ReWriteFreeCommentSunbun(dto.getFc_ref(),dto.getFc_sunbun()+1);
			int max = getMaxRef();
			String sql="insert into freecomment  "
					+ "values(seq_freecomment_fc_num.nextval,?,?,?,?,sysdate,?,?,?,?)";
			

			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getF_num());
			ps.setString(2, dto.getFc_id());
			ps.setString(3, dto.getFc_nickname());
			ps.setString(4, dto.getFc_content());
			ps.setInt(5, dto.getFc_ref());
			ps.setInt(6, dto.getFc_lev()+1);
			ps.setInt(7, dto.getFc_sunbun()+1);
			ps.setString(8, dto.getFc_img());
			
			/*
			 	ref : 그룹번호 (1번의 글의 답글인지 2번글의 답글인지. 누구 소속인지)
				lev: 들여쓰기횟수 (0이면 본문,1번이면 본문의 대한 답변)
				sunbun(step): 본문내에 순서. (1번본문의 답글이 2개 달리면 걔의 순서)
				
			 	1. 본문 글쓰기를 할떄는 ref는 1씩 증가하고, level과 sunbun은 무조건 0으로 초기화
				2. 답변글을 쓸떈(답변의 답변이라도) ref는 동일, level과 순번은 1씩 증가
				3. 답변글을 쓸때 같은 그룹내의 다른 답변들이 sunbun과 동일하거나 크다면, sunbun 무조건 1씩  증가
			  */
			
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
	
	
	/* 검색하기 */
	public ArrayList<FreeBoardDTO> searchFreeBoard(String search_type,String search_word,int cp,int listSize){
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql="";
			if("f_title".equals(search_type)) {
				sql="select * "
						+ "from "
						+ "(select rownum as rnum, a.* from  "
						+ "( "
						+ "    select *  "
						+ "    from free  "
						+ "    where f_title like ? "
						+ "    order by f_ref desc, f_sunbun)a  "
						+ ")b "
						+ "where rnum >=? and rnum <=?";
				
			}else if("f_content".equals(search_type)) {
				sql="select * "
						+ "from "
						+ "(select rownum as rnum, a.* from  "
						+ "( "
						+ "    select *  "
						+ "    from free  "
						+ "    where f_content like ? "
						+ "    order by f_ref desc, f_sunbun)a  "
						+ ")b "
						+ "where rnum >=? and rnum <=?";
			}else if("f_nickname".equals(search_type)) {
				sql="select * "
						+ "from "
						+ "(select rownum as rnum, a.* from  "
						+ "( "
						+ "    select *  "
						+ "    from free  "
						+ "    where f_nickname like ? "
						+ "    order by f_ref desc, f_sunbun)a  "
						+ ")b "
						+ "where rnum >=? and rnum <=?";
			}
			ps =conn.prepareStatement(sql);
			ps.setString(1, "%"+search_word+"%");
			
			ps.setInt(2, cp*listSize-(listSize-1));
			ps.setInt(3, cp*listSize);
			
			//System.out.println("search_type" +search_type);
			//System.out.println("search_word" +search_word);
			
			ArrayList<FreeBoardDTO>array = new ArrayList<>();
			rs=ps.executeQuery();
			
			while(rs.next()) {
				FreeBoardDTO dto = new FreeBoardDTO();
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
	public int updateFreeBoard(FreeBoardDTO dto) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			String sql ="update free set f_title=?, f_content=? where f_num=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,dto.getF_title());
			ps.setString(2,dto.getF_content());
			ps.setInt(3,dto.getF_num());
			
			int result =ps.executeUpdate();
			
			return result;

		}catch (SQLException e) {
	        e.printStackTrace();
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
	
	/* 삭제하기
	public int deleteFreeBoard(FreeBoardDTO dto) {
		try {
			conn = com.DongGu.db.DongGuDB.getConn();
			
			//답글이 있는 게시글인지 아닌지 판명하기
			int num = hasReWrite(dto.getF_ref());
			//System.out.println("num ="+num);
			//System.out.println("dto.getF_ref() ="+dto.getF_ref());
			
			//만약 삭제할 게시글에 답글이 있다면 게시글 내용만 삭제된 게시글입니다로 변경.작성자도 변경
			if(dto.getF_sunbun()==0 && num>=2) {
				String sql = "update free set f_content=?,f_id=?,f_nickname=? where f_num=? ";
				ps=conn.prepareStatement(sql);
				ps.setString(1, "삭제된 게시글입니다.");
				ps.setString(2," ");
				ps.setString(3," ");
				ps.setInt(4, dto.getF_num());
			}
			//답글이면, 또는 답글이 안달린 글이면. !!!! 여기서 마지막 답글이 사라진거면 본글도 사라지게!! 
			
			//답글이 안달린 원글이면
			else if(dto.getF_sunbun()==0 && num==1) {
				String sql="delete from free where f_ref=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, dto.getF_ref());
			}
			
			//답글이면 
			else {
				
				String sql="";
				int status =isMainDelete(dto.getF_ref());
				
				
				//원글이 삭제된 답글이면
				if(status==1 && num==2) {
					sql="delete from free where f_ref=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, dto.getF_ref());
				}
				//그냥 답글이면
				else {
					sql="delete from free where f_num=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, dto.getF_num());
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
	 */
	/* 같은 그룹 게시물 갯수 알아오기 
	public int hasReWrite(int f_ref) {
		
		try {
			String ssql="select count(*) from free where f_ref=?";
			ps = conn.prepareStatement(ssql);
			ps.setInt(1, f_ref);
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
	*/
	/* 삭제하는 답글이, 이미 원글이 지워졌는지 알아오기
	public int isMainDelete(int f_ref) {
		
		try {
			String ssql="select count(*) from free where f_ref=? and f_id=?";
			ps = conn.prepareStatement(ssql);
			ps.setInt(1, f_ref);
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
	 */
}
