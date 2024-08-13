<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.sql.Date" %>    
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.DongGu.mypage.MyPageDAO" %>    
<%@ page import="com.DongGu.mypage.MyPageDTO" %>  
<jsp:useBean id="dao" class="com.DongGu.mypage.MyPageDAO"></jsp:useBean>
    
<%
   String m_sid = (String)session.getAttribute("sid");
   String m_sname = (String)session.getAttribute("sname");
%>    

<%
   MyPageDTO dto = dao.mypage_ApplyManage1(m_sid); 
   int g_price = dto.getG_price();
   DecimalFormat decimalFormat = new DecimalFormat("#,###");
   String s_g_price = decimalFormat.format(g_price);
   
   MyPageDTO dto1 = dao.mypage_section1(m_sid); 
   int i_applycount = (int)dto1.getApplycount();
%>

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
        <li class="jyl_menu1">
            <a class="side_title toggle-menu" href="#"><span>나의 지원</span></a>                   
            <ul class="submenu1">
                <li class="jyl_submenu"><a href="/DongGu/mypage/MyPage_ApplyList.jsp"><span>지원 내역</span></a></li>
                <li id="submenu_last" class="jyl_submenu_check"><a href="/DongGu/mypage/MyPage_ApplyManage.jsp"><span>지원서 관리</span></a></li>
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
                <span class="jyl_content2_title">지원서 관리</span>              
      </div>
      
   <div class="jyl_content4_list">   
   
   		<div class="jyl_content4_list1">
	   		<div class="jyl_content4_list1_div1"><span class="jyl_content4_list1_span1"><%= m_sname %>님의 지원서</span></div>
	   		<div class="jyl_content4_list1_div2"><span class="jyl_content4_list1_span2"><%= dto.getP_update_date() %> 수정</span></div>
   		</div>
   		<div class="jyl_content4_list2">
	   		<div class="jyl_content4_list2_div1"><img class="jyl_content4_list2_img" src="/DongGu/img/applymanage1.png"></div>
	   		<div class="jyl_content4_list2_div2"><span class="jyl_content4_list2_span2"><%= dto.getG_name() %></span></div>
   		</div>
   		<div class="jyl_content4_list3">
	   		<div class="jyl_content4_list3_div1"><img class="jyl_content4_list3_img" src="/DongGu/img/applymanage2.png"></div>
	   		<div class="jyl_content4_list3_div2"><span class="jyl_content4_list3_span2">1건당 나의 측정 금액 : <%= s_g_price %> 원</span></div>
   		</div>
   		<div class="jyl_content4_list4">
	   		<div class="jyl_content4_list4_div1">
	   			<div class="jyl_content4_list4_div1_1">
	   				<div><a href="/DongGu/mypage/MyPage_ApplyManage_Look.jsp"><span>상세보기</span></a></div>
	   			</div>
	   			<div class="jyl_content4_list4_div1_1">
	   				<div><a href="/DongGu/mypage/MyPage_ApplyList.jsp"><span>지원 내역</span></a></div>
	   				<div class="jyl_overlay"><span><%= i_applycount %></span></div>
	   			</div>  			
	   		</div>
	   		<div class="jyl_content4_list4_div2">
	   		<div class="jyl_content4_list4_div2_btn"><a href="/DongGu/mypage/MyPage_ApplyManage_Update.jsp"><span>수정하기</span></a></div>
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