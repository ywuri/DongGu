<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="fdto" class="com.DongGu.friend.FriendDTO"></jsp:useBean>
<jsp:setProperty property="*" name="fdto"/>
<jsp:useBean id="fdao" class="com.DongGu.friend.FriendDAO" scope="session"></jsp:useBean>

<%
	int result = fdao.FriendOwnerWrite(fdto);
	//String result = fdao.FriendOwnerWrite(fdto);
	String msg = result>0?"글쓰기 성공!":"글쓰기 실패!";
	//String msg = result;
%>
<script>
	window.alert('<%=msg%>');
	location.href='FindDongGu.jsp';
</script>