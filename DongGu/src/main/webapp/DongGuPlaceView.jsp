<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/DongGu.css">
<style>
section.view_place {width: 100%; display: flex; padding: 200px 0 100px 0; flex-direction: column; align-items: center; justify-content: space-around;}
.view_place .info.img {height: 500px; overflow: hidden;}
.view_place .info.img img {transform: translate(0%, -25%);}
.view_place .left_box .view_title {color: #333; font-size: 32px; font-weight: 600; line-height: 40px;}
.view_place .left_box .view_addr {display: flex; margin-top:20px;}
.view_place .left_box .view_addr p {color: #555; font-weight: 500; font-size: 17px; line-height: 21px;}
.view_place .left_box .view_tag {margin:20px 0 20px;}
.view_place .left_box .view_tag ul {display: flex; gap: 10px;}
.view_place .left_box .view_tag input {margin-right: 5px;}
.view_place .left_box .view_line {height: 1px; width: 100%; background-color: #ebebeb;}
.view_place .left_box .view_info,.view_animal {margin-top:20px; width: 700px;}
.view_place .left_box .view_info .info_title,.animal_title {display:flex; align-items: center;}
.view_place .left_box .view_info .info_title p,.animal_title p,.info_box p {color: #333; font-weight: 500; font-size: 16px; line-height: 21px;}
.view_place .left_box img {width:23px; margin-right:15px;}
.view_place .info_box .info_txt {margin:10px 0 0 0;}
.view_place .info_txt, ul.animal_txt li{color: #777; font-size: 15px; font-weight: 400; margin-top: 8px; margin-left: 40px; line-height: 23px;}

.view_place .right_box .view_info_box {width: 375px; border-radius: 12px; border: 1px solid #ebebeb; padding:20px 30px; box-shadow: 1px 1px 12px rgba(0, 0, 0, .07);}
.view_place .right_box .view_info_box .title {color: #333; font-size: 18px; font-weight: 700; line-height: 27px; padding-bottom:10px; letter-spacing: -.2px;}
.view_place .right_box .view_info_box .info_box {margin-top:20px;}
.view_place .right_box .list_bt {display: flex; cursor: pointer;align-items: center;
    justify-content: center;
    width: 130px;
    height: 60px;
    margin-top: 100px;
    border-radius: 10px;
    background: #fdcb08;}
</style>
</head>
<body>
<%@include file="SubHeader.jsp" %>
<section class="view_place">
	<div class="info img">
		<img src="img/place01.jpg" >
	</div>
	<div style="display: flex; gap: 50px; margin-top: 50px;">
		<div class="left_box">
			<p class="view_title">헬로우마루네</p>
			<div class="view_addr">
				<img src="img/icon_addr.png">
				<p>서울 구로구 서해안로 2295 4층 2호</p>
			</div>
			<div class="view_tag">
				<ul>
					<li><input type="checkbox" checked value="소형견">소형견</li>
					<li><input type="checkbox" checked value="중형견">중현경</li>
					<li><input type="checkbox" checked value="대형견">대형견</li>
					<li><input type="checkbox" checked value="초대형견">초대형견</li>
					<li><input type="checkbox" checked value="포토존">포토존</li>
					<li><input type="checkbox" disabled value="실내놀이터">실내놀이터</li>
					<li><input type="checkbox" checked value="야외놀이터">야외놀이터</li>
					<li><input type="checkbox" checked value="주차공간">주차공간</li>
					<li><input type="checkbox" checked value="단체석">단체석</li>
				</ul>
			</div>
			<div class="view_line"></div>
			<div class="view_info">
				<div class="info_title">
					<img src="img/icon_info2.png">
					<p>이용안내</p>
				</div>
				<p class="info_txt">헬로우마루네 애견운동장은 강아지 유치원 , 장기호텔링 , 셀프목욕 , 호텔 , 용품을 구매할 수 있는 강아지를 위한 편의시설 공간입니다.</p>
			</div>
			<div class="view_animal">
				<div class="animal_title">
					<img src="img/icon_dog_yw.png" style="width:20px;">
					<p>반려동물 동반 안내</p>
				</div>
				<div>
					<ul class="animal_txt">
						<li>1. 반려동물이 건강하고 예방접종이 완료된 상태여야 합니다.</li>
						<li>2. 카페 내에서는 항상 반려동물에게 목줄을 착용시켜서 다른 손님이나 동물에게 피해를 주지 않도록 주의합니다.</li>
						<li>3. 다른 손님이나 반려동물에게 공격적인 행동을 보일 경우, 퇴장을 요청받을 수 있습니다.</li>
						<li>4. 반려동물 놀이시설이나 장난감을 사용할 때는 다른 손님과 조율하여 사용합니다.</li>
						<li>5. 카페 내에서의 안전사고나 피해에 대한 책임은 반려동물 주인에게 있을 수 있습니다.</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="right_box">
			<div class="view_info_box">
				<p class="title">영업안내</p>
				<div class="info_box addr">
					<p>업체 위치</p>
					<p class="info_txt">서울 구로구 서해안로 2295 4층 2호</p>
				</div>
				<div class="info_box time">
					<p>운영 시간</p>
					<p class="info_txt">매일 11:00 ~ 20:00</p>
				</div>
				<div class="info_box link">
					<p class="box_bigtxt">홈페이지</p>
					<div style="display: flex; align-items: center; margin-top:10px;">
						<img src="img/icon_naver.png" style="width:20px; margin-right: 10px;">
						<p class="info_txt" style="margin:0;">네이버 플레이스</p>
					</div>
					
				</div>
			</div>
			<!--  <div class="list_bt">
				<p>목록으로</p>
			</div>-->
		</div>
	</div>
</section>
<%@include file="Footer.jsp" %>
</body>
</html>