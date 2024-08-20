<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="fdto2" class="com.DongGu.friend.FriendDTO2"></jsp:useBean>
<jsp:setProperty property="*" name="fdto2"/>
<jsp:useBean id="fdao" class="com.DongGu.friend.FriendDAO" scope="session"></jsp:useBean>

<%
	int result = fdao.FriendSitterWrite(fdto2);
	//String result = fdao.FriendSitterWrite(fdto2);
	String msg = result>0?"초대에 응하셨습니다!":"초대에 응하지 못했습니다. 관리자에게 문의하세요.";
	//String msg = result;
%>
<script>
	//alert('1234');
	window.alert('<%=msg%>');
	location.href='/DongGu/saveForm/DetailDongGu.jsp';
</script>