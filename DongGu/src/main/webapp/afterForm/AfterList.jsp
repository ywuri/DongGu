<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.DongGu.review.ReviewDTO" %>
<jsp:useBean id="rdao" class="com.DongGu.review.ReviewDAO"></jsp:useBean>
<%!
    String uploadPath = "/DongGu/";  // 실제 프로젝트의 경로로 수정해야 함
    String savepath = uploadPath + "img/webFolder/upload/";
    
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
<title>이용후기</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
<style>
    .rivew { padding-top: 200px; }
    .rivew .box { flex-direction: column; }
    .rivew .rivew_cont ul li { width: 48%; }
    .rivew .left_box { width: 100% !important; height: 200px !important; }
</style>
</head>
<body>
<%@include file="/SubHeader.jsp" %>

<section class="rivew" style="padding-top:200px;">
    <h3>실시간 동구</h3>
    <div class="radio-checked">
        <div class="radio-checked_highlight"></div>
        <div class="radio-checked_container">
            <input checked="checked" class="radio-checked_input" id="on" name="status" type="radio" value="on"
                   onclick="switchTab(1)" /> 
            <label class="radio-checked_label radio-checked_label--on" for="on">DongGu</label> 
            <input class="radio-checked_input" id="off" name="status" type="radio" value="off"
                   onclick="switchTab(2)" />
            <label class="radio-checked_label radio-checked_label--off" for="off">Other</label>
        </div>
    </div>
    
    <script language="javascript">
    function switchTab(index) {
        document.getElementById("selectedTab").value = index;  // 선택된 탭 상태를 저장
        localStorage.setItem('selectedTab', index); // localStorage에 탭 상태 저장
        for (let i = 1; i <= 2; i++) {
            const thisMenu = document.getElementById("Tabid" + i).style;
            thisMenu.display = (i === index) ? "" : "none";
        }

        // 하이라이트 위치를 설정
        const highlight = document.querySelector('.radio-checked_highlight');
        if (index === 1) {
            highlight.style.left = '0px';
        } else if (index === 2) {
            highlight.style.left = '120px';
        }
    }

    document.addEventListener("DOMContentLoaded", function() {
        // localStorage에서 선택된 탭 값을 가져옴
        const selectedTab = localStorage.getItem('selectedTab') || "1"; 
        document.getElementById("selectedTab").value = selectedTab;
        switchTab(parseInt(selectedTab));

        // 무한 스크롤 구현
        window.onscroll = function() {
            if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
                const form = document.getElementById('nextPageForm');
                form.cp.value = parseInt(form.cp.value) + 1; // 현재 페이지를 1 증가
                form.selectedTab.value = selectedTab; // 선택된 탭을 전송
                form.submit(); // 폼 전송
            }
        };
    });
</script>




	
    <div id="Tabid1" class="rivew_cont">
        <ul style="display: flex; flex-wrap: wrap; justify-content: space-between;">
            <%
                String cp_s = request.getParameter("cp");
                if (cp_s == null || cp_s.equals("")) cp_s = "1";
                int cp = Integer.parseInt(cp_s);

                List<ReviewDTO> oreview = rdao.AfterList(0);
                if (oreview != null && !oreview.isEmpty()) {
                    for (ReviewDTO dto : oreview) {
            %>
            <li>
                <a href="/DongGu/afterForm/AfterView.jsp?r_num=<%= dto.getR_num() %>">
                    <div class="box">
                        <div class="left_box">
                            <img src="/DongGu/img/<%= (dto.getR_img() != null && !dto.getR_img().isEmpty() && !"null".equals(dto.getR_img())) &&!("").equals(dto.getR_img().trim()) ? dto.getR_img() : "default.png" %>" alt="이미지" onerror="this.onerror=null; this.src='/DongGu/img/default.png';">
                        </div> 
                        <div class="right_box">
                            <div class="rb_title">
                                <span class="best">Best</span>
                                <span class="addr"><%= dto.getNickname() %>[고용자]</span>
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

    <div id="Tabid2" class="rivew_cont" style="display:none;">
        <ul style="display: flex; flex-wrap: wrap; justify-content: space-between;">
            <%
                List<ReviewDTO> preview = rdao.AfterList(1);
                if (preview != null && !preview.isEmpty()) {
                    for (ReviewDTO dto : preview) {
            %>
            <li>
                <a href="/DongGu/afterForm/NoDongguAfterView.jsp?r_num=<%= dto.getR_num() %>">
                    <div class="box">
                        <div class="left_box">
                            <img src="/DongGu/img/<%= (dto.getR_img() != null && !dto.getR_img().isEmpty() && !"null".equals(dto.getR_img())) &&!("").equals(dto.getR_img().trim()) ? dto.getR_img() : "default.png" %>" alt="이미지" onerror="this.onerror=null; this.src='/DongGu/img/default.png';">
                        </div> 
                        <div class="right_box">
                            <div class="rb_title">
                                <span class="best">Best</span>
                                <span class="addr"><%= dto.getNickname() %>[동구]</span>
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

    <form id="nextPageForm" method="get" action="AfterList.jsp">
    	<input type="hidden" name="cp" value="<%= cp %>"> <!-- 기본 페이지 값 설정 -->
    	<input type="hidden" id="selectedTab" name="selectedTab" value="<%= request.getParameter("selectedTab") != null ? request.getParameter("selectedTab") : "1" %>"> <!-- 탭 상태 유지 -->
	</form>



</section>

<%@include file="../Footer.jsp" %>
</body>
</html>
