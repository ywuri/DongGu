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
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
<script>
function goBack() {
    window.history.back();
}
</script>
</head>
<body>

<%@include file="../Header.jsp" %>

<div id="jyl_body">
<div class="jyl_container">

     <!------------- 왼쪽 사이드 메뉴 영역 시작 ----------->
     <div class="jyl_sidebar">
     <ul class="jyl_menu">
        <li><a class="side_title" href="/DongGu/mypage/MyPage.jsp"><span>My Home</span></a></li>
        <li class="jyl_menu1">
            <a class="side_title toggle-menu" href="#"><span>나의 지원</span></a>                   
            <ul class="submenu1">
                <li class="jyl_submenu"><a href="/DongGu/mypage/MyPage_ApplyList.jsp"><span>지원 내역</span></a></li>
                <li id="submenu_last" class="jyl_submenu_check"><a href="MyPage_ApplyManage.jsp"><span>지원서 관리</span></a></li>
             </ul>
        </li>  
       
        <li>
            <a class="side_title toggle-menu" href="#"><span>나의 활동</span></a>
            <ul class="submenu1">
                <li class="jyl_submenu"><a href="/DongGu/mypage/MyPage_Like.jsp"><span>관심 내역</span></a></li>
                <li class="jyl_submenu"><a href="/DongGu/mypage/MyPage_BoardList.jsp"><span>게시판 활동 내역</span></a></li>
                <li id="submenu_last" class="jyl_submenu"><a href="/DongGu/mypage/MyPage_ReviewList.jsp"><span>이용 후기 내역</span></a></li>
            </ul>
        </li>
        <li>
            <a class="side_title toggle-menu" href="#"><span>회원 정보</span></a>
            <ul class="submenu1">
                <li class="jyl_submenu"><a href="/DongGu/mypage/MyPage_InfoUpdate.jsp"><span>회원정보 수정</span></a></li>
                <li id="submenu_last" class="jyl_submenu"><a href="/DongGu/mypage/MyPage_MemberLevel.jsp"><span>나의 회원 등급</span></a></li>
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
                <span class="jyl_content2_title">지원서 수정</span>              
      </div>
      
   <div class="jyl_content5_list">   
   
   		<div class="jyl_content5_list1">
	   		<div class="jyl_content5_list1_div1">
	   			<div class="jyl_content5_list1_div1_1"><span>진예림</span></div>
	   			<div class="jyl_content5_list1_div1_2"><span>1998년 (만 25세)</span></div>
	   			<div class="jyl_content5_list1_div1_3">
	   				<div  class="jyl_content5_list1_div1_3_1"><span>가려진 정보 보기</span></div>
	   			</div>
	   			<div class="jyl_content5_list1_div1_4">
	   				<div class="jyl_content5_list1_div4_1"><span>010-****-1111</span></div>
	   				<div class="jyl_content5_list1_div4_2"><span>서울시 송파구 송파1동</span></div>
	   			</div>
	   		</div>   		
	   		<div class="jyl_content5_list1_div2">
	   			<div class="jyl_content5_list1_div2_1"><img class="jyl_content5_list1_div2_1_img" src="/DongGu/img/profile2.png"></div>
	   		</div>
   		</div>		
        <div class="jyl_content5_list2">   
                <div class="jyl_content5_list2_div1"><span class="jyl_content5_list2_title">반려 경험</span></div> 
                <div class="jyl_content5_list2_div2"><textarea></textarea></div>
        </div>
        <div class="jyl_content5_list2">   
                <div class="jyl_content5_list2_div1"><span class="jyl_content5_list2_title">동구 경험</span></div> 
                <div class="jyl_content5_list2_div2"><textarea></textarea></div>
        </div>
   		<div class="jyl_content5_list2">   
                <div class="jyl_content5_list2_div1"><span class="jyl_content5_list2_title">기타 경험</span></div> 
                <div class="jyl_content5_list2_div2"><textarea></textarea></div>
        </div> 
        <div class="jyl_content5_list3">   
               <input onclick="goBack();"type="button" value="뒤로가기" class="jyl_btn">
               <input type="submit" value="수정완료" class="jyl_btn">
        </div> 
        		
	</div>
				
</div>
    <!------------- 오른쪽 컨텐츠 영역 끝 ----------->
    
	</div>
</div>
</body>
<%@include file="../Footer.jsp" %>
</html>