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
<body>

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
	                <span class="jyl_content2_title"> 이용후기 내역</span>              
	      </div>
	      
	      <div class="like_category">
	      <div class="like_category_list">내가 작성한 후기</div>
	      <div class="like_category_list">내가 받은 후기</div>
	      </div>
      
    <div class="jyl_reviewList">
    
    
     <div class="jyl_reviewList_list1">   
       	<div class="">
           <img class="jyl_reviewList_img" alt="list1" src="/DongGu/img/yel15.jpg">
        </div>
        <div class="jyl_reviewList_content">
       		 <div class="like_category_list3">내가 작성한 후기</div>         
        	<div class="jyl_reviewList_content_img"><img class="reviewlist_img" src="img/star.png" alt="별점"></div>
        	<div class="jyl_reviewList_content_page">강아지가 너무 순해서 하나도 안힘들고, 주인분께서도 친절하게 연락주시고 맛있는것도 사주셔서 너무 좋았습니다! 강추해요~~~~</div>      
        </div>       
      </div>
     
      
      <div class="jyl_reviewList_list2">   
       <div class="">
           <img class="jyl_reviewList_img" alt="list1" src="/DongGu/img/yel16.jpg">
        </div>
        <div class="jyl_reviewList_content">
       		 <div class="like_category_list4">내가 받은 후기</div>         
        	<div class="jyl_reviewList_content_img"><img class="reviewlist_img" src="img/star.png" alt="별점"></div>
        	<div class="jyl_reviewList_content_page">동구님이 너무 잘 봐주셔서 아이가 더 밝아졌어요!!! 다음에도 또 꼭...! 와주셨으면 좋겠을 정도로 최고였습니다. </div>      
        </div>             
      </div>
      
       <div class="jyl_reviewList_list2">   
       	<div class="">
           <img class="jyl_reviewList_img" alt="list1" src="/DongGu/img/yel17.jpg">
        </div>
        <div class="jyl_reviewList_content">
       		 <div class="like_category_list4">내가 받은 후기</div>         
        	<div class="jyl_reviewList_content_img"><img class="reviewlist_img" src="img/star.png" alt="별점"></div>
        	<div class="jyl_reviewList_content_page">우리 고양이 되게 활발해서 많이 놀아줘야 하는데 동구님이 정말ㅋㅋㅋㅋㅋ 제대로 놀아주셨더라구요^^ 너무 감사합니다ㅠㅠ</div>      
        </div>       
      </div>
     
      
      <div class="jyl_reviewList_list2">   
       <div class="">
           <img class="jyl_reviewList_img" alt="list1" src="/DongGu/img/yel18.jpg">
        </div>
        <div class="jyl_reviewList_content">
       		 <div class="like_category_list4">내가 받은 후기</div>         
        	<div class="jyl_reviewList_content_img"><img class="reviewlist_img" src="img/star.png" alt="별점"></div>
        	<div class="jyl_reviewList_content_page">목욕을 정말 너무 잘시켜주셨어요! 걱정할까봐 이렇게 사진도 찍어서 계속 보내주시고^^ 정말 좋았습니다!</div>      
        </div>             
      </div>
      
      <div class="jyl_reviewList_list2">   
       <div class="">
           <img class="jyl_reviewList_img" alt="list1" src="/DongGu/img/yel19.jpg">
        </div>
        <div class="jyl_reviewList_content">
       		 <div class="like_category_list4">내가 받은 후기</div>         
        	<div class="jyl_reviewList_content_img"><img class="reviewlist_img" src="img/star.png" alt="별점"></div>
        	<div class="jyl_reviewList_content_page">예민한 고양이라 신경써야 할게 많았는데 동구님이 고양이를 키우셔서 그런지 너무 세심하게 잘 챙겨주셨어요. 솔직히 이렇게까지 정...</div>      
        </div>             
      </div>
      
       <div class="jyl_reviewList_list1">   
       	<div class="">
           <img class="jyl_reviewList_img" alt="list1" src="/DongGu/img/yel20.jpg">
        </div>
        <div class="jyl_reviewList_content">
       		 <div class="like_category_list3">내가 작성한 후기</div>         
        	<div class="jyl_reviewList_content_img"><img class="reviewlist_img" src="img/star.png" alt="별점"></div>
        	<div class="jyl_reviewList_content_page">쑝이ㅋㅋㅋㅋㅋ나이가 많은줄 모를만큼 정말 잘 놀고 잘 먹고 잘 자네요!! 아이랑 같이 보낸 시간이 좋았어요!!ㅎ 다음에도 기회가 된다면....</div>      
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