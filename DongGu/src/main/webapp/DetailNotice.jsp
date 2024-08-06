<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>  
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
</head>
<body>
<%@include file="Header.jsp" %>
<div id="BoardMargin">
	<div>
		<div id="WriteFreeBoardMainDiv">
			<div id="DetailBoardSubject" ><a href="Notice.jsp" class="DetailBoardSubject">공지사항 ></a></div>
			<div id="DetailBoardTitle">2024년 8월 5일 공지사항</div>
			<div id="DetailBoardInfo">작성자 : 관리자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성날짜 : 24.07.08&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회:3</div>
			<div id="WriteFreeBoardContentDiv">
				<div id="DetailQnABoardContentDiv" >2024년 8월 5일 공지사항입니다.<br>아이디, 닉네임은 중복이 불가능합니다.<br>회원간 존중을 해주십시오.</div>
			</div>
			<input class="FreeBoardButton" id="FreeBoardTableButton" type="button" value="뒤로가기"  onclick="history.back();">
		</div>
	</div>
</div>
<%@include file="Footer.jsp" %>

</body>
</html>