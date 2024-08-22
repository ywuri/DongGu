<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.sql.Date" %>    
<%@ page import="com.DongGu.mypage.MyPageDAO" %>    
<%@ page import="com.DongGu.mypage.MyPageDTO" %>  
<jsp:useBean id="dao" class="com.DongGu.mypage.MyPageDAO"></jsp:useBean>

<%
   String m_sid = (String)session.getAttribute("sid");
   String m_sname = (String)session.getAttribute("sname");
   Integer m_usertype = (Integer)session.getAttribute("usertype");  
   MyPageDTO dto = dao.mypage_memberLevel(m_sid);
%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
<style>
    .jyl_memberlevel_moreInfo {
        cursor: pointer; 
        transition: color 0.3s, text-decoration 0.3s; 
    }

    .jyl_memberlevel_moreInfo:hover {
        color: #77766f;
        text-decoration: none; 
    }
</style>
<script>
    function scrollToBenefits() {
        document.getElementById('benefits').scrollIntoView({
            behavior: 'smooth'
        });
    }
</script>
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
    
      <div class="jyl_content1">   
	                <span class="jyl_content2_title">나의 회원 등급</span>              
	  </div>
	  
	  <div class="jyl_memberlevel"> 
	  		<ul id="jyl_memberlevel1">
                    <li class="jyl_memberlevellist">
                    		<div class="image-container">
                                <img class="jyl_memberlevel_img" alt="list1" src="/DongGu/img/<%= dto.getG_img() %>">
                            </div>
                    </li>
                    <li class="jyl_memberlevellist">
                    		<div class="jyl_memberleve_msg">
                    		<span><%= m_sname %>님의 이번달 등급은</span>
                    		</div>
                    </li>
                    <li class="jyl_memberlevellist">       
                                <div class="jyl_memberlevel_medal">
                                <span ><%= dto.getG_name() %></span>
                                </div>              
                    </li>
                    <li class="jyl_memberlevellist">                              
						           <div class="jyl_memberlevel_moreInfo" role="button" tabindex="0" onclick="scrollToBenefits()"><span>등급별 혜택보기</span></div>     						                                   
                    </li>
              </ul>  
	  </div>
	  
	   <div class="jyl_memberlevel"> 
	  			<div id="jyl_memberlevel2">
                    		<div class="jyl_memberlevel_predict">
                             	<span  class="jyl_memberlevel_span1">다음 예상 등급  &nbsp; <span class="jyl_memberlevel_span2"><%= dto.getNextlevel() %></span></span>                            	
                            </div>
                            
            				 <hr class="jyl_memberlevel2_hr">
            				 
                    		<div class="jyl_memberlevel_msg">
                    		<span class="jyl_memberlevel_span3">앞으로 조금 더 지원하면 <br><%= dto.getNextlevel() %>이 될 수 있어요!</span>
                    		</div>
                   
                            <div class="jyl_memberlevel_advantage">
                             <% if(dto.getG_name().equals("다이아메달")){%>
                             <span>다이아메달 혜택 : 지원시 제 1 우선권 지급 + 급여 50,000원</span>
                             <%}else if(dto.getG_name().equals("황금메달")){%>
                             <span>황금메달 혜택 : 지원시 제 2 우선권 지급 + 급여 45,000원</span>
                             <%}else if(dto.getG_name().equals("금메달")){%>
                             <span>금메달 혜택 : 지원시 제 3 우선권 지급 + 급여 40,000원</span>
                             <%}else if(dto.getG_name().equals("은메달")){%>
                             <span>은메달 혜택 : 지원시 제 4 우선권 지급 + 급여 35,000원</span>
                             <%}else if(dto.getG_name().equals("동메달")){%>
                             <span>은메달 혜택 : 지원시 제 4 우선권 지급 + 급여 30,000원</span>
                             <%}%>
                            </div>              
               </div>   
	  </div>
	  
	  <div class="jyl_memberlevel2_hr2div"><hr class="jyl_memberlevel2_hr2"></div>
	  
	  
	  
	  
	  <!-- ------------------ 등급별 혜택보기 ------------------ -->
	  <div class="jyl_memberlevel_more"> 
	  			<div id="jyl_memberlevel3">   
	                <span class="jyl_memberlevel3_title" id="benefits">등급별 혜택보기</span>              
	  			</div>
	  </div>
      <div class="jyl_memberlevel"> 
      
      
      		<% if(m_usertype ==0){ %>
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
                            	<div class="jyl_memberlevel_more2_2_1"><span>50번 이상 초대 & 평점 4.5 이상</span></div>
                            	<hr class="jyl_memberlevel_more2_2_hr">
                             	<div class="jyl_memberlevel_more2_2_2"><span>초대시 제 1 우선권 지급 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>게시판 작성시 - 타이틀 빨간색으로 설정</span></div>
                            </div>
            			</div>
            			
            			<hr class="jyl_memberlevel_more2_2_hr2">
            			
            			<div class="jyl_memberlevel_more2">
                    		<div class="jyl_memberlevel_more2_1">
                                <img class="jyl_memberlevel_more2_img" alt="list1" src="/DongGu/img/medal2.png">
                            </div>
                            <div class="jyl_memberlevel_more2_2">
                            	<div class="jyl_memberlevel_more2_2_1"><span>40번 이상 초대 & 평점 4.2 이상</span></div>
                            	<hr class="jyl_memberlevel_more2_2_hr">
                             	<div class="jyl_memberlevel_more2_2_2"><span>초대시 제 2 우선권 지급 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>게시판 작성시 - 타이틀 파란색으로 설정</span></div>
                            </div>
            			</div>
            			
            			<hr class="jyl_memberlevel_more2_2_hr2">
            			
            			<div class="jyl_memberlevel_more2">
                    		<div class="jyl_memberlevel_more2_1">
                                <img class="jyl_memberlevel_more2_img" alt="list1" src="/DongGu/img/medal3.png">
                            </div>
                            <div class="jyl_memberlevel_more2_2">
                            	<div class="jyl_memberlevel_more2_2_1"><span>30번 이상 초대 & 평점 3.9 이상</span></div>
                            	<hr class="jyl_memberlevel_more2_2_hr">
                             	<div class="jyl_memberlevel_more2_2_2"><span>초대시 제 3 우선권 지급 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>게시판 작성시 - 타이틀 초록색으로 설정</span></div>
                            </div>
            			</div>
            			
            			<hr class="jyl_memberlevel_more2_2_hr2">
            			
            			<div class="jyl_memberlevel_more2">
                    		<div class="jyl_memberlevel_more2_1">
                                <img class="jyl_memberlevel_more2_img" alt="list1" src="/DongGu/img/medal4.png">
                            </div>
                            <div class="jyl_memberlevel_more2_2">
                            	<div class="jyl_memberlevel_more2_2_1"><span>20번 이상 초대 & 평점 3.6 이상</span></div>
                            	<hr class="jyl_memberlevel_more2_2_hr">
                             	<div class="jyl_memberlevel_more2_2_2"><span>초대시 제 4 우선권 지급 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>게시판 작성시 - 타이틀 노란색으로 설정</span></div>
                            </div>
            			</div>
            			
            			<hr class="jyl_memberlevel_more2_2_hr2">
            			
            			<div class="jyl_memberlevel_more2">
                    		<div class="jyl_memberlevel_more2_1">
                                <img class="jyl_memberlevel_more2_img" alt="list1" src="/DongGu/img/medal5.png">
                            </div>
                            <div class="jyl_memberlevel_more2_2">
                            	<div class="jyl_memberlevel_more2_2_1"><span>10번 이상 초대 & 평점 3.3 이상</span></div>
                            	<hr class="jyl_memberlevel_more2_2_hr">
                             	<div class="jyl_memberlevel_more2_2_2"><span>초대시 제 5 우선권 지급 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>게시판 작성시 - 타이틀 회색으로 설정 </span></div>
                            </div>
            			</div>
            			
                    	     
               </div>
      		<% } else if(m_usertype ==1){ %>
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
                            	<div class="jyl_memberlevel_more2_2_1"><span>50번 이상 지원 & 평점 4.5 이상</span></div>
                            	<hr class="jyl_memberlevel_more2_2_hr">
                             	<div class="jyl_memberlevel_more2_2_2"><span>지원시 제 1 우선권 지급 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>초대장 1건 당 급여 - 50,000원으로 설정 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>게시판 작성시 - 타이틀 빨간색으로 설정</span></div>
                            </div>
            			</div>
            			
            			<hr class="jyl_memberlevel_more2_2_hr2">
            			
            			<div class="jyl_memberlevel_more2">
                    		<div class="jyl_memberlevel_more2_1">
                                <img class="jyl_memberlevel_more2_img" alt="list1" src="/DongGu/img/medal2.png">
                            </div>
                            <div class="jyl_memberlevel_more2_2">
                            	<div class="jyl_memberlevel_more2_2_1"><span>40번 이상 지원 & 평점 4.2 이상</span></div>
                            	<hr class="jyl_memberlevel_more2_2_hr">
                             	<div class="jyl_memberlevel_more2_2_2"><span>지원시 제 2 우선권 지급 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>초대장 1건 당 급여 - 45,000원으로 설정 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>게시판 작성시 - 타이틀 파란색으로 설정</span></div>
                            </div>
            			</div>
            			
            			<hr class="jyl_memberlevel_more2_2_hr2">
            			
            			<div class="jyl_memberlevel_more2">
                    		<div class="jyl_memberlevel_more2_1">
                                <img class="jyl_memberlevel_more2_img" alt="list1" src="/DongGu/img/medal3.png">
                            </div>
                            <div class="jyl_memberlevel_more2_2">
                            	<div class="jyl_memberlevel_more2_2_1"><span>30번 이상 지원 & 평점 3.9 이상</span></div>
                            	<hr class="jyl_memberlevel_more2_2_hr">
                             	<div class="jyl_memberlevel_more2_2_2"><span>지원시 제 3 우선권 지급 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>초대장 1건 당 급여 - 40,000원으로 설정 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>게시판 작성시 - 타이틀 초록색으로 설정</span></div>
                            </div>
            			</div>
            			
            			<hr class="jyl_memberlevel_more2_2_hr2">
            			
            			<div class="jyl_memberlevel_more2">
                    		<div class="jyl_memberlevel_more2_1">
                                <img class="jyl_memberlevel_more2_img" alt="list1" src="/DongGu/img/medal4.png">
                            </div>
                            <div class="jyl_memberlevel_more2_2">
                            	<div class="jyl_memberlevel_more2_2_1"><span>20번 이상 지원 & 평점 3.6 이상</span></div>
                            	<hr class="jyl_memberlevel_more2_2_hr">
                             	<div class="jyl_memberlevel_more2_2_2"><span>지원시 제 4 우선권 지급 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>초대장 1건 당 급여 - 35,000원으로 설정 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>게시판 작성시 - 타이틀 노란색으로 설정</span></div>
                            </div>
            			</div>
            			
            			<hr class="jyl_memberlevel_more2_2_hr2">
            			
            			<div class="jyl_memberlevel_more2">
                    		<div class="jyl_memberlevel_more2_1">
                                <img class="jyl_memberlevel_more2_img" alt="list1" src="/DongGu/img/medal5.png">
                            </div>
                            <div class="jyl_memberlevel_more2_2">
                            	<div class="jyl_memberlevel_more2_2_1"><span>10번 이상 지원 & 평점 3.3 이상</span></div>
                            	<hr class="jyl_memberlevel_more2_2_hr">
                             	<div class="jyl_memberlevel_more2_2_2"><span>지원시 제 5 우선권 지급 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>초대장 1건 당 급여 - 30,000원으로 설정 </span></div>
                             	<div class="jyl_memberlevel_more2_2_3"><span>게시판 작성시 - 타이틀 회색으로 설정</span></div>
                            </div>
            			</div>          			
                    	     
               </div>
               <%} %>
               
                  
	  </div>
	</div>
    <!------------- 오른쪽 컨텐츠 영역 끝 ----------->
</div>
</div>
</body>
<%@include file="../Footer.jsp" %>
</html>