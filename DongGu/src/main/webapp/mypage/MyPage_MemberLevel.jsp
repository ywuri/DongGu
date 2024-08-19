<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
</head>
<body >

<%@include file="../Header.jsp" %>

<div id="jyl_body">
<div class="jyl_container">

     <!------------- 왼쪽 사이드 메뉴 영역 시작 ----------->
	     <div class="jyl_sidebar">
	     <ul class="jyl_menu">
	        <li><a class="side_title" href="/DongGu/mypage/MyPage.jsp"><span>My Home</span></a></li>
	        <li>
	            <a class="side_title toggle-menu" href="#"><span>나의 지원</span></a>                   
	            <ul class="submenu1">
	                <li class="jyl_submenu"><a href="/DongGu/mypage/MyPage_ApplyList.jsp"><span>지원 내역</span></a></li>
	                <li id="submenu_last" class="jyl_submenu"><a href="/DongGu/mypage/MyPage_ApplyManage.jsp"><span>지원서 관리</span></a></li>
	             </ul>
	        </li>  
	       
	        <li>
	            <a class="side_title toggle-menu" href="#"><span>나의 활동</span></a>
	            <ul class="submenu1">
	                <li class="jyl_submenu_check"><a href="/DongGu/mypage/MyPage_Like.jsp"><span>관심 내역</span></a></li>
	                <li class="jyl_submenu"><a href="/DongGu/mypage/MyPage_BoardList.jsp"><span>게시판 활동 내역</span></a></li>
	                <li id="submenu_last" class="jyl_submenu"><a href="/DongGu/mypage/MyPage_ReviewList.jsp"><span>이용 후기 내역</span></a></li>
	            </ul>
	        </li>
	        <li class="jyl_menu1">
	            <a class="side_title toggle-menu" href="#"><span>회원 정보</span></a>
	            <ul class="submenu1">
	                <li class="jyl_submenu"><a href="/DongGu/mypage/MyPage_InfoUpdate.jsp"><span>회원정보 수정</span></a></li>
	                <li id="submenu_last" class="jyl_submenu_check"><a href="/DongGu/mypage/MyPage_MemberLevel.jsp"><span>나의 회원 등급</span></a></li>
	            </ul>
	        </li>
	        <li><a class="side_title" href="#"><span>1:1 문의</span></a></li>
	    </ul>
		</div>
		 <script>
		 document.addEventListener('DOMContentLoaded', function () {
			    document.querySelectorAll('.toggle-menu').forEach(function (menu) {
			        menu.addEventListener('click', function (e) {
			            e.preventDefault(); // 기본 앵커 동작을 방지
	
			            var submenu = this.nextElementSibling; 		            		           
	
			            // 클릭된 서브메뉴를 토글
			            if (submenu.style.maxHeight) {
			                submenu.style.maxHeight = null; // 서브메뉴 숨기기	               
			            } else {
			                submenu.style.maxHeight = submenu.scrollHeight + 'px'; // 서브메뉴 보여주기
			               		            }
			        });
			    });
			});
	    </script>
		<!------------- 왼쪽 사이드 메뉴 영역 끝----------->
    
    
    
    <!------------- 오른쪽 컨텐츠 영역 시작 ----------->    
    <div class="jyl_content">
    
      <div class="jyl_content1_1">   
	                <span class="jyl_content2_title">나의회원 등급</span>              
	  </div>
	  
	  <div class="jyl_memberlevel"> 
	  		<ul id="jyl_memberlevel1">
                    <li class="jyl_memberlevellist">
                    		<div class="image-container">
                                <img class="jyl_memberlevel_img" alt="list1" src="/DongGu/img/medal2.png">
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
                                <img class="jyl_memberlevel_more2_img" alt="list1" src="/DongGu/img/medal1.png">
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
                                <img class="jyl_memberlevel_more2_img" alt="list1" src="/DongGu/img/medal2.png">
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
                                <img class="jyl_memberlevel_more2_img" alt="list1" src="/DongGu/img/medal3.png">
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
                                <img class="jyl_memberlevel_more2_img" alt="list1" src="/DongGu/img/medal4.png">
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
                                <img class="jyl_memberlevel_more2_img" alt="list1" src="/DongGu/img/medal5.png">
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
    <!------------- 오른쪽 컨텐츠 영역 끝 ----------->
</div>
</div>
</body>
<%@include file="../Footer.jsp" %>
</html>