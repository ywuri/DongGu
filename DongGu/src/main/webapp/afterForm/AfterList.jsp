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
<style>
	.rivew {
		padding-top:200px;
	}
	.rivew .box {
	    flex-direction: column;
	}
	.rivew .rivew_cont ul li {
	    width: 48%;
	}
	.rivew .left_box {
	    width: 100% !important;
	    height: 200px !important;
	    overflow: hidden;
	}
	.rivew .left_box img {
	    width: 100%;
	}
</style>
</head>
<%

	String cp_s = request.getParameter("cp");//현재 페이지 
	if(cp_s==null || cp_s.equals("")) cp_s="1";
	int cp = Integer.parseInt(cp_s);

	int listSize = 2; // 한 페이지에 표시할 게시물 수
	int pageSize = 5; // 페이지 버튼을 그룹으로 묶을 수 (예: 1~5 페이지 버튼).
	
	int rIdCheck = 0; // 기본값으로 DongGu 탭을 설정

	//리스트갖고오기
	//ArrayList<ReviewDTO> array = new ArrayList<>();
	//array = rdao.getReviewList(cp,listSize,rIdCheck);
	
	List<ReviewDTO> oreview = rdao.getReviewList(cp, listSize, 0); // rIdCheck = 0 (DongGu)
	List<ReviewDTO> preview = rdao.getReviewList(cp, listSize, 1); // rIdCheck = 1 (Other)
	
	
	//int totalCnt=rdao.getReviewCnt(); // 총 게시물 수	
	int totalCnt_ore = rdao.getReviewCnt(0);
	//System.out.println("totalCnt_ore ="+totalCnt_ore);
	int totalCnt_pre = rdao.getReviewCnt(1);
	//System.out.println("totalCnt_pre ="+totalCnt_pre);
	
	
	//int totalPage = totalCnt%listSize==0 ? (totalCnt/listSize):(totalCnt/listSize)+1;//총 페이지수
	int totalPage_ore = totalCnt_ore%listSize==0 ? (totalCnt_ore/listSize):(totalCnt_ore/listSize)+1;//총 페이지수
	int totalPage_pre = totalCnt_pre%listSize==0 ? (totalCnt_pre/listSize):(totalCnt_pre/listSize)+1;//총 페이지수

	//사용자 현재 위치 그룹(3이면 1쪽)
	//int userGroup = (cp/pageSize)+1;
	//if(cp%pageSize==0)  userGroup = userGroup-1;
	
	int userGroup_ore = (cp/pageSize)+1;
	if(cp%pageSize==0)  userGroup_ore = userGroup_ore-1;
	
	int userGroup_pre = (cp/pageSize)+1;
	if(cp%pageSize==0)  userGroup_pre = userGroup_pre-1;

	
	
%>
<body>
<%@include file="/SubHeader.jsp" %>

