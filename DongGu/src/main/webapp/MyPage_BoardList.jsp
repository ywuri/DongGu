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
	                <span class="jyl_content2_title"> 게시판 활동 내역</span>              
	      </div>
	      
	      <div class="like_category">
	      <div class="like_category_list">작성 게시글</div>
	      <div class="like_category_list">작성 댓글</div>
	      </div>
   
   
   
      	<div class="jyl_boardList">   
        <div class="jyl_boardList_info">
        <div class="like_category2">
           <div class="jyl_boardList_info_category"><span>자유 게시판</span></div>     
           <div class="like_category_list2">작성 게시글</div> 
        </div>
           <div class="jyl_boardList_info_title">노견한테 좋은 영양제 추천해주세요</div>
           <div class="jyl_boardList_info_content">14살 말티즈 노견인데 현재 엑티베이트는 먹이고 있는 중이고, 그 외에 간 영양제도 함께 복용시킬려는데<br>
           괜찮은 거 있을까요? 아니면 찾아보니까 벳 플러스 세밀린이 유명하다던데 이거 효과 좋나요? 노견 키우니까...</div>          
        </div>         
       <div class="jyl_img_margin">
           <img class="jyl_boardlist_img" alt="list1" src="/DongGu/img/yel14.jpg">
        </div>
      </div>
      
    
	    <div class="jyl_boardList">   
	        <div class="jyl_boardList_info2">
	        <div class="like_category2">
	           <div class="jyl_boardList_info_category">QnA 게시판</div>      
	            <div class="like_category_list2">작성 댓글</div> 
        	</div>	
	           <div class="jyl_boardList_info_title">거제에 혹시 애견 운동장 있나요?</div>
	           <div class="jyl_boardList_info_answer">애견 운동장은 없는데 둔덕가는길에 몽마르뜨라고 새로 생긴 애견 카페가 있는데 
	           거기에 큰 잔디 있는 마당?이 있어 아이들이 뛰어 놀기 좋아요~~~~</div>          
	        </div>         	      
	      </div>
        
     
</div>
      
      
    <!------------- E : 오른쪽 컨텐츠 영역 ----------->
</div>
</div>
</body>
<%@include file="Footer.jsp" %>
</html>