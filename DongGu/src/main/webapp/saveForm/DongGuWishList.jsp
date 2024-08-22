<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DongGu.friend.InviteDAO" %>    
<%@ page import="com.DongGu.friend.InviteDTO" %>   
<jsp:useBean id="dao" class="com.DongGu.friend.InviteDAO"></jsp:useBean>
<jsp:useBean id="dto" class="com.DongGu.friend.InviteDTO"></jsp:useBean>
<%

int cp;
if(request.getParameter("cp")==null){
	cp=1;
}
else{
	cp = Integer.parseInt( request.getParameter("cp"));
}

String o_id = request.getParameter("o_id");
String sid = (String)session.getAttribute("sid");
Integer usertype = (Integer)session.getAttribute("usertype");
String i_num =  request.getParameter("i_num");

int result = dao.changeWishStatus(sid,i_num,usertype );

//삭제되거나 추가성공
if(result==1){
	%>
	<script>
	/* window.alert('성공'); */
	window.location.href="/DongGu/saveForm/DetailDongGu.jsp?i_num=<%=i_num%>&cp=<%=cp%>&o_id=<%=o_id%>";
	</script>
	
	<%
}
//안되면
else{
	%>
	<script>
	/* window.alert('[오류] 작성실패'); */
	window.location.href="/DongGu/saveForm/DetailDongGu.jsp?i_num=<%=i_num%>&cp=<%=cp%>&o_id=<%=o_id%>";
	</script>
	
	<%
}
%>