<section class="rivew" style="padding-top:200px;">
    <h3>실시간 동구</h3>
    <div class="radio-checked">
        <div class="radio-checked_highlight"></div>
        <div class="radio-checked_container">
            <input checked="checked" class="radio-checked_input" id="on" name="status" type="radio" value="on" /> 
            <label class="radio-checked_label radio-checked_label--on" onclick="Tabbutton(1)" for="on">DongGu</label> 
            <input class="radio-checked_input" id="off" name="status" type="radio" value="off" />
            <label class="radio-checked_label radio-checked_label--off" onclick="Tabbutton(2)" for="off">Other</label>
        </div>
    </div>
    <script language="javascript">
        function Tabbutton(index) {
            document.getElementById('Tabid1').style.display = index === 1 ? '' : 'none';
            document.getElementById('Tabid2').style.display = index === 2 ? '' : 'none';
            
            document.getElementById('tabdiv1').style.display = index === 1 ? '' : 'none';
            document.getElementById('tabdiv2').style.display = index === 2 ? '' : 'none';
        }
    </script>
    <div id='Tabid1' class="rivew_cont">
        <ul style="display: flex; flex-wrap: wrap; justify-content: space-between;">
            <%
                if (oreview != null && !oreview.isEmpty()) {
                    for (ReviewDTO dto : oreview) {
            %>
            <li>
                <a href="/DongGu/afterForm/AfterView.jsp?r_num=<%= dto.getR_num() %>">
                    <div class="box">
                        <div class="left_box">
                            <img src="/DongGu/img/<%= (dto.getR_img() != null && !dto.getR_img().isEmpty() && !"null".equals(dto.getR_img())) &&("").equals(dto.getR_img().trim()) ? dto.getR_img() : "/DongGu/img/default.png" %>" alt="이미지" onerror="this.onerror=null; this.src='/DongGu/img/default.png';">
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

    <div id='Tabid2' class="rivew_cont" style="display:none;">
        <ul style="display: flex; flex-wrap: wrap; justify-content: space-between;">
            <%
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
    
    
	<div id="tabdiv1" style="text-align: center;">
    <%
        if(totalCnt_ore != 0){
            if(userGroup_ore > 1 ){
    %>
                <input class="FreeBoardButton" type="button" value="이전"  
                onclick="location.href='/DongGu/afterForm/AfterList.jsp?cp=<%=(userGroup_ore-1)*pageSize %>';">
    <%
            }
            for(int i=(userGroup_ore-1)*pageSize+1; i<=(userGroup_ore-1)*pageSize+pageSize; i++){
                if(cp == i){
    %>
                &nbsp;&nbsp;<a href="/DongGu/afterForm/AfterList.jsp?cp=<%=i %>" class="FreeBoardPageNum" style="color:red;"><%=i %></a>&nbsp;&nbsp;
    <%
                } else {
    %>
                &nbsp;&nbsp;<a href="/DongGu/afterForm/AfterList.jsp?cp=<%=i %>" class="FreeBoardPageNum"><%=i %></a>&nbsp;&nbsp;
    <%
                }
                if(i == totalPage_ore) break;
            }
    %>
    <%
            if(userGroup_ore != totalPage_ore/pageSize+(totalPage_ore%pageSize==0?0:1)){
    %>
                <input class="FreeBoardButton" type="button" value="다음"  
                onclick="location.href='/DongGu/afterForm/AfterList.jsp?cp=<%= (userGroup_ore+1)*pageSize- (pageSize-1)%>';">
    <%
            }
        }
    %>
    </div>
    
    <div id="tabdiv2" style="text-align: center; display:none;">
    <%
        if(totalCnt_pre != 0){
            if(userGroup_pre > 1 ){
    %>
                <input class="FreeBoardButton" type="button" value="이전"  
                onclick="location.href='/DongGu/afterForm/AfterList.jsp?cp=<%=(userGroup_pre-1)*pageSize %>';">
    <%
            }
            for(int i=(userGroup_pre-1)*pageSize+1; i<=(userGroup_pre-1)*pageSize+pageSize; i++){
                if(cp == i){
    %>
                &nbsp;&nbsp;<a href="/DongGu/afterForm/AfterList.jsp?cp=<%=i %>" class="FreeBoardPageNum" style="color:red;"><%=i %></a>&nbsp;&nbsp;
    <%
                } else {
    %>
                &nbsp;&nbsp;<a href="/DongGu/afterForm/AfterList.jsp?cp=<%=i %>" class="FreeBoardPageNum"><%=i %></a>&nbsp;&nbsp;
    <%
                }
                if(i == totalPage_pre) break;
            }
    %>
    <%
            if(userGroup_pre != totalPage_pre/pageSize+(totalPage_pre%pageSize==0?0:1)){
    %>
                <input class="FreeBoardButton" type="button" value="다음"  
                onclick="location.href='/DongGu/afterForm/AfterList.jsp?cp=<%= (userGroup_pre+1)*pageSize- (pageSize-1)%>';">
    <%
            }
        }
    %>
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
