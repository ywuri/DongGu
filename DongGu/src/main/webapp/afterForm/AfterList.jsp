<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/DongGu.css">
<style>
.rivew {padding-top:200px;}
.rivew .box {
    flex-direction: column;
}
.rivew .rivew_cont ul li {
    width: 48%;
}
.rivew .left_box {
    width: 100% !important;
    height: 200px !important;
}
</style>
</head>
<body>
<%@include file="../SubHeader.jsp" %>
<section class="rivew" style="padding-top:200px;">
	<h3>실시간 동구</h3>
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
		<ul style="display: flex; flex-wrap: wrap; justify-content: space-between;">
			<li>
			<a href="AfterView.jsp">
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
						강아지 너무 귀여워 동구들 짱짱입니다 ! 한쪽만 펼쳐진 귀, 콩 3개 ... 너무 사랑스러워
						우리 팀 아직 3일밖에 안지났지만 화이팅 해봅시다.
						아자아자 화이자 !  
						</p>
					</div>
				</div>
			</a>
			</li>
			<li>
				<div class="box">
					<div class="left_box" style="background-position: right -186px;">
					</div>
					<div class="right_box">
						<div class="rb_title">
							<span class="best">Best</span>
							<span class="addr">경북 구미시</span>
							<span class="date">7월31일</span>
						</div>
						<img src="img/star.png" alt="별점">
						<p>
						강아지 너무 귀여워 동구들 짱짱입니다 ! 한쪽만 펼쳐진 귀, 콩 3개 ... 너무 사랑스러워
						우리 팀 아직 3일밖에 안지났지만 화이팅 해봅시다.
						아자아자 화이자 !  
						</p>
					</div>
				</div>
			</li>
			<li>
				<div class="box">
					<div class="left_box" style="background-position: right -222px;">
					</div>
					<div class="right_box">
						<div class="rb_title">
							<span class="best">Best</span>
							<span class="addr">대구광역시</span>
							<span class="date">7월31일</span>
						</div>
						<img src="img/star.png" alt="별점">
						<p>
						강아지 너무 귀여워 동구들 짱짱입니다 ! 한쪽만 펼쳐진 귀, 콩 3개 ... 너무 사랑스러워
						우리 팀 아직 3일밖에 안지났지만 화이팅 해봅시다.
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
						강아지 너무 귀여워 동구들 짱짱입니다 ! 한쪽만 펼쳐진 귀, 콩 3개 ... 너무 사랑스러워
						우리 팀 아직 3일밖에 안지났지만 화이팅 해봅시다.
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
						강아지 너무 귀여워 동구들 짱짱입니다 ! 한쪽만 펼쳐진 귀, 콩 3개 ... 너무 사랑스러워
						우리 팀 아직 3일밖에 안지났지만 화이팅 해봅시다.
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
						강아지 너무 귀여워 동구들 짱짱입니다 ! 한쪽만 펼쳐진 귀, 콩 3개 ... 너무 사랑스러워
						우리 팀 아직 3일밖에 안지났지만 화이팅 해봅시다.
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
						강아지 너무 귀여워 동구들 짱짱입니다 ! 한쪽만 펼쳐진 귀, 콩 3개 ... 너무 사랑스러워
						우리 팀 아직 3일밖에 안지났지만 화이팅 해봅시다.
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
						강아지 너무 귀여워 동구들 짱짱입니다 ! 한쪽만 펼쳐진 귀, 콩 3개 ... 너무 사랑스러워
						우리 팀 아직 3일밖에 안지났지만 화이팅 해봅시다.
						아자아자 화이자 !  
						</p>
					</div>
				</div>
			</li>
		</ul>
	</div>
	<!-- Tab01 끝 -->
	<div id='Tabid2' class="rivew_cont" style="display:none;"> 
		<ul style="display: flex; flex-wrap: wrap; justify-content: space-between;">
			<li>
			<a href="AfterView.jsp">
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
						강아지 너무 귀여워 동구들 짱짱입니다 ! 한쪽만 펼쳐진 귀, 콩 3개 ... 너무 사랑스러워
						우리 팀 아직 3일밖에 안지났지만 화이팅 해봅시다.
						아자아자 화이자 !  
						</p>
					</div>
				</div>
			</a>
			</li>
		</ul>
	</div>
</section>
<%@include file="../Footer.jsp" %>
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
</body>
</html>