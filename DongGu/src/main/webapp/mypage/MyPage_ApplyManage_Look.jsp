<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.sql.Date" %>    
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.Period" %>
<%@ page import="com.DongGu.mypage.MyPageDAO" %>    
<%@ page import="com.DongGu.mypage.MyPageDTO" %>  
 <jsp:useBean id="dao" class="com.DongGu.mypage.MyPageDAO"></jsp:useBean>
    
<%
   String m_sid = (String)session.getAttribute("sid");
   String m_sname = (String)session.getAttribute("sname");
%>    
<%
   	MyPageDTO dto = dao.mypage_ApplyManage2(m_sid); 
	String p_jumin = dto.getP_jumin();
	
	// 주민번호를 '-'로 분리하여 배열로 반환
	String jumin_first = p_jumin.split("-")[0]; // 980821
	String s_year = jumin_first.substring(0, 2); // 98 (문자열)
	int i_year = Integer.parseInt(s_year); // 98 (정수)
	String md = jumin_first.substring(2); // 0821
	
	// 성별 코드에 따라 연도 결정
	String gender =  p_jumin.split("-")[1].substring(0, 1); // 2123456 -> 2
	
	if (gender.equals("1") || gender.equals("2")) { // 1, 2 면 1900년대 생
	    i_year += 1900; // 1998
	} else { // 3,4 면 2000년대생 
	    i_year += 2000;
	}
	
	// 월과 일 부분 추출
	int month = Integer.parseInt(md.substring(0, 2)); // 08
	int day = Integer.parseInt(md.substring(2)); // 21
	
	// 조정된 년도로 LocalDate 객체 생성 : 1998-08-21
	LocalDate birth = LocalDate.of(i_year, month, day);
	LocalDate today = LocalDate.now(); // 현재 날짜 
	
	// 만나이 계산
	int man_age = Period.between(birth, today).getYears();
	
	// 결과 확인용
	System.out.println("생년월일 : " + birth);
	System.out.println("만나이 : " + man_age);
%>
<%
	//원본 전화번호
    String phoneNum = dto.getP_tel();     
    // 전화번호를 '-'로 분리
    String[] parts = phoneNum.split("-");
    String maskedPhoneNum = parts[0] + "-****-" + parts[2]; 
    
    
 	// 원본 주소
    String addr = dto.getP_addr();    
	// 주소를 공백으로 분리
    String[] parts2 = addr.split(" ");    
   
    // 첫 두 부분
    String firstPart = parts2[0];
    String secondPart = parts2[1];
        
    // 세 번째 부분을 마스킹
    String thirdPart = parts2[2];
    StringBuilder maskedThirdPart = new StringBuilder();
    maskedThirdPart.append("*"); // 첫 번째 문자는 원본 유지
        for (int i = 1; i < thirdPart.length(); i++) {
            maskedThirdPart.append("*");
        }
        
    // 결합된 주소
    String MaskedAddr = firstPart + " " + secondPart + " " + maskedThirdPart.toString();
        
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
</head>
<script>
 	   var check = 0; 	
 	   
       function appear() {
    	   // 동작 확인용
           // alert("클릭됨");
           
           // check 값을 토글 (0 -> 1, 1 -> 0)
           // 0은 가리기, 1은 보여주기
           check = (check == 0) ? 1 : 0;
           
           // 현재 check 값 로그로 출력(확인용)
           console.log("현재 check 값:", check);

           // 전화번호 표시 업데이트 함수 호출
           updatePhoneNumber();
           updateAddress();
       	}
       
       
       // 전화번호 표시 업데이트 함수
       function updatePhoneNumber() {
           // 아이디가 phoneNumber인 span 요소를 가져옴 
           var phoneSpan = document.getElementById('phoneNumber');
           if (check === 0) { 
               phoneSpan.textContent = "<%= maskedPhoneNum %>"; // 마스킹된 번호 표시
           } else {
               phoneSpan.textContent = "<%= phoneNum %>"; // 원본 번호 표시
           }
       }
       
   	   // 주소 표시 업데이트 함수
       function updateAddress() {
           // 아이디가 address인 span 요소를 가져옴 
           var addrSpan = document.getElementById('address');
           if (check === 0) { 
        	   addrSpan.textContent = "<%= MaskedAddr %>"; // 마스킹된 주소 표시
           } else {
        	   addrSpan.textContent = "<%= addr %>"; // 원본 주소 표시
           }
       }
       
	   // 페이지가 로드된 후, updatePhoneNumber() 함수가 호출되어 초기 전화번호를 설정
	   // 페이지가 로드된 후, updateAddress() 함수가 호출되어 초기 주소를 설정
       document.addEventListener('DOMContentLoaded', function () {
           // 페이지 로드 시 전화번호 표시 업데이트
           updatePhoneNumber();
           // 페이지 로드 시 주소 표시 업데이트
           updateAddress();
       });
