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
	window.alert('관리자 로그인이 필요한 작업입니다.');
	window.location.href="/DongGu/member/login.jsp";
	///////관리자로 로그인하는 페이지로/////////
	</script>
<%
}
%>

</head>
<body>
<%@include file="../SubHeader.jsp" %>
<form name="WriteQnABoard" action="/DongGu/notice/WriteNotice_ok.jsp">
	<div id="FreeBoardDivTitle">
		<img src="/DongGu/img/paw-solid.svg" class="FreeBoardTitleImg"> 공지사항 작성 <img src="/DongGu/img/paw-solid.svg" class="FreeBoardTitleImg">
		<span style="text-align:right; ">
			<input type="submit" value="등록" id="WriteFreeBoardSubmitButton">
		</span>
		
	</div>

	<div id="WriteFreeBoardMainDiv">
		<input name="n_title" id="WriteFreeBoardTitleInput"  autofocus type="text" placeholder="제목을 입력해 주세요." required>
		<div id="WriteFreeBoardContentDiv">
			<textarea name="n_content" id="WriteFreeBoardContent" placeholder="내용을 입력하세요." required></textarea>
		</div>
	</div>
	
</form>
<%@include file="../Footer.jsp" %>
</body>
</html>