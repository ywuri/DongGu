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
			<div id="DetailBoardSubject" ><a href="QnABoard.jsp" class="DetailBoardSubject">QnA 게시판 ></a></div>
			<div id="DetailBoardTitle">강아지 키우신지 얼마나 됐나요??</div>
			<div id="DetailBoardInfo">작성자 : 멍구맹구&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성날짜 : 24.07.08&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회:3</div>
			<div id="WriteFreeBoardContentDiv">
				<div id="DetailQnABoardContentDiv" >저는 아직 키운지 3달차입니다. 여러분은 키운지 얼마나 되셨나요?</div>
			</div>
			<input class="FreeBoardButton" id="FreeBoardTableButton" type="button" value="뒤로가기"  onclick="history.back();">
		</div>
	</div>
</div>
<%@include file="Footer.jsp" %>

</body>
</html>