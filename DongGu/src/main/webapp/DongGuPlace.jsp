<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/DongGu.css">
<style>
.place {
    width: 100%;
    height: auto;
    display: flex;
    position: relative;
    align-items: center;
    flex-direction: column;
    justify-content: center;
    padding: 250px 0 100px 0;
}
.place ul {display: flex; flex-direction: column; gap: 80px;}
.place p.title {margin-bottom:50px; text-align: center; font-size: 23px; font-weight: 600;}
.place .place_box {display: flex; gap: 20px;}
.place .box {    width: 310px;
    height: 381px;
    cursor: pointer;
    overflow: hidden;
    position: relative;
    border-radius: 10px;
    box-shadow: 1px 1px 12px rgba(0, 0, 0, .07);}
.place .box .txt_box {padding: 20px 30px;}
.place .box .txt_box .big_txt {font-size: 20px; margin-bottom: 15px; font-weight:600;}
.place .box .txt_box .small_txt {font-size: 15px; margin-bottom: 20px;  color: #777; font-weight: 600;
    letter-spacing: 1px;}
.place .box .txt_box .tag {    height: 26px;
    display: flex;
    width: -moz-fit-content;
    width: fit-content;
    border-radius: 5px;
    padding-left: 10px;
    padding-right: 10px;
    flex-direction: column;
    justify-content: center;
    background-color: #f8f8f8;
    font-size: 13px;}
.place .box .img_box {width: 100%; height: 230px; background: #000; position: relative; overflow: hidden;}
.place .box .img_box img {width: 100%; transform: translate(0%, -15%); position: absolute;}
</style>
</head>
<body>
<%@include file="SubHeader.jsp" %>
<section class="place">
	<ul>
		<li>
			<p class="title">운동장이 있는 애견카페</p>
			<div class="place_box">
				<div class="box 01">
					<div class="img_box"> 
						<img src="img/place01.jpg" >
					</div>
					<div class="txt_box">
						<p class="big_txt">헬로우마루네</p>
						<p class="small_txt">서울 구로구 오류동</p>
						<p class="tag">평화로운 분위기 · 햇살뷰 · 회원권</p>
					</div>
				</div>
				<div class="box 02">
					<div class="img_box"> 
						<img src="img/place02.jpg" >
					</div>
					<div class="txt_box">
						<p class="big_txt">어반펫츠</p>
						<p class="small_txt">서울 용산구 한강대로</p>
						<p class="tag">좋은 잔디 · 캡슐커피 무한 · 주차공간 </p>
					</div>
				</div>
				<div class="box 03">
					<div class="img_box"> 
						<img src="img/place03.jpg" style="transform: none">
					</div>
					<div class="txt_box">
						<p class="big_txt">카페 루</p>
						<p class="small_txt">서울 송파구 오금동</p>
						<p class="tag">다양한 음식 · 루프탑 · 도심위치 </p>
					</div>
				</div>
			</div>
		</li>
		<li>
			<p class="title">애견음식이 함께 있는 애견카페</p>
			<div class="place_box">
				<div class="box 01">
					<div class="img_box"> 
						<img src="img/place04.png" >
					</div>
					<div class="txt_box">
						<p class="big_txt">바잇미 신사점</p>
						<p class="small_txt">서울 강남구 신사동</p>
						<p class="tag">강아지브랜드 · 용품구매 · 테라스 · 퍼푸치노</p>
					</div>
				</div>
				<div class="box 02">
					<div class="img_box"> 
						<img src="img/place05_1.jpg" style="transform: translate(0%, -25%);">
					</div>
					<div class="txt_box">
						<p class="big_txt">누뗀</p>
						<p class="small_txt">서울 서초구 신원동</p>
						<p class="tag">초록뷰 · 햇살 · 멍푸치노 · 뜨개클래스</p>
					</div>
				</div>
				<div class="box 03">
					<div class="img_box"> 
						<img src="img/place06.jpg" style="transform: translate(0%, -10%);">
					</div>
					<div class="txt_box">
						<p class="big_txt">낮도깨비 밤도깨비</p>
						<p class="small_txt">서울 마포구 망원동</p>
						<p class="tag">낮카페밤와인바 · 멍푸치노 · 테라스 </p>
					</div>
				</div>
			</div>
		</li>
		<li>
			<p class="title">포토존이 있는 애견카페</p>
			<div class="place_box">
				<div class="box 01">
					<div class="img_box"> 
						<img src="img/place07.jpg" >
					</div>
					<div class="txt_box">
						<p class="big_txt">멍뭉다방</p>
						<p class="small_txt">서울 중랑구 면목동</p>
						<p class="tag">다양한 포토존 · 볼풀장 · 옥상야외공간</p>
					</div>
				</div>
				<div class="box 02">
					<div class="img_box"> 
						<img src="img/place08.jpg" style=" transform: translate(0%, -23%);" >
					</div>
					<div class="txt_box">
						<p class="big_txt">똥강아지</p>
						<p class="small_txt">서울 중랑구 면목동</p>
						<p class="tag">시티뷰 · 구름 포토존 · 슬개골힐링체험 </p>
					</div>
				</div>
				<div class="box 03">
					<div class="img_box"> 
						<img src="img/place09.jpg" style="transform: none">
					</div>
					<div class="txt_box">
						<p class="big_txt">강아지 공간</p>
						<p class="small_txt">경기 용인시 죽전동</p>
						<p class="tag">호텔 · 시즌별 포토존 · 케어 </p>
					</div>
				</div>
			</div>
		</li>
	</ul>
</section>
<%@include file="Footer.jsp" %>
</body>
</html>