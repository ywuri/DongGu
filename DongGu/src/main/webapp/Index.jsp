<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.DongGu.review.ReviewDAO" %>
<%@ page import="com.DongGu.review.ReviewDTO" %>
<jsp:useBean id="rdao" class="com.DongGu.review.ReviewDAO"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.css" rel="stylesheet">
</head>
<body>
<%@include file="Header.jsp" %>
<!-- main 시작 -->
<section class="main">
	<div>
		<div class="main_img" >
			<img src="img/main_img.png" data-aos="fade-up" data-aos-duration="1000" alt="메인이미지">
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
			지금까지 <span style="display: inline-block; min-width: 145px;" class="counting" data-count="24,203">0</span><span>명의</span><br>
			동물친구들이 지원했어요!
			</p>
		</div>
		<div class="ct_txt02">
			<p>
			<span style="font-size: 20px; font-weight: 400; color: #b2b2b2;">동물친구와 매칭된 건수</span><br>
			<span style="display: inline-block; min-width: 250px;" class="counting" data-count="131,908">0</span></p>
		</div>
	</div>
</section>
<!-- count 끝 -->
<!-- rivew 시작 -->
<section class="rivew" data-aos="fade-down" data-aos-duration="1500">
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
	    function Tabbutton(index) {
	        for (i = 1; i <= 2; i++) {
	            if (index == i) {
	                document.getElementById("Tabid" + index).style.display = "";
	            } else {
	                document.getElementById("Tabid" + i).style.display = "none";
	            }
	        }
	    }
	</script>

	<!-- Tabid1 시작 -->
	<div id='Tabid1' class="rivew_cont">
		<ul>
			<%
	            List<ReviewDTO> oreview = rdao.MainAfterList(0);
	            if (oreview != null && !oreview.isEmpty()) {
	                for (ReviewDTO dto : oreview) {
       		 %>
        <li>
        <a href="/DongGu/afterForm/AfterView.jsp?r_num=<%= dto.getR_num() %>">
            <div class="box">
                <div class="left_box" >
                    <img src="/DongGu/img/<%= (dto.getR_img() != null && !dto.getR_img().isEmpty() && !"null".equals(dto.getR_img())) &&!("").equals(dto.getR_img().trim()) ? dto.getR_img() : "default.png" %>" alt="이미지" onerror="this.onerror=null; this.src='/DongGu/img/default.png';">
                </div>
                <div class="right_box" style="width:500px;">
                    <div class="rb_title">
                        <span class="best">Best</span>
                        <span class="addr"><%= dto.getNickname() %></span>
                        <span class="date"><%= dto.getR_date() %></span>
                    </div>
                    <img src="img/star.png" alt="별점">
                    <p><%= dto.getR_content() %></p>
                </div>
            </div>
        </a>
        </li>
        <%
                }
            } else {
                out.println("No reviews available.");
            }
        %>
		</ul>
	</div>
	<!-- Tabid1 끝 -->

	<!-- Tabid2 시작 -->
	<div id='Tabid2' class="rivew_cont"  style="display:none;">
		<ul>
			<%
		        // 변수명을 변경하여 중복 선언 문제를 피합니다.
		        List<ReviewDTO> preview = rdao.MainAfterList(1);
		        if (preview != null && !preview.isEmpty()) {
		            for (ReviewDTO dto : preview) {
		            //System.out.println("DTO 내용 확인: " + dto.getR_content());
	        %>
        <li>
        <a href="/DongGu/afterForm/NoDongguAfterView.jsp?r_num=<%= dto.getR_num() %>">
            <div class="box">
                <div class="left_box">
                    <img src="/DongGu/img/<%= (dto.getR_img() != null && !dto.getR_img().isEmpty() && !"null".equals(dto.getR_img())) &&!("").equals(dto.getR_img().trim()) ? dto.getR_img() : "default.png" %>" alt="이미지" onerror="this.onerror=null; this.src='/DongGu/img/default.png';">
                </div>
                <div class="right_box" style="width:500px;">
                    <div class="rb_title">
                        <span class="best">Best</span>
                        <span class="addr"><%= dto.getNickname() %></span>
                        <span class="date"><%= dto.getR_date() %></span>
                    </div>
                    <img src="img/star.png" alt="별점">
                    <p><%= dto.getR_content() %></p>
                </div>
            </div>
        </a>
        </li>
        <%
                }
            } else {
                out.println("No reviews available.");
            }
        %>
		</ul>
	</div>
	<!-- Tabid2 끝 -->

	<div class="rivew_bt">
		<p style="font-weight: 500;"><a href="/DongGu/afterForm/AfterList.jsp">후기 더 보기</a></p>
		<img src="img/icon_dog_bk.png" class="normal">
		<img src="img/icon_dog.png" class="hover" >
	</div>
</section>
<!-- rivew 끝 -->
<!-- banner 시작 -->
<section class="bn">
	<div class="bk_bn aos-init aos-animate" style="position:relative;"  data-aos="fade-down" data-aos-duration="1500">
		<div class="txt" style="position:absolute;">
			<p class="big_txt">
				보호자님, 내 반려동물과 함께 할 수 있는<br>
				<b style="color:#fdcb08;">동구플레이스</b>를 찾아보세요!
			</p>		
			<p class="small_txt">
				700만 반려인들의 행복한 순간,<br>
				직접 찾아 추천하는 동구의 추천 카페를 소개합니다.
			</p>
			<a href="/DongGu/DongGuPlace.jsp">
				<div class="bn_bt">
					<p style="font-weight: 500;">바로가기</p>
					<img src="img/icon_dog.png">
				</div>
			</a>
		</div>
		<div class="img"></div>
	</div>
</section>
<!-- banner 끝 -->

<script>
// 탭 버튼 애니메이션
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
  
// count 섹션
  $(document).ready(function() {
	  var countStarted = false;

	  // 스크롤 이벤트 핸들러
	  $(window).on('scroll', function() {
	    var countSection = $('.count').offset().top;  // count 섹션의 상단 위치
	    var scrollPosition = $(window).scrollTop() + $(window).height();  // 현재 스크롤 위치 + 창 높이

	    if (!countStarted && scrollPosition > countSection) {
	      countStarted = true;  // 카운트 시작
	      startCounting();
	    }
	  });

	  function startCounting() {
	    // 숫자 카운트 애니메이션
	    $('.counting').each(function() {
	      var $this = $(this),
	          countTo = $this.attr('data-count').replace(/,/g, ''); // 콤마 제거
	      $({ countNum: $this.text()}).animate({
	        countNum: countTo
	      },
	      {
	        duration: 3000, // 3초 동안 카운트
	        easing:'linear',
	        step: function() {
	          $this.text(Math.floor(this.countNum).toLocaleString('en')); // 콤마 추가
	        },
	        complete: function() {
	          $this.text(this.countNum.toLocaleString('en')); // 콤마 추가
	        }
	      });  
	    });
	  }
	});
</script>
<script src="https://cdn.jsdelivr.net/npm/aos@2.3.4/dist/aos.js"></script>
<script>
  AOS.init();
</script>
</body>
<%@include file="Footer.jsp" %>
