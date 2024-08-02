<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="Header.jsp" %>
<section>
	<div>
		<div class="left_box">
			<p>카페이름</p>
			<div>
				<img src="">
				<p>서울특별시 쌍용구 교육센터</p>
			</div>
			<div>
				<ul>
					<li><input type="checkbox" value="소형견">소형견</li>
					<li><input type="checkbox" value="중형견">중현경</li>
					<li><input type="checkbox" value="대형견">대형견</li>
					<li><input type="checkbox" value="초대형견">초대형견</li>
					<li><input type="checkbox" value="실내놀이터">실내놀이터</li>
					<li><input type="checkbox" value="야외놀이터">야외놀이터</li>
					<li><input type="checkbox" value="주차공간">주차공간</li>
					<li><input type="checkbox" value="단체석">단체석</li>
				</ul>
			</div>
		</div>
		<div class="right_box"></div>
	</div>
</section>
<%@include file="Footer.jsp" %>
</body>
</html>