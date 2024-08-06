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
			<div id="DetailBoardSubject" ><a href="FreeBoard.jsp" class="DetailBoardSubject">자유 게시판 ></a></div>
			<div id="DetailBoardTitle">저는 병아리를 키워요</div>
			<div id="DetailBoardInfo">작성자 : 이철수씨&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성날짜 : 24.07.08&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회:3</div>
			<div id="WriteFreeBoardContentDiv">
				<img src="img/철수.jpg" id="DetailBoardImg">
				<div id="DetailQnABoardContentDiv">저는 아기병아리를 키웁니다 귀엽죠??</div>
			</div>
			<input class="FreeBoardButton" id="FreeBoardTableButton" type="button" value="뒤로가기"  onclick="history.back();">
		</div>
	</div>
</div>
	
<%@include file="Footer.jsp" %>

</body>
</html>