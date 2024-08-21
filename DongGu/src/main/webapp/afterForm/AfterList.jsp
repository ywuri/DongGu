<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.DongGu.friend.AfterDTO" %>

<jsp:useBean id="afdao" class="com.DongGu.friend.AfterDAO"></jsp:useBean>
<%
    String uploadPath = "/DongGu/";  // 실제 프로젝트의 경로로 수정해야 함
    String savepath = uploadPath + "img/webFolder/upload/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
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
                List<AfterDTO> oreview = afdao.AfterList(0); // R_ID_CHECK가 0인 후기만 가져오기
                if (oreview != null && !oreview.isEmpty()) {
                    for (AfterDTO dto : oreview) {
                        System.out.println("DTO 내용 확인: " + dto.getR_content());

            %>
            <li>
                <a href="/DongGu/afterForm/AfterView.jsp">
                    <div class="box">
                        <div class="left_box" style="background-image: url('<%= dto.getR_img_name() != null && !dto.getR_img_name().isEmpty() ? savepath + dto.getR_img_name() : "/DongGu/img/default.png" %>');">
                        </div>
                        <div class="right_box">
                            <div class="rb_title">
                                <span class="best">Best</span>
                                <span class="addr"><a href="/DongGu/member/MemberDetail.jsp"><%= dto.getNickname() %>[고용자]</a></span>
                                <span class="date"><%= dto.getR_date() %></span>
                            </div>
                            <img src="/DongGu/img/star.png" alt="별점">
                            <p><%= dto.getR_content() %></p>
                        </div>
                    </div>
                </a>
            </li>
            <%
                    }
                } else {
            %>
            <p>No reviews available.</p>
            <%
                }
            %>
        </ul>
    </div>
    <div id='Tabid2' class="rivew_cont" style="display:none;">
        <ul style="display: flex; flex-wrap: wrap; justify-content: space-between;">
            <%
                List<AfterDTO> preview = afdao.AfterList(1); // R_ID_CHECK가 1인 후기만 가져오기
                if (preview != null && !preview.isEmpty()) {
                    for (AfterDTO dto : preview) {
                        System.out.println("DTO 내용 확인: " + dto.getR_content());

            %>
            <li>
                <a href="/DongGu/afterForm/AfterView.jsp">
                    <div class="box">
                        <div class="left_box" style="background-image: url('<%= dto.getR_img_name() != null && !dto.getR_img_name().isEmpty() ? savepath + dto.getR_img_name() : "/DongGu/img/default.png" %>');">
                        </div>
                        <div class="right_box">
                            <div class="rb_title">
                                <span class="best">Best</span>
                                <span class="addr"><a href="/DongGu/member/MemberDetail.jsp"><%= dto.getNickname() %>[동구]</a></span>
                                <span class="date"><%= dto.getR_date() %></span>
                            </div>
                            <img src="/DongGu/img/star.png" alt="별점">
                            <p><%= dto.getR_content() %></p>
                        </div>
                    </div>
                </a>
            </li>
            <%
                    }
                } else {
            %>
            <p>No reviews available.</p>
            <%
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
