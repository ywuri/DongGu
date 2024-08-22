<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.DongGu.review.ReviewDTO" %>

<jsp:useBean id="rdao" class="com.DongGu.review.ReviewDAO"></jsp:useBean>
<%!
    String uploadPath = "/DongGu/";  // 실제 프로젝트의 경로로 수정해야 함
    String savepath = uploadPath + "img/animal/";
    
	// 별점 이미지
    String getStarImage(int r_star) {
        switch (r_star) {
            case 1:
                return "/DongGu/img/star_one.png";
            case 2:
                return "/DongGu/img/star_two.png";
            case 3:
                return "/DongGu/img/star_three.png";
            case 4:
                return "/DongGu/img/star_four.png";
            case 5:
                return "/DongGu/img/star.png";
            default:
                return "/DongGu/img/star.png"; // 기본 이미지 (0점)
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
</head>
<body>
<%@include file="/SubHeader.jsp" %>

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
        function Tabbutton(index) {
            for (i=1; i<=3; i++)
            if (index == i) {
                thisMenu = eval("Tabid" + index + ".style");
                thisMenu.display = "";
            } else {
                otherMenu = eval("Tabid" + i + ".style");
                otherMenu.display = "none";
            }
        }
    </script>
    <div id='Tabid1' class="rivew_cont">
    <ul style="display: flex; flex-wrap: wrap; justify-content: space-between;">
        <%
            List<ReviewDTO> oreview = rdao.AfterList(0);
            if (oreview != null && !oreview.isEmpty()) {
                for (ReviewDTO dto : oreview) {
                    //System.out.println("DTO 내용 확인: " + dto.getR_content());
        %>
        <li>
			<a href="/DongGu/afterForm/AfterView.jsp?r_num=<%= dto.getR_num() %>">
		        <div class="box">
		            <div class="left_box">
		            	<img src="<%= (dto.getR_img() != null && !dto.getR_img().isEmpty() && !"null".equals(dto.getR_img())) &&("").equals(dto.getR_img().trim()) ? dto.getR_img() : "/DongGu/img/default.png" %>" alt="이미지">
		            </div> 
		            <div class="right_box">
		                <div class="rb_title">
		                    <span class="best">Best</span>
		                    <span class="addr"><%= dto.getNickname() %>[고용자]</span>
		                    <span class="date"><%= dto.getR_date() %></span>
		                </div>
		                <!-- <img src="/DongGu/img/star.png" alt="별점"> -->
		                <img src="<%= getStarImage(dto.getR_star()) %>" alt="별점">
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

	<div id='Tabid2' class="rivew_cont" style="display:none;">
    <ul style="display: flex; flex-wrap: wrap; justify-content: space-between;">
        <%
        // 변수명을 변경하여 중복 선언 문제를 피합니다.
        List<ReviewDTO> preview = rdao.AfterList(1);
        if (preview != null && !preview.isEmpty()) {
            for (ReviewDTO dto : preview) {
                //System.out.println("DTO 내용 확인: " + dto.getR_content());
        %>
        <li>
		    <a href="/DongGu/afterForm/NoDongguAfterView.jsp?r_num=<%= dto.getR_num() %>">
		        <div class="box">
		            <div class="left_box">
		            	<img src="<%= (dto.getR_img() != null && !dto.getR_img().isEmpty() && !"null".equals(dto.getR_img())) &&("").equals(dto.getR_img().trim()) ? dto.getR_img() : "/DongGu/img/default.png" %>" alt="이미지">
		            </div> 
		            <div class="right_box">
		                <div class="rb_title">
		                    <span class="best">Best</span>
		                    <%-- <span class="addr"><a href="/DongGu/member/MemberDetail.jsp"><%= dto.getNickname() %>[고용자]</a></span> --%>
		                    <span class="addr"><%= dto.getNickname() %>[구직자]</span>
		                    <span class="date"><%= dto.getR_date() %></span>
		                </div>
		                 <img src="<%= getStarImage(dto.getR_star()) %>" alt="별점">
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
        document.documentElement.style.setProperty('--highlight-left', '120px');
      }
    });
  });
</script>
</body>
</html>