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
    <div>
    
    
    
    </div>
    
    <div class="jyl_content">
    
    <div class="jyl_memberlevel"> 
	  		<ul id="jyl_memberlevel1">
                    <li class="jyl_memberlevellist"> 
                    		<div class="image-container">
                                <img class="jyl_memberlevel_img" alt="list1" src="img/yel24.png">
                            </div>
                    </li>
                    <li class="jyl_memberlevellist">
                    		<div class="jyl_memberleve_msg">
                    		<span>진예림님의 이번달 등급은</span>
                    		</div>
                    </li>
                    <li class="jyl_memberlevellist">       
                                <div class="jyl_memberlevel_medal">
                                <span >황금메달 </span>
                                </div>              
                    </li>
              </ul>  
	  </div>
	  
	  
    <div class="jyl_info_short"> 
	  			<div id="jyl_info_short1">
                    <div id="jyl_info_short1_summary"><span id="jyl_info_short1_span"> summary</span></div>
                    <div id="jyl_info_short1_month" >진예림님의 8월 현황</div>
                    
                    
                    <div id="jyl_info_short2">
                    	<div id="jyl_info_short3"><img class="jyl_info_short3_img" alt="list1" src="img/yel29.png"></div>
                    	<div id="jyl_info_short4">
                    		<div id="jyl_info_short4_spandiv"><span id="jyl_info_short4_span">지원하기</span></div>
                    		<div class="jyl_graph">
                    			<div class="jyl_bar-background">
						            <div class="jyl_bar-fill1"></div>
						        </div>
						        <div class="jyl_label">
						            <span class="jyl_label1">2</span><span class="jyl_label2"> / 30</span>
						        </div>
						    </div>
                    	</div>
                   </div>
                   
                   <div id="jyl_info_short2">
                    	<div id="jyl_info_short3"><img class="jyl_info_short3_img" alt="list1" src="img/yel30.png"></div>
                    	<div id="jyl_info_short4">
                    		<div id="jyl_info_short4_spandiv"><span id="jyl_info_short4_span">관심 횟수</span></div>
                    		<div class="jyl_graph">
                    			<div class="jyl_bar-background">
						            <div class="jyl_bar-fill2"></div>
						        </div>
						        <div class="jyl_label">
						            <span class="jyl_label1">10</span><span class="jyl_label2"> / 30</span>
						        </div>
						    </div>
                    	</div>
                   </div>
                   
                   <div id="jyl_info_short2">
                    	<div id="jyl_info_short3"><img class="jyl_info_short3_img" alt="list1" src="img/yel6.png"></div>
                    	<div id="jyl_info_short4">
                    		<div id="jyl_info_short4_spandiv"><span id="jyl_info_short4_span">나의 평점</span></div>
                    		<div class="jyl_graph">
                    			<div class="jyl_bar-background">
						            <div class="jyl_bar-fill3"></div>
						        </div>
						        <div class="jyl_label">
						            <span class="jyl_label3">4.2</span><span class="jyl_label2"> / 5</span>
						        </div>
						    </div>
                    	</div>
                   </div>
                 
                  	
           </div>   
	  </div>


    
    
      <div class="jyl_content2">   
                <span class="jyl_content2_title">지원 내역</span>              
      </div>
      
     <div class="jyl_content2_list1">   
        <div class="jyl_content2_title_bottom">
           <div class="jyl_content2_list_title1">멍구</div>      
           <div class="jyl_content2_list_title2"><span class="jyl_content2_list_title2_1">매칭대기</span></div> 
        </div>    
        <div class="jyl_content2_list_area">
	        <div class="jyl_img_margin">
	           <img class="jyl_img" alt="list1" src="/DongGu/img/yel1.jpg">
	        </div>
        	<div class="jyl_list1_info">
                <ul>
                  <li class ="jyl_list1_1"><span class ="jyl_list1_1_title">잠실 석촌동 멍구!</span></li>
                   <li class ="jyl_list1_1"><span class ="jyl_list1_1_date">2024-07-25</span></li>
              </ul>
       	</div>    
       </div>
      </div>
      
      <div class="jyl_content2_list2">   
        <div class="jyl_content2_title_bottom">
           <div class="jyl_content2_list_title1">냥구</div>      
           <div class="jyl_content2_list_title2" ><span class="jyl_content2_list_title2_2">매칭완료</span></div> 
        </div>    
        <div class="jyl_img_margin">
           <img class="jyl_img" alt="list1" src="/DongGu/img/yel3.jpg">
        </div>
        <div class="jyl_list1_info">
                <ul>
                  <li class ="jyl_list1_1"><span class ="jyl_list1_1_title">아기고양이 하루 봐주실분~~</span></li>
                   <li class ="jyl_list1_1"><span class ="jyl_list1_1_date">2024-06-11</span></li>
              </ul>
       </div>
      </div>
      
      <div class="jyl_content2_list3_1">   
        <div class="jyl_content2_title_bottom">
           <div class="jyl_content2_list_title1">멍구</div>      
           <div class="jyl_content2_list_title2"><span class="jyl_content2_list_title2_3">후기작성 완료</span></div> 
        </div>    
        <div class="jyl_img_margin">
           <img class="jyl_img" alt="list1" src="/DongGu/img/yel4.jpg">
        </div>
        <div class="jyl_list1_info">
                <ul>
                  <li class ="jyl_list1_1"><span class ="jyl_list1_1_title">순한 푸들 4월 5일~8일까지 멍구 구해요!</span></li>
                   <li class ="jyl_list1_1"><span class ="jyl_list1_1_date">2024-03-31</span></li>
              </ul>
       </div>
      </div>
      
      <div class="jyl_content3">   
                <span class="jyl_content3_title">나의 활동</span>              
      </div>
      
      <div class="jyl_content3_list">
         <div class="jyl_content3_list1">   
         <span>♡   좋아한 </span>
        <a href="#"><img class="jyl_img2" alt="button" src="/DongGu/img/yel5.jpg"></a>
      </div>
      <div class="jyl_content3_list2">   
         <span>♡   게시판 활동 내역 </span>
        <a href="#"><img class="jyl_img2" alt="button" src="/DongGu/img/yel5.jpg"></a>
      </div>
      <div class="jyl_content3_list3">   
         <span>♡   이용 후기 내역 </span>
        <a href="#"><img class="jyl_img2" alt="button" src="/DongGu/img/yel5.jpg"></a>
      </div>
      </div>
 
</div>
    <!------------- E : 오른쪽 컨텐츠 영역 ----------->
</div>
</div>
</body>
<%@include file="Footer.jsp" %>
</html>