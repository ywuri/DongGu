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
%>
<%
	// 페이징 처리를 위한 초반 세팅  
	// 1. 총 게시물 수 
	int totalCnt= dao.getTotal(m_sid, m_usertype);
	// 2. 보여줄 리스트 수
	int listSize = 5;
	// 3. 페이지 수 
	int pageSize = 5;
	// 4. 사용자의 현재 위치
	String cp_s = request.getParameter("cp");
	if(cp_s==null||cp_s.equals("")){
		cp_s ="1";
	}
	int cp = Integer.parseInt(cp_s);
	
	// 5. 총 페이지 
	int totalPage = (totalCnt/listSize)+1;
	if(totalCnt%listSize==0) totalPage--;
	
	// 6.사용자 현재 위치 그룹 번호
	int userGroup = cp/pageSize;
	if(cp%pageSize==0) userGroup--;
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
                <span class="jyl_content2_title">초대 현황 관리</span>              
      </div>
      
     <% 
		Set<Integer> displayedINums = new HashSet<>();
	 %>
      
     <%
	    ArrayList<MyPageDTO> arr = dao.mypage_applyList1(m_sid,cp,listSize, m_usertype); 
	    if (arr == null || arr.isEmpty()) {	    	
	 %>
	  <div class="jyl_content2_list2_list">   
	        	<div><span class="jyl_my_arrempty1">초대 내역이 없습니다.</span></div>
	        	<div><span class="jyl_my_arrempty2">얼른 초대해보세요!</span></div>
	 </div>
	 <%
	 } else {
	        for (int i = 0; i < arr.size(); i++) {
	            MyPageDTO dto = arr.get(i);
	            
	            int i_num = dto.getI_num();
	            
	         	// 중복된 i_num 체크
	            if (displayedINums.contains(i_num)) {
	                continue; // 이미 출력된 i_num이면 건너뛴다
	            }

	            displayedINums.add(i_num); // 새로 출력할 i_num 추가
		%> 
      
      <div class="jyl_content4_list_im">   
   		<div class="jyl_content3_list1_3_im1">
   				<span class="jyl_list1_info1_title" style="color:#444"><%= dto.getI_title() %></span>	
   	    </div>
   		<div class="jyl_content3_list1_3_im2">
                 <a href="/DongGu/mypage/MyPage_InviteList.jsp?i_num=<%=dto.getI_num() %>&btn=0&type=1"><img class="jyl_img2" alt="button" src="/DongGu/img/arrow2.png"></a>
        </div>	
     </div>
	<%
	     }
	 }
	 %>

	</div>
    <!------------- 오른쪽 컨텐츠 영역 끝 ----------->
    
	</div>
</div>
</body>
<%@include file="../Footer.jsp" %>
</html>