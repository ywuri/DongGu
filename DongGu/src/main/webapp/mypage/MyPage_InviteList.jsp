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
   Integer m_usertype = (Integer)session.getAttribute("usertype");   
   String s_i_num = request.getParameter("i_num");
   int i_num = Integer.parseInt(s_i_num);
   String s_btn = request.getParameter("btn");
   int btn = Integer.parseInt(s_btn);
   String s_type = request.getParameter("type");
   int type = Integer.parseInt(s_type);
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
            <a class="side_title toggle-menu" href="#"><span>나의 초대</span></a>                   
            <ul class="submenu1">
                <li class="jyl_submenu"><a href="/DongGu/mypage/MyPage_ApplyList.jsp"><span>초대 내역</span></a></li>
                <li id="submenu_last" class="jyl_submenu_check"><a href="/DongGu/mypage/MyPage_InviteManage.jsp"><span>초대 현황 관리</span></a></li>
             </ul>
        </li>  
       
        <li>
            <a class="side_title toggle-menu" href="#"><span>나의 활동</span></a>
            <ul class="submenu1">
                <li  id="submenu_last" class="jyl_submenu"><a href="/DongGu/mypage/MyPage_Like.jsp"><span>관심 내역</span></a></li>
			</ul>
        </li>
        <li>
            <a class="side_title toggle-menu" href="#"><span>회원 정보</span></a>
            <ul class="submenu1">
                <li class="jyl_submenu"><a href="/DongGu/mypage/MyPage_InfoUpdate.jsp"><span>회원정보 수정</span></a></li>
                <li id="submenu_last" class="jyl_submenu"><a href="/DongGu/mypage/MyPage_MemberLevel.jsp"><span>나의 회원 등급</span></a></li>
            </ul>
        </li>
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
                <span class="jyl_content2_title">지원 내역</span>              
      </div>
      	<%
      	String i_title = dao.mypage_InviteList_i_title(i_num) ;
      	%>
      	<div style="border: 1px solid #fdc009; padding: 20px; border-radius:15px; background: white;"> 
        <div style="padding:10px; margin-top:10px; margin-bottom:20px; margin-left:20px; margin-right:20px; font-family:'Pretendard'; font-size: 19px; color:#77766f; font-weight: bold;"><span style="color:#fdc009;">' <%= i_title %> '  </span>초대장에 대한 지원 현황</div>
      <%
  		ArrayList<MyPageDTO> arr = dao.mypage_InviteList(i_num);  
	    if (arr == null || arr.isEmpty()) {
	    %>    	
	        <div class="jyl_content2_list2">   
	        	<div><span class="jyl_my_arrempty1">나의 초대장에 지원한 동구가 없습니다.</span></div>
	        	<div><span class="jyl_my_arrempty2">조금만 더 기다려보세요!</span></div>
	        </div>	        
	    <%
	    } else {
	        for (int i = 0; i < arr.size(); i++) {
	            MyPageDTO dto = arr.get(i);
	            int g_price = dto.getG_price();
	            DecimalFormat decimalFormat = new DecimalFormat("#,###");
	            String s_g_price = decimalFormat.format(g_price);
		%> 
     
   <div class="jyl_content4_list_invite">   
   	<div class="jyl_content4_list_invite80">
   		<div class="jyl_content4_list1">
   			<% if (btn==1) {%> 
	   		<div class="jyl_content4_list1_div1"><span class="jyl_content4_list1_span1" style="font-size: 19px;"><%= dto.getP_name() %>님의 지원서</span></div>
   			<% } else if (btn==0) {%>
   			<div class="jyl_content4_list1_div1"><a class="jyl_content4_list1_div1_btn0" href="/DongGu/mypage/MyPage_ApplyLook.jsp?p_id=<%= dto.getP_id() %>&i_num=<%= i_num %>&btn=<%= btn %>&type=2"><span style=" font-weight:bold; font-size: 19px;"><%= dto.getP_name() %>님의 지원서</span></a></div>
   			<% }%>
   		</div>
   		<div class="jyl_content4_list2">
	   		<div class="jyl_content4_list2_div1"><img class="jyl_content4_list2_img" src="/DongGu/img/applymanage1.png"></div>
	   		<div class="jyl_content4_list2_div2"><span class="jyl_content4_list2_span2"><%= dto.getG_name() %></span></div>
   		</div>
   		<div class="jyl_content4_list3">
	   		<div class="jyl_content4_list3_div1"><img class="jyl_content4_list3_img" src="/DongGu/img/applymanage2.png"></div>
	   		<div class="jyl_content4_list3_div2"><span class="jyl_content4_list3_span2">1건당 측정 금액 : <%= s_g_price %> 원</span></div>
   		</div>
   	</div>	
   	
   	<% if (btn==1) {%>    	
   	<div class="jyl_content4_list_invite20">
   		<div class="jyl_content4_list4">	   	
	   		<div class="jyl_content4_list4_div2_invite">
	   		<div class="jyl_content4_list4_div2_btn_invite"><a href="/DongGu/mypage/MyPage_ApplyLook.jsp?p_id=<%= dto.getP_id() %>&i_num=<%= i_num %>&btn=<%= btn %>&type=2"><span>상세보기</span></a></div>
	   		<form id="form_<%= i %>" action="/DongGu/mypage/MyPage_ok.jsp" method="post"> 
	   		<input type="hidden" name="i_num" value="<%= dto.getI_num() %>">
	        <input type="hidden" name="ap_num" value="<%= dto.getAp_num() %>">                	   		
	   		<div class="jyl_content4_list4_div2_btn_invite"><a href="#" onclick="submitForm(<%= i %>,4)"><span>선택하기</span></a></div>
	   		</form>
	   		 <script>
	                    function submitForm(index, actionValue) {
							console.log(index, actionValue);                 	
	                        const form = document.getElementById('form_' + index);
					
	                        // Clear any existing hidden inputs
	                        const existingInput = form.querySelector('input[name="action"]');
	                        if (existingInput) {
	                          existingInput.remove();
	                        }

	                        const input = document.createElement('input');
	                        input.type = 'hidden';
	                        input.name = 'action';
	                        input.value = actionValue;  // Set the action value (1 or 2)
	                        form.appendChild(input);
	                        
	                        form.submit();
	                      }
				</script>        
	   		</div>
   		</div>
   	</div>
   	<% }%> 
   </div>
 	<%
     	}
	  }
      %>
      <div class="jyl_content5_list3">
      <% if( type == 0) {%> 
      	<a href="/DongGu/mypage/MyPage.jsp"><input type="button" value="뒤로가기" class="jyl_btn"></a>                  
      <% }else if( type == 1) {%>              		
        <a href="/DongGu/mypage/MyPage_InviteManage.jsp"><input type="button" value="뒤로가기" class="jyl_btn"></a>  
      <% }else if( type == 3) {%>          
      <a href="/DongGu/mypage/MyPage_ApplyList.jsp"><input type="button" value="뒤로가기" class="jyl_btn"></a>        
      <% }%>     
   </div>   
 </div>	         
</div>
    <!------------- 오른쪽 컨텐츠 영역 끝 ----------->
    
	</div>
</div>
</body>
<%@include file="../Footer.jsp" %>
</html>