<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ page import="com.DongGu.mypage.MyPageDAO" %>    
<%@ page import="com.DongGu.mypage.MyPageDTO" %>
<jsp:useBean id="dto" class="com.DongGu.mypage.MyPageDTO"></jsp:useBean>  
<jsp:setProperty property="*" name="dto"/>  
<jsp:useBean id="dao" class="com.DongGu.mypage.MyPageDAO"></jsp:useBean>

<%
   String m_sid = (String)session.getAttribute("sid");
   String m_sname = (String)session.getAttribute("sname");
%>   
<%
	// request에서 parameter 값 가져오기
	String p_ex_my = request.getParameter("ta_p_ex_my");
	String p_ex_other = request.getParameter("ta_p_ex_other");
	String p_ex_etc = request.getParameter("ta_p_ex_etc");
    
	// DTO에 값 설정
    dto.setP_ex_my(p_ex_my);
    dto.setP_ex_other(p_ex_other);
    dto.setP_ex_etc(p_ex_etc);

 	// DAO를 통해 데이터베이스 업데이트
    int result = dao.mypage_ApplyManage3(dto, m_sid);
    
    if(result==1){
%>
    	<script>
		window.alert('기본 지원서가 성공으로 수정되었습니다!');
		location.href='/DongGu/mypage/MyPage_ApplyManage.jsp';
		</script>
<%
    }else{
%>
    	<script>
		window.alert('기본 지원서 수정에 실패하였습니다!');
		location.href='/DongGu/mypage/MyPage_ApplyManage_Update.jsp';
		</script>
<%   	
    } 
%>