<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="fdto" class="com.DongGu.friend.FriendDTO"></jsp:useBean>
<jsp:setProperty property="*" name="fdto"/>
<jsp:useBean id="fdao" class="com.DongGu.friend.FriendDAO" scope="session"></jsp:useBean>

<%
	int result = fdao.FriendOwnerWrite(fdto);
	//String result = fdao.FriendOwnerWrite(fdto);
	String msg = result>0?"초대장이 등록되었습니다!":"초대장 등록이 되지 않았습니다. 관리자에게 문의하세요.";
	//String msg = result;
%>
<script>
	window.alert('<%=msg%>');
	location.href='/DongGu/saveForm/FindDongGu.jsp';
</script>