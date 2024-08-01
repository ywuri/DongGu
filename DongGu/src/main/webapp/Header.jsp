<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/DongGu.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
header.dg_hd {
	position: absolute;
	width:1470px;
    left: 50%;
    top: 50px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 80px;
    border-radius: 10px;
    transform: translate(-50%);
    background: #fff;
    transition: all .3s ease;
}
header.dg_hd h1 a img {width: 140px; margin: 10px 0 0 20px;}
header.dg_hd nav > ul {display:flex;}
header.dg_hd nav > ul > li {position: relative;}
header nav > ul > li::marker {content: none;}
header.dg_hd nav > ul > li > a {line-height:80px; font-family: 'Pretendard'; font-size:18px; color: #444; padding: 0 50px; transition: color .3s ease;}
header.dg_hd nav > ul > li > a span {display: inline-block; position: relative; line-height: 1;}
header.dg_hd .util .login {width:80px; height:80px; padding:0; border:0; border-radius: 0 8px 8px 0;
    background: url(img/icon_login.png) no-repeat center;}
</style>
</head>
<body>
<div class="wrapper"> <!-- wrapper 시작 -->
<header class="dg_hd">
	<h1>
		<a href="#"><img src="img/logo.png" alt="logo"></a>
	</h1>
	<nav>
		<ul>
			<li>
				<a href="#"><span>초대장</span></a>
			</li>
			<li>
				<a href="#"><span>게시판</span></a>
			</li>
			<li>
				<a href="#"><span>동구의 추천</span></a>
			</li>
			</li>
			<li>
				<a href="#"><span>이용후기</span></a>
			</li>
			<li>
				<a href="#"><span>고객센터</span></a>
			</li>
		</ul>
	</nav>
	<div class="util">
		<button type="button" class="login"></button>
	</div>
</header>
</body>
</html>
