<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
/* 공통 css */
p, span, li {font-family: 'Pretendard';}
li::marker {content: none;}
/* ------- */
section.main { width: 100%; background: #fffae5;}
section .main_img {   
	display: flex;
    justify-content: flex-end;
    align-items: flex-end;
    width: 1440px;
    height: 900px;
    position: relative;
    margin: 0 auto;}
section .main_img img {width: 950px;}
section .main_txt {
	display: flex;
    flex-direction: column;
    align-self: center;
    position: absolute;
    top: 300px;
    left: 0;
    right: 0;
    margin: 0px auto;
    width: 1440px;
    z-index: 20;
}
section .main_txt p.bg_p {font-size: 65px; letter-spacing: 5px;
    line-height: 80px; font-weight: bold; margin: 0 0 30px 0; color: #333;}
section .main_txt p.sm_p {font-size: 20px; font-weight: 500; letter-spacing: 0.5px; color: #77766f; margin: 0;} 
section .main_txt p b {color: #fdcb08;}
section .main_bt {
	display: flex;
    cursor: pointer;
    align-items: center;
    justify-content: center;
    width: 130px;
    height: 60px;
    margin-top: 100px;
    border-radius: 10px;
    background: #fdcb08;}
section .main_bt p {color:#fff; font-size: 17px; letter-spacing: 0.5px;}
section .main_bt img {padding: 0 0 0 10px;}

/* count section */
section.count {width: 100%; height: 340px; position: relative; box-shadow: 0px 3px 25px rgba(0, 0, 0, 0.05);}
.count .area {    width: 1440px;
    height: 340px;
    margin: 0px auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding-left: 210px;
    padding-right: 333px;}
.count .area .ct_txt01 p {font-size:40px; font-weight: 600; color: #a0a0a0; letter-spacing: 1px;}
.count .area .ct_txt01 p span {color:#000;} 
.count .area .ct_txt02 {padding-right: 200px;}
.count .area .ct_txt02 p {font-size: 24px; color: #a1a1a1;} 
.count .area .ct_txt02 p span {font-size: 65px; color:#000; font-weight: 700;} 

/* rivew */
@font-face {
    font-family: 'Cafe24Meongi-B-v1.0';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-3@1.1/Cafe24Meongi-B-v1.0.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
section.rivew {background: #fffdf7; padding: 100px 0 100px 0;}
.rivew h3 {font-family: 'Cafe24Meongi-B-v1.0'; font-size: 65px; text-align: center; margin: 0; padding: 0 0 50px 0; color: #fdcb08;}
.rivew .rivew_cont {width:1000px; margin: 0 auto; display: flex; flex-direction: column; align-items: center;} 
.rivew .rivew_cont ul {padding:0;}
.rivew .rivew_cont ul li {margin-bottom: 40px;}
.rivew .rivew_cont ul li:nth-child(1) .left_box { 
	background: url(img/rivew_img01.png) no-repeat top right; background-position: right -25px; background-size: cover;}
.rivew .rivew_cont ul li:nth-child(2) .left_box { 
	background: url(img/rivew_img02.png) no-repeat top right; background-position: right -145px; background-size: cover;}
.rivew .rivew_cont ul li:nth-child(3) .left_box { 
	background: url(img/rivew_img03.png) no-repeat top right; background-position: right -180px; background-size: cover;}
.rivew .rivew_cont ul li:last-child {margin-bottom: 0px;}
.rivew .box {	 
	display: flex;
    justify-content: flex-start;
    align-items: flex-start;
    gap: 25px;
    border-radius: 30px;
    box-shadow: 10px 10px 24px 10px hsla(0, 5%, 92%, .5);
    background-color: #fff;
    box-sizing: border-box;
    padding: 35px;}
.rivew .left_box {width:340px; height: 170px; background: #000;}
.rivew .right_box .rb_title {display: flex; justify-content: flex-start; align-items: center; gap: 20px; margin-bottom: 16px;}
.rivew .right_box .rb_title .best {
    display: inline-block;
    width: 64px;
    border-radius: 10px;
    background-color: #444;
    font-size: 17px;
    font-weight: 400;
    line-height: 28px;
    text-align: center;
    letter-spacing: -.64px;
    color: #fff;}
.rivew .right_box p {color: #444; line-height: 25px;}
.rivew .right_box .rb_title .addr {color: #444; font-size:17px; font-weight:500;}
.rivew .right_box .rb_title .date {color: #d2d2d2;}
.rivew .rivew_bt {
	display: flex;
    cursor: pointer;
    align-items: center;
    justify-content: center;
    width: 130px;
    height: 60px;
    margin-top: 100px;
    border-radius: 10px;
    color:#595858;
    border: 1px solid #595858;}
.rivew .rivew_bt img {padding: 0 0 0 10px; }

/* banner */
section.bn {padding: 100px 0;}
.bn .bk_bn {width: 1400px; background: #000; height: 450px; margin: 0 auto;}
.bn .bk_bn .img { height: 450px;
	background: url(img/banner_img.png) no-repeat top right; background-position: right -100px;}
.bn .bk_bn .txt { padding: 80px 0 0 90px;}
.bn .bk_bn .txt .big_txt {color: #fff; font-size: 30px; line-height: 1.4; margin:0;}
.bn .bk_bn .txt .small_txt {color: #b2b2b2; font-size: 17px; line-height: 1.4; margin:55px 0 0 0;}
.bn .bn_bt {
	display: flex;
    cursor: pointer;
    align-items: center;
    justify-content: center;
    width: 130px;
    height: 60px;
    margin-top: 50px;
    border-radius: 10px;
    color:#fff;
    border: 1px solid #fff;}
 .bn .bn_bt img {padding: 0 0 0 10px; }
</style>
<body>
<%@include file="Header.jsp" %>
<!-- main 시작 -->
<section class="main">
	<div>
		<div class="main_img">
			<img src="img/main_img.png" alt="메인이미지">
		</div>
		<div class="main_txt">
			<p class="bg_p"><b>동</b>물친<b>구</b>를<br>초대해보세요</p>
			<p class="sm_p">나와 내 반려동물을 위한 돌봄서비스</p>
			<div class="main_bt">
				<p>초대하기</p>
				<img src="img/icon_dog.png">
			</div>
		</div>
	</div>
</section>
<!-- main 끝 -->
<!-- count 시작 -->
<section class="count">
	<div class="area">
		<div class="ct_txt01">
			<p>
			지금까지 <span>458,279</span>명의<br>
			동물친구들이 지원했어요!
			</p>
		</div>
		<div class="ct_txt02">
			<p>동물친구와 매칭된 건수<br>
			<span>131,908건</span></p>
		</div>
	</div>
</section>
<!-- count 끝 -->
<!-- rivew 시작 -->
<section class="rivew">
	<h3><img src="img/logo_rivew.png"></h3>
	<div class="rivew_cont">
		<ul>
			<li>
				<div class="box">
					<div class="left_box">
					</div>
					<div class="right_box">
						<div class="rb_title">
							<span class="best">Best</span>
							<span class="addr">경남 거제시</span>
							<span class="date">7월31일</span>
						</div>
						<img src="img/star.png" alt="별점">
						<p>
						강아지 너무 귀여워 동구들 짱짱입니다 ! 한쪽만 펼쳐진 귀, 콩 3개 ... 너무 사랑스러워<br>
						우리 팀 아직 3일밖에 안지났지만 화이팅 해봅시다.<br>
						아자아자 화이자 !  
						</p>
					</div>
				</div>
			</li>
			<li>
				<div class="box">
					<div class="left_box">
					</div>
					<div class="right_box">
						<div class="rb_title">
							<span class="best">Best</span>
							<span class="addr">경북 구미시</span>
							<span class="date">7월31일</span>
						</div>
						<img src="img/star.png" alt="별점">
						<p>
						강아지 너무 귀여워 동구들 짱짱입니다 ! 한쪽만 펼쳐진 귀, 콩 3개 ... 너무 사랑스러워<br>
						우리 팀 아직 3일밖에 안지났지만 화이팅 해봅시다.<br>
						아자아자 화이자 !  
						</p>
					</div>
				</div>
			</li>
			<li>
				<div class="box">
					<div class="left_box">
					</div>
					<div class="right_box">
						<div class="rb_title">
							<span class="best">Best</span>
							<span class="addr">대구광역시</span>
							<span class="date">7월31일</span>
						</div>
						<img src="img/star.png" alt="별점">
						<p>
						강아지 너무 귀여워 동구들 짱짱입니다 ! 한쪽만 펼쳐진 귀, 콩 3개 ... 너무 사랑스러워<br>
						우리 팀 아직 3일밖에 안지났지만 화이팅 해봅시다.<br>
						아자아자 화이자 !  
						</p>
					</div>
				</div>
			</li>
		</ul>
		<div class="rivew_bt">
			<p style="font-weight: 500;">후기 더 보기</p>
			<img src="img/icon_dog_bk.png">
		</div>
	</div>
</section>
<!-- rivew 끝 -->
<!-- banner 시작 -->
<section class="bn">
	<div class="bk_bn" style="position:relative;">
		<div class="txt" style="position:absolute;">
			<p class="big_txt">
				보호자님, 내 반려동물에게 필요한<br>
				<b style="color:#fdcb08;">동구</b>를 찾아보세요!
			</p>		
			<p class="small_txt">
				고객님의 소중한 반려동물에게<br>
				직접 찾아가 맞춤 돌봄 서비스를 제공해드립니다.		
			</p>
			<div class="bn_bt">
				<p style="font-weight: 500;">바로가기</p>
				<img src="img/icon_dog.png">
			</div>
		</div>
		<div class="img"></div>
		
	</div>

</section>
<!-- banner 끝 -->
<%@include file="Footer.jsp" %>
