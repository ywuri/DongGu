<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.sql.Date" %>    
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.Period" %>
<%@ page import="com.DongGu.mypage.MyPageDAO" %>    
<%@ page import="com.DongGu.mypage.MyPageDTO" %>  
<%@ page import="java.util.*" %>
<%@ page import="com.DongGu.review.ReviewDTO" %>
<%@ page import="com.DongGu.review.ReviewDAO" %>

 <jsp:useBean id="dao" class="com.DongGu.mypage.MyPageDAO"></jsp:useBean>
<jsp:useBean id="rdao" class="com.DongGu.review.ReviewDAO"></jsp:useBean>
    
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
    
    
    //후기 리스트
    ArrayList<ReviewDTO> arrayReview = rdao.AfterListPerson(Integer.parseInt(request.getParameter("usertype")) , request.getParameter("o_id"));
 
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



<div class="jyl_content_mp">
    
      
   <div class="jyl_content5_list_mp" style="position: relative;">   
   		<img class="jyl_likeimg_heart" style="position: absolute; top: 25px;  right: 30px; width: 35px;  height: 35px;" alt="likelist1" src="/DongGu/img/yel13.png">
   		<div class="jyl_content5_list1">
   			<div class="jyl_content5_list1_div2_mp">
	   			<div class="jyl_content5_list1_div2_1"><img class="jyl_content5_list1_div2_1_img_mp" src="/DongGu/img/petsitter_profile/<%= dto.getP_img()%>"></div>
	   		</div>
	   		<div class="jyl_content5_list1_div1_mp">
	   			<div class="jyl_content5_list1_div1_1_mp"><span><%= m_sname %></span></div>
	   			<div class="jyl_content5_list1_div1_2_mp"><span><%= i_year %>년 (만 <%= man_age %>세)</span></div>
	   			<div class="jyl_content5_list1_div1_3_mp">
		   		<span class="jyl_like_info_star_mp">고용자 평점: <img class="jyl_likestar_img_mp" alt="likestar" src="/DongGu/img/m_sec1_3.png">
	            <span class="like_point_mp"><%= dto.getStarcount() %></span><span> (</span><%= dto.getReviewcount() %><span>)</span></span>
		   		</div>	
	   			<div class="jyl_content5_list1_div1_4_mp">
	   				<div class="jyl_content5_list1_div4_1_mp"><span id="phoneNumber"></span></div>
	   				<div class="jyl_content5_list1_div4_2_mp"><span id="address"></span></div>
	   			</div>
	   		</div>   		
	   		
   		</div>
   		<!-- rivew 시작 -->
<section class="rivew" style="background-color: #fffae5;">


	<div id='Tabid1' class="rivew_cont">
		<ul>
			<%
			if(arrayReview==null|| arrayReview.size()==0){
				%>
					<li>해당 회원의 리뷰가 없습니다.</li>
				<%
			}
			else{
				for(int i=0;i<arrayReview.size();i++){
				%>
				<li>
				<div class="box">
					<div style="background: url(<%=arrayReview.get(i).getR_img() %>) no-repeat top right; background-position: right -25px; background-size: cover;">
					</div>
					<div class="right_box">
						<div class="rb_title">
							<span class="best">Best</span>
							<span class="addr"><%=arrayReview.get(i).getR_write_id() %></span>
							<span class="date"><%=arrayReview.get(i).getR_date() %></span>
						</div>
						<img src="img/star.png" alt="별점">
						<p>
						<%=arrayReview.get(i).getR_content() %>
						</p>
					</div>
				</div>
			</li>
			<%
			}
		}
			%>
		</ul>
	</div>
	<!-- Tabid1 끝 -->
</section>
<!-- rivew 끝 -->		


<div class="jyl_paging">
		<div class="jyl_paging2" style="padding-top: 0px;">
			<div class="jyl_paging_btn"><a href="MyPage_ApplyList.jsp?cp="><span>1</span></a></div>						 					    		
	</div>				
</div>

<div style="display: flex; align-items: center; justify-content: center;padding: 30px; padding-bottom: 60px;">
<a href="/DongGu/afterForm/AfterWrite.jsp"><input type="button" value="후기작성" class="jyl_btn_md"></a>
 </div> 
 
</div>
</div>
  
	</div>
</div>
</body>
<%@include file="../Footer.jsp" %>
</html>