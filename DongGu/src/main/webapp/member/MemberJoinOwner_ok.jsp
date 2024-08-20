<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="odto" class="com.DongGu.member.ownermemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="odto"/>
<jsp:useBean id="mdao" class="com.DongGu.member.memberDAO"></jsp:useBean>

<%
// 세션 저장
String o_id =request.getParameter("o_id");
session.setAttribute("o_id", o_id);
session.setMaxInactiveInterval(60 * 60); // 세션 유효 시간을 1시간으로 설정

String o_tel1=request.getParameter("o_tel1");
String o_tel2=request.getParameter("o_tel2");
String o_tel3=request.getParameter("o_tel3");
String o_tel=o_tel1+"-"+o_tel2+"-"+o_tel3;

String o_jumin1 = request.getParameter("o_jumin1");
String o_jumin2 = request.getParameter("o_jumin2");
String o_jumin=o_jumin1+"-"+o_jumin2;
System.out.println(o_jumin);

String o_addr1=request.getParameter("o_addr1");
String o_addr2=request.getParameter("o_addr2");
String o_addr=o_addr1+" "+o_addr2;

String genderStr = request.getParameter("o_gender");
int o_gender = Integer.parseInt(genderStr);

odto.setO_tel(o_tel);
odto.setO_jumin(o_jumin);
odto.setO_addr(o_addr);
odto.setO_gender(o_gender);

int result = mdao.MemberJoinOwner(odto);
String msg=result>0?"회원가입 성공!":"회원가입 실패!";

System.out.println("세션에 저장된 o_id: " + session.getAttribute("o_id"));

%>

<script>
window.alert('<%=msg%>');
location.href='MemberJoinOwnerAnimal.jsp';
</script>