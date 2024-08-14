<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="adto" class="com.DongGu.animal.animalDTO"></jsp:useBean>
<jsp:useBean id="mdto" class="com.DongGu.member.memberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="adto"/>
<jsp:useBean id="adao" class="com.DongGu.animal.animalDAO"></jsp:useBean>

<%

String genderStr = request.getParameter("ai_gender");
int ai_gender = Integer.parseInt(genderStr);

adto.setAi_gender(ai_gender);

int result = adao.MemberJoinOwnerAnimal(adto, mdto);
String msg=result>0?"회원가입 성공!":"회원가입 실패!";


%>

<script>
window.alert('<%=msg%>');
location.href='MemberJoinOwnerAnimal.jsp';
</script>