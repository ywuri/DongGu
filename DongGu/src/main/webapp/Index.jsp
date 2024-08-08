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
	<div class="radio-checked">
		<div class="radio-checked_highlight"></div>
		<div class="radio-checked_container">
			<input checked="checked" class="radio-checked_input" id="on"
				name="status" type="radio" value="on" /> 
				<label class="radio-checked_label radio-checked_label--on" onclick="Tabbutton(1)" for="on">
				DongGu</label> 
				<input class="radio-checked_input" id="off" name="status"
				type="radio" value="off" />
				<label class="radio-checked_label radio-checked_label--off" onclick="Tabbutton(2)" for="off">
				Other</label>
		</div>
	</div>
	<script language="javascript">
		// 탭소스
		// 탭숫자를 늘리려면 i<2값을 조절해준다.
			function Tabbutton(index) {
			for (i=1; i<=3; i++)
			if (index == i) {
			thisMenu = eval("Tabid" + index + ".style");
			thisMenu.display = "";
			}
			else {
			otherMenu = eval("Tabid" + i + ".style");
			otherMenu.display = "none";
			}
			}
	</script>
	<div id='Tabid1' class="rivew_cont">
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
	</div>
	<!-- Tabid1 끝 -->
	<div id='Tabid2' class="rivew_cont"  style="display:none;">
		<ul>
			<li>
				<div class="box">
					<div class="left_box">
					</div>
					<div class="right_box">
						<div class="rb_title">
							<span class="best">other</span>
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
		</ul>
	</div>
	<!-- Tabid2 끝 -->
	<div class="rivew_bt">
		<p style="font-weight: 500;">후기 더 보기</p>
		<img src="img/icon_dog_bk.png">
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
<script>
  const radioInputs = document.querySelectorAll('.radio-checked_input');
  const highlight = document.querySelector('.radio-checked_highlight');

  radioInputs.forEach(input => {
    input.addEventListener('change', (event) => {
      if (event.target.id === 'on') {
        document.documentElement.style.setProperty('--highlight-left', '0px');
      } else if (event.target.id === 'off') {
        document.documentElement.style.setProperty('--highlight-left', '120px'); // Example value, adjust as needed
      }
    });
  });
</script>
<%@include file="Footer.jsp" %>
