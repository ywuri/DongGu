<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.Date" %>  
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
<%
//로그인 안했을 시 전 페이지로 돌아가게
String s_id =(String)session.getAttribute("sid");
if(s_id==null || s_id.equals("")){
	%>
	<script>
	window.alert('로그인이 필요한 작업입니다.');
	window.location.href="/DongGu/member/login.jsp";
	</script>
<%
}

String q_ref=request.getParameter("q_ref");
String q_lev=request.getParameter("q_lev");
String q_sunbun=request.getParameter("q_sunbun");
String q_title = request.getParameter("q_title");

%>

</head>
<body>
<%@include file="../SubHeader.jsp" %>
<form name="WriteQnABoard" action="/DongGu/qna/ReWriteQnABoard_ok.jsp">
	<div id="FreeBoardDivTitle">
		<img src="/DongGu/img/paw-solid.svg" class="FreeBoardTitleImg"> QnA 답글 작성 <img src="/DongGu/img/paw-solid.svg" class="FreeBoardTitleImg">
		<span style="text-align:right; ">
			<input type="submit" value="등록" id="WriteFreeBoardSubmitButton">
		</span>
		
	</div>
	<input type="hidden" name="q_ref" value="<%=q_ref%>">
	<input type="hidden" name="q_lev" value="<%=q_lev%>">
	<input type="hidden" name="q_sunbun" value="<%=q_sunbun%>">

	<div id="WriteFreeBoardMainDiv">
		<input name="q_title" id="WriteFreeBoardTitleInput"  autofocus type="text" required value="re:<%=q_title %>">
		<div id="WriteFreeBoardContentDiv">
			<textarea name="q_content" id="WriteFreeBoardContent" placeholder="내용을 입력하세요." required></textarea>
		</div>
	</div>
	
</form>
<%@include file="../Footer.jsp" %>
</body>
</html>