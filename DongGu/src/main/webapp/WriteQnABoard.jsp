<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.Date" %>  
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">


</head>
<body>
<%@include file="Header.jsp" %>
<form name="WriteQnABoard" action="WriteQnABoard_ok.jsp">
	<div id="FreeBoardDivTitle">
		<img src="img/paw-solid.svg" class="FreeBoardTitleImg"> QnA 작성 <img src="img/paw-solid.svg" class="FreeBoardTitleImg">
		<span style="text-align:right; ">
			<input type="submit" value="등록" id="WriteFreeBoardSubmitButton">
		</span>
		
	</div>

	<div id="WriteFreeBoardMainDiv">
		<input name="q_title" id="WriteFreeBoardTitleInput"  autofocus type="text" placeholder="제목을 입력해 주세요." required>
		<div id="WriteFreeBoardContentDiv">
			<textarea name="q_content" id="WriteFreeBoardContent" placeholder="내용을 입력하세요." required></textarea>
		</div>
	</div>
	
</form>
<%@include file="Footer.jsp" %>
</body>
</html>