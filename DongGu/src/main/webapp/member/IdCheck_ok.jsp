<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="com.DongGu.member.memberDAO"></jsp:useBean>
<jsp:useBean id="mdto" class="com.DongGu.member.memberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>

<%
boolean result = mdao.IdCheck(mdto);
String msg = result? "사용할 수 있는 아이디 입니다!":"사용하고 있는 아이디 입니다!";
%>

<script>
	window.alert('<%= msg%>');
	var result = <%= result %>;
	
	if(result){
		var txt = '<%= mdto.getP_id()%>'
		opener.document.MemberJoinOwner.id.value = txt;
	}
	window.self.close();
</script>