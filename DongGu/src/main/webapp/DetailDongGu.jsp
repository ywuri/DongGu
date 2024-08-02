<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">

<style>

</style>

</head>
<body>
<%@include file="Header.jsp" %>

<div id="FreeBoardDivTitle"><img src="img/paw-solid.svg" class="FreeBoardTitleImg"> 초 대 장 <img src="img/paw-solid.svg" class="FreeBoardTitleImg"></div>
<div class="DeTailDongGuMainDiv">
	
	<div id="DetailDongGuTitleDiv">제 초코좀 봐주세요</div>
	<div id="DetailDongGuInfoDiv">
		<div>
			<img class="DetailDongGuImg" src="img/rivew_img02.png" >
		</div>
		<div id="DetailDongGuContentDiv" >
			<div>[닉네임]이</div>
			<div>24.07.31부터 24.08.02까지</div>
			<div>강아지 치와와 초코(5살)와</div>
			<div>행복한 시간에 초대합니다~</div>
			<div>우리 초코는 [성격]하고 [성격]합니다.</div>
			<div>초코의 [알레르기] [병력사항] [주의사항]을 조심해주세요</div>
			<div>그리고 ~ [추가 입력한 사항]</div>
			<div>대략적인 위치는 [주소]입니다 </div>
			
			<div id="DetailDongGuButton">
				<span>초대에 응하시겠습니까? </span>
				<input type="button" class="DetailDongGuJoinButton" value="수락하기" onclick="goPage();">
			</div>
			
			<div>
				<span>현재 참가자는 </span><span id="DetailDongGuCountNum">3</span><span>명 입니다.</span>
			</div>
		</div>
		
	</div>
</div>


<%@include file="Footer.jsp" %>

</body>
</html>