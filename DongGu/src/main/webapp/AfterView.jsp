<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/DongGu.css">
<style>
.view_after {width: 100%; display: flex; padding: 200px 0 100px 0; flex-direction: column; align-items: center; justify-content: space-around;}
.after_box {display: flex; position: relative; flex-direction: column; vertical-align: top; width: 640px;
    border-radius: 10px; box-shadow: 0px 2px 12px rgba(0, 0, 0, 0.09); border-radius: 20px; overflow: hidden;}
.after_box .after_img {width:100%; height: 350px; overflow:hidden;}
.after_box .after_img img {width:100%;}
.after_box .after_txt {padding: 30px 40px;}
</style>
</head>
<body>
<%@include file="SubHeader.jsp" %>
<section class="view_after">
	<div>
		<div class="after_box">
			<div class="after_img">
				<img src="img/rivew_img02.png">
			</div>
			<div class="after_txt">
				<div class="atfer_title">
					<span class="name">초코</span>
					<span class="addr">경북 구미시</span>
					<span class="date">7월31일</span>
				</div>
				<img src="">
				<p>내용입니다.</p>
			</div>
		</div>
	</div>
</section>
<%@include file="Footer.jsp" %>
</body>
</html>