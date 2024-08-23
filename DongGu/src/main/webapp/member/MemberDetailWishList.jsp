<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DongGu.mypage.MyPageDAO" %>    
<%@ page import="com.DongGu.mypage.MyPageDTO" %>  

 <jsp:useBean id="dao" class="com.DongGu.mypage.MyPageDAO"></jsp:useBean>
<%


String review_id = request.getParameter("review_id");
String m_sid = request.getParameter("m_sid");
String id_check =  request.getParameter("id_check");

int result = dao.changeWishStatus(review_id,m_sid,request.getParameter("id_check").equals("0")?"1":"0" );

int id_check_int = Integer.parseInt(id_check);

//삭제되거나 추가성공
if(result==1){
	%>
	<script>
	/* window.alert('성공'); */
	let param = "<%= (id_check_int == 0) ? "o_id=" + review_id : "p_id=" + review_id %>";
	window.location.href = "/DongGu/member/MemberDetail.jsp?usertype=<%= id_check_int %>&" + param;

	</script>
	
	<%
}
//안되면
else{
	%>
	<script>
	/* window.alert('[오류] 작성실패'); */
	let param = "<%= (id_check_int == 0) ? "o_id=" + review_id : "p_id=" + review_id %>";
	window.location.href = "/DongGu/member/MemberDetail.jsp?usertype=<%= id_check_int %>&" + param;
	</script>
	
	<%
}
%>