<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="com.DongGu.member.memberDAO"></jsp:useBean>
<jsp:useBean id="mdto" class="com.DongGu.member.memberDTO"></jsp:useBean>
<jsp:useBean id="odto" class="com.DongGu.member.ownermemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:setProperty property="*" name="odto"/>

<%
boolean result = mdao.NickNameCheck(mdto, odto);
String msg = result? "사용할 수 있는 닉네임 입니다!":"사용하고 있는 닉네임 입니다!";
%>

<script>
	window.alert('<%= msg%>');
	var result = <%= result %>;
	
	if(result){
		var txt = '<%= mdto.getP_nickname()%>'
		opener.document.MemberJoinDonggu.p_nickname.value = txt;
	}
	window.self.close();
</script>