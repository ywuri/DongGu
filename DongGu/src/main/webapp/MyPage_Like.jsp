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
<body >

<%@include file="Header.jsp" %>

<div id="jyl_body">
<div class="jyl_container">
     <!------------- 왼쪽 사이드 메뉴 영역 ----------->
    <div class="jyl_sidebar">
      <ul class="jyl_menu">
        <li><a class="side_title" href="MyPage.jsp">My Home</a></li>
        <li><a class="side_title" href="MyPage_ApplyList.jsp">나의 이력</a></li>
          <li><a href="MyPage_ApplyList.jsp">지원 내역</a></li>
        <li><a href="#">지원서 관리</a></li>     
        <li><a class="side_title" href="MyPage_Like.jsp">나의 활동</a></li>
        <li><a href="MyPage_Like.jsp">관심 내역</a></li>
        <li><a href="MyPage_BoardList.jsp">게시판 활동 내역</a></li>
        <li><a href="MyPage_ReviewList.jsp">이용 후기 내역</a></li>
        <li><a class="side_title" href="MyPage_InfoUpdate.jsp"">회원 정보</a></li>
        <li><a href="MyPage_InfoUpdate.jsp">회원정보 수정</a></li>
        <li><a href="MyPage_MemberLevel.jsp">나의회원 등급</a></li>
        <li><a class="side_title" href="#">1:1 문의</a></li>
      </ul>
    </div>
    <!------------- E : 왼쪽 메뉴 영역 ----------->
    
    <!------------- 오른쪽 컨텐츠 영역 ----------->
    
    <div class="jyl_content">
    
   <div class="jyl_content2">   
                <span class="jyl_content2_title">관심 내역</span>              
      </div>
      
      <div class="like_category">
      <div class="like_category_list">관심 초대장</div>
      <div class="like_category_list">관심 게시판</div>
      <div class="like_category_list">관심 동구</div>
      
      </div>
      
      <div class="like_array">
      
     <div class="jyl_like_list">
     <div class="jyl_like_list1">   
        <div class="jyl_likeimg_margin">
        	<img class="jyl_likeimg_heart" alt="likelist1" src="/DongGu/img/yel13.png">
           <img class="jyl_likeimg" alt="likelist1" src="/DongGu/img/yel9.jpg">
        </div>
        <div class="jyl_like_list1_info">
                <ul>
                  <li class ="jyl_like_info1"><span class ="jyl_like_info_title">나는야 쑝이!</span></li>
                  <li class ="jyl_like_info1"><span class ="jyl_like_info_date">2024-08-28 ~ 2024-08-31</span></li>
                  <li class ="jyl_like_info1"><span class ="jyl_like_info_star">글쓴이 평점: <img class="jyl_likestar_img" alt="likestar" src="/DongGu/img/yel6.png"><span class="like_point">4.8</span> (29)</span></li>
              </ul>
       </div>
      </div>
      </div>
      
      
      <div class="jyl_like_list">
      <div class="jyl_like_list1">   
        <div class="jyl_likeimg_margin">
        	<img class="jyl_likeimg_heart" alt="likelist1" src="/DongGu/img/yel13.png">
           <img class="jyl_likeimg" alt="likelist1" src="/DongGu/img/yel10.jpg">
        </div>
        <div class="jyl_like_list1_info">
                <ul>
                  <li class ="jyl_like_info1"><span class ="jyl_like_info_title">9월1일 아침 저녁 산책 급구해요!</span></li>
                  <li class ="jyl_like_info1"><span class ="jyl_like_info_date">2024-09-01</span></li>
                  <li class ="jyl_like_info1"><span class ="jyl_like_info_star">글쓴이 평점: <img class="jyl_likestar_img" alt="likestar" src="/DongGu/img/yel6.png"><span class="like_point">4.9</span> (10)</span></li>
              </ul>
       </div>
      </div>
      </div>
      
      
      <div class="jyl_like_list">
      <div class="jyl_like_list1">   
        <div class="jyl_likeimg_margin">
        	<img class="jyl_likeimg_heart" alt="likelist1" src="/DongGu/img/yel13.png">
           <img class="jyl_likeimg" alt="likelist1" src="/DongGu/img/yel11.jpg">
        </div>
        <div class="jyl_like_list1_info">
                <ul>
                  <li class ="jyl_like_info1"><span class ="jyl_like_info_title">아기고양이 하루만 봐주실분</span></li>
                  <li class ="jyl_like_info1"><span class ="jyl_like_info_date">2024-08-21</span></li>
                  <li class ="jyl_like_info1"><span class ="jyl_like_info_star">글쓴이 평점: <img class="jyl_likestar_img" alt="likestar" src="/DongGu/img/yel6.png"><span class="like_point">4.8</span> (103)</span></li>
              </ul>
       </div>
      </div>
      </div>
      
      <br>
      
      <div class="jyl_like_list">
      <div class="jyl_like_list1">   
        <div class="jyl_likeimg_margin">
        	<img class="jyl_likeimg_heart" alt="likelist1" src="/DongGu/img/yel13.png">
           <img class="jyl_likeimg" alt="likelist1" src="/DongGu/img/yel12.jpg">
        </div>
        <div class="jyl_like_list1_info">
                <ul>
                  <li class ="jyl_like_info1"><span class ="jyl_like_info_title">귀요미 푸들 휴일동안 펫시터 구해욥</span></li>
                  <li class ="jyl_like_info1"><span class ="jyl_like_info_date">2024-08-14 ~ 2024-08-18</span></li>
                  <li class ="jyl_like_info1"><span class ="jyl_like_info_star">글쓴이 평점: <img class="jyl_likestar_img" alt="likestar" src="/DongGu/img/yel6.png"><span class="like_point">4.9</span> (33)</span></li>
              </ul>
       </div>
      </div>
      </div>
      
      
 	</div>     
     
</div>
      
      
    <!------------- E : 오른쪽 컨텐츠 영역 ----------->
</div>
</div>
</body>
<%@include file="Footer.jsp" %>
</html>