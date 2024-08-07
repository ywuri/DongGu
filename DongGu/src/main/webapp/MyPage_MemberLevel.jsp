<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="/css/DongGu.css">
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
	                <span class="jyl_content2_title">나의회원 등급</span>              
	  </div>
	  
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
                    <li class="jyl_memberlevellist">                              
						           <div class="jyl_memberlevel_moreInfo"><span>등급별 혜택보기</span></div>     						                                   
                    </li>
              </ul>  
	  </div>
	  
	   <div class="jyl_memberlevel"> 
	  			<div id="jyl_memberlevel2">
                    		<div class="jyl_memberlevel_predict">
                             	<span  class="jyl_memberlevel_span1">다음달 예상 등급  &nbsp; <span class="jyl_memberlevel_span2">다이아메달</span></span>                            	
                            </div>
                            
            				 <hr class="jyl_memberlevel2_hr">
            				 
                    		<div class="jyl_memberlevel_msg">
                    		<span class="jyl_memberlevel_span3">한번만 더 지원하면 <br>다음달 다이아메달 혜택을 받을 수 있어요</span>
                    		</div>
                   
                            <div class="jyl_memberlevel_advantage">
                             <span >황금메달 혜택 : </span>
                            </div>              
               </div>   
	  </div>
	  
	  <div class="jyl_memberlevel2_hr2div"><hr class="jyl_memberlevel2_hr2"></div>
	  
	  <div class="jyl_memberlevel_more"> 
	  			<div id="jyl_memberlevel3">   
	                <span class="jyl_memberlevel3_title">등급별 혜택보기</span>              
	  			</div>
	  </div>
      
      <div class="jyl_memberlevel"> 
	  			<div id="jyl_memberlevel4">
	  					
	  					<div class="jyl_memberlevel_more1">
                    		<div class="jyl_memberlevel_more1_1">
                             	<span>등급</span>
                            </div>
                            <div class="jyl_memberlevel_more1_2">
                             	<span>등급별 혜택</span>
                            </div>
            			</div>
            			
            			
            			<div class="jyl_memberlevel_more2">
                    		<div class="jyl_memberlevel_more2_1">
                                <img class="jyl_memberlevel_more2_img" alt="list1" src="img/yel28.png">
                            </div>
                            <div class="jyl_memberlevel_more2_2">
                            	<div class="jyl_memberlevel_more2_2_1"><span>100번 이상 지원 & 평점 4.0 이상</span></div>
                            	<hr class="jyl_memberlevel_more2_2_hr">
                             	<div class="jyl_memberlevel_more2_2_2"><span>지원시 우선권 지급 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>초대장 자체 급여 +10% 지원금 지급 </span></div>
                            </div>
            			</div>
            			
            			<hr class="jyl_memberlevel_more2_2_hr2">
            			
            			<div class="jyl_memberlevel_more2">
                    		<div class="jyl_memberlevel_more2_1">
                                <img class="jyl_memberlevel_more2_img" alt="list1" src="img/yel24.png">
                            </div>
                            <div class="jyl_memberlevel_more2_2">
                            	<div class="jyl_memberlevel_more2_2_1"><span>100번 이상 지원 & 평점 4.0 이상</span></div>
                            	<hr class="jyl_memberlevel_more2_2_hr">
                             	<div class="jyl_memberlevel_more2_2_2"><span>지원시 우선권 지급 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>초대장 자체 급여 +10% 지원금 지급 </span></div>
                            </div>
            			</div>
            			
            			<hr class="jyl_memberlevel_more2_2_hr2">
            			
            			<div class="jyl_memberlevel_more2">
                    		<div class="jyl_memberlevel_more2_1">
                                <img class="jyl_memberlevel_more2_img" alt="list1" src="img/yel25.png">
                            </div>
                            <div class="jyl_memberlevel_more2_2">
                            	<div class="jyl_memberlevel_more2_2_1"><span>100번 이상 지원 & 평점 4.0 이상</span></div>
                            	<hr class="jyl_memberlevel_more2_2_hr">
                             	<div class="jyl_memberlevel_more2_2_2"><span>지원시 우선권 지급 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>초대장 자체 급여 +10% 지원금 지급 </span></div>
                            </div>
            			</div>
            			
            			<hr class="jyl_memberlevel_more2_2_hr2">
            			
            			<div class="jyl_memberlevel_more2">
                    		<div class="jyl_memberlevel_more2_1">
                                <img class="jyl_memberlevel_more2_img" alt="list1" src="img/yel26.png">
                            </div>
                            <div class="jyl_memberlevel_more2_2">
                            	<div class="jyl_memberlevel_more2_2_1"><span>100번 이상 지원 & 평점 4.0 이상</span></div>
                            	<hr class="jyl_memberlevel_more2_2_hr">
                             	<div class="jyl_memberlevel_more2_2_2"><span>지원시 우선권 지급 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>초대장 자체 급여 +10% 지원금 지급 </span></div>
                            </div>
            			</div>
            			
            			<hr class="jyl_memberlevel_more2_2_hr2">
            			
            			<div class="jyl_memberlevel_more2">
                    		<div class="jyl_memberlevel_more2_1">
                                <img class="jyl_memberlevel_more2_img" alt="list1" src="img/yel27.png">
                            </div>
                            <div class="jyl_memberlevel_more2_2">
                            	<div class="jyl_memberlevel_more2_2_1"><span>100번 이상 지원 & 평점 4.0 이상</span></div>
                            	<hr class="jyl_memberlevel_more2_2_hr">
                             	<div class="jyl_memberlevel_more2_2_2"><span>지원시 우선권 지급 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>초대장 자체 급여 +10% 지원금 지급 </span></div>
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