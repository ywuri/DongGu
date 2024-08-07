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
<%@include file="/Header.jsp" %>

	<form name="">
	
		<div class="s_joinTableOne">
			<div class="jto_left" onclick="location.href='MemberJoinOwner.jsp'">
				<img src="img/f_clean.png">
				<br />
				<span>동구구해요!</span>
			</div>
			<div class="jto_right" onclick="location.href='MemberJoinDonggu.jsp'">
				<img src="img/f_yellow.png">
				<br />
				<span>동구할래요!</span>
			</div>
		</div>
		
	</form>	
	
<%@include file="/Footer.jsp" %>

</body>
</html>