</script>
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
                <li id="submenu_last" class="jyl_submenu"><a href="/DongGu/mypage/MyPage_Like.jsp"><span>관심 내역</span></a></li>              
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
                <span class="jyl_content2_title">지원서 보기</span>              
      </div>
      
   <div class="jyl_content5_list">   
   
   		<div class="jyl_content5_list1">
	   		<div class="jyl_content5_list1_div1">
	   			<div class="jyl_content5_list1_div1_1"><span><%= m_sname %></span></div>
	   			<div class="jyl_content5_list1_div1_2"><span><%= i_year %>년 (만 <%= man_age %>세)</span></div>
	   			<div class="jyl_content5_list1_div1_3">
	   				<div  class="jyl_content5_list1_div1_3_1"><a onclick="appear();"><span>가려진 정보 보기</span></a></div>
	   			</div>
	   			<div class="jyl_content5_list1_div1_4">
	   				<div class="jyl_content5_list1_div4_1"><span id="phoneNumber"></span></div>
	   				<div class="jyl_content5_list1_div4_2"><span id="address"></span></div>
	   			</div>
	   		</div>   		
	   		<div class="jyl_content5_list1_div2">
	   			<div class="jyl_content5_list1_div2_1"><img class="jyl_content5_list1_div2_1_img" src="/DongGu/img/petsitter_profile/<%= dto.getP_img()%>"></div>
	   		</div>
   		</div>		
   		<form action="/DongGu/mypage/MyPage_ApplyManage_Update_ok.jsp" method="get">
        <div class="jyl_content5_list2">   
                <div class="jyl_content5_list2_div1"><span class="jyl_content5_list2_title">반려 경험</span></div> 
                <div class="jyl_content5_list2_div2"><textarea id="jyl_m_applylook" readonly="readonly" name="ta_p_ex_my"><%= dto.getP_ex_my()%></textarea></div>
        </div>
        <div class="jyl_content5_list2">   
                <div class="jyl_content5_list2_div1"><span class="jyl_content5_list2_title">동구 경험</span></div> 
                <div class="jyl_content5_list2_div2"><textarea id="jyl_m_applylook" readonly="readonly" name="ta_p_ex_other"><%= dto.getP_ex_other()%></textarea></div>
        </div>
   		<div class="jyl_content5_list2">   
                <div class="jyl_content5_list2_div1"><span class="jyl_content5_list2_title">기타 경험</span></div> 
                <div class="jyl_content5_list2_div2"><textarea id="jyl_m_applylook" readonly="readonly" name="ta_p_ex_etc"><%= dto.getP_ex_etc() %></textarea></div>
        </div> 
        <div class="jyl_content5_list3">   
               <a href="MyPage_ApplyManage.jsp"><input type="button" value="뒤로가기" class="jyl_btn" ></a>
               <a href="MyPage_ApplyManage_Update.jsp"><input type="button" value="수정하기" class="jyl_btn"></a>
        </div> 
       </form>	    		
	</div>
				
</div>
    <!------------- 오른쪽 컨텐츠 영역 끝 ----------->
    
	</div>
</div>
</body>
<%@include file="../Footer.jsp" %>
</html>