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
<form>
<div id="FreeBoardDivTitle" style="">
	<img src="img/paw-solid.svg" class="FreeBoardTitleImg"> 공지사항 작성 <img src="img/paw-solid.svg" class="FreeBoardTitleImg">
	<span style="text-align:right; ">
		<input type="submit" value="등록" id="WriteFreeBoardSubmitButton">
	</span>
	
</div>

	<div id="WriteFreeBoardMainDiv">
		<input id="WriteFreeBoardTitleInput"  autofocus type="text" placeholder="제목을 입력해 주세요." name="title" required>
		<div id="WriteFreeBoardContentDiv">
			<textarea id="WriteFreeBoardContent" name="content" placeholder="내용을 입력하세요." required></textarea>
		</div>
	</div>
	

</form>
<%@include file="Footer.jsp" %>
</body>
</html>