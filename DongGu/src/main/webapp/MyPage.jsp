<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
</head>
<body id="jyl_body">

<%@include file="Header.jsp" %>


<div class="jyl_container">
    <!------------- 왼쪽 사이드 메뉴 영역 ----------->
    <div class="jyl_sidebar">
      <ul class="jyl_menu">
        <li><a href="#">My Home</a></li>
        <li><a href="#">나의 이력</a></li>
        <li><a href="#">나의 활동</a></li>
        <li><a href="#">회원 관리</a></li>
        <li><a href="#">1:1 문의</a></li>
      </ul>
    </div>
    <!------------- E : 왼쪽 메뉴 영역 ----------->
    
    <!------------- 오른쪽 컨텐츠 영역 ----------->
    <div class="jyl_content">
    
      <div class="jyl_content1">   
                <span class="jyl_content1_title">
                    <span class="jyl_name">진예림</span> 회원님의 이번 달 등급은 <span class="jyl_grade">프렌즈</span> 등급입니다.
                </span>              
      </div>
      
      <div class="jyl_content2">   
                <span class="jyl_content2_title">나의 이력</span>              
      </div>
      <hr class="jyl_content2_hr">
		
	  <div class="jyl_content2_list">   
	  	<div class="jyl_content2_title">
           <div class="jyl_content2_list_title1">멍구</div>      
           <div class="jyl_content2_list_title2">매칭대기</div> 
        </div>    
        <div>
           <img class="jyl_img" alt="list1" src="/DongGu/img/yel1.jpg">
        </div>
        <div class="jyl_list1_info">
             	<ul>
	            	<li class ="jyl_list1_1"><span class ="jyl_list1_1_title">잠실 석촌동 멍구합니다!</span></li>
	                <li class ="jyl_list1_1"><span class ="jyl_list1_1_date">2024-07-25</span></li>
	           </ul>
	    </div>
      </div>
      <div class="jyl_content2_list">   
	  	<div class="jyl_content2_title">
           <div class="jyl_content2_list_title1">냥구</div>      
           <div class="jyl_content2_list_title2">매칭완료</div> 
        </div>    
        <div>
           <img class="jyl_img" alt="list1" src="/DongGu/img/yel3.jpg">
        </div>
        <div class="jyl_list1_info">
             	<ul>
	            	<li class ="jyl_list1_1"><span class ="jyl_list1_1_title">아기고양이 하루 봐주실분~~</span></li>
	                <li class ="jyl_list1_1"><span class ="jyl_list1_1_date">2024-06-11</span></li>
	           </ul>
	    </div>
      </div>
 
</div>
   

    <!------------- E : 오른쪽 컨텐츠 영역 ----------->
</div>
<%@include file="Footer.jsp" %>
</body>
</html>