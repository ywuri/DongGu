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


<%
   MyPageDTO dto1 = dao.mypage_section1(m_sid); 

   if (dto1 == null) {
       out.println("dto1 null 값임");
       return;
   }
   double applyCount = dto1.getApplycount();
   double widthPercentage1 = (applyCount / 30) * 100;
   int int_applyCount = (int)dto1.getApplycount();
   double likeCount = dto1.getLikecount();
   double widthPercentage2 = (likeCount / 30) * 100;
   int int_likeCount = (int)dto1.getLikecount();
   double starCount = dto1.getStarcount();
   double widthPercentage3 = (starCount / 5) * 100;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Home</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
<style>
   .jyl_graph{display: flex; margin-left:10px;}
   .jyl_bar-background {background-color: #e1e1e1; height: 18px; border-radius: 15px; overflow: hidden; position: relative; width: 90%;}   
   .jyl_bar-fill1 {background-color: #8290e3; height: 100%; transition: width 0.3s;}   
   .jyl_bar-fill2 {background-color: #8290e3; height: 100%; transition: width 0.3s;}
   .jyl_bar-fill3 {background-color: #fee37a; height: 100%; transition: width 0.3s;}
</style>
</head>
<body >
<%@ include file="../Header.jsp" %>

<div id="jyl_body">
<div class="jyl_container">

     <!------------- 왼쪽 사이드 메뉴 영역 시작 ----------->
     <div class="jyl_sidebar">
     <ul class="jyl_menu">
        <li class="jyl_menu_check"><a class="side_title" href="/DongGu/mypage/MyPage.jsp"><span>My Home</span></a></li>
        <li>
            <a class="side_title toggle-menu" href="#"><span>나의 지원</span></a>                   
            <ul class="submenu">
                <li class="jyl_submenu"><a href="/DongGu/mypage/MyPage_ApplyList.jsp"><span>지원 내역</span></a></li>
                <li id="submenu_last" class="jyl_submenu"><a href="/DongGu/mypage/MyPage_ApplyManage.jsp"><span>지원서 관리</span></a></li>
             </ul>
        </li>  
       
        <li>
            <a class="side_title toggle-menu" href="#"><span>나의 활동</span></a>
            <ul class="submenu">
                <li class="jyl_submenu"><a href="/DongGu/mypage/MyPage_Like.jsp"><span>관심 내역</span></a></li>
                <li class="jyl_submenu"><a href="/DongGu/mypage/MyPage_BoardList.jsp"><span>게시판 활동 내역</span></a></li>
                <li id="submenu_last" class="jyl_submenu"><a href="/DongGu/mypage/MyPage_ReviewList.jsp"><span>이용 후기 내역</span></a></li>
            </ul>
        </li>
        <li>
            <a class="side_title toggle-menu" href="#"><span>회원 정보</span></a>
            <ul class="submenu">
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
	            e.preventDefault();// 기본 앵커 동작을 방지

	            var submenu = this.nextElementSibling;	          
	            
	            if (submenu.style.maxHeight) {
	                submenu.style.maxHeight = null;  // 서브메뉴 숨기기
	            } else {
	                submenu.style.maxHeight = submenu.scrollHeight + 'px'; // Show the submenu
	            }
	        });
	    });
	});
	</script>
	<!------------- 왼쪽 사이드 메뉴 영역 끝----------->
    
    
    
    
    
    <!------------- 오른쪽 컨텐츠 영역 시작 ----------->  
    <div class="jyl_content">
    
    <!------------- section1 ----------->     
         <!------------- 나의 등급 영역 시작 ----------->  
       <div class="jyl_memberlevel"> 
           <ul id="jyl_memberlevel1">
                    <li class="jyl_memberlevellist"> 
                          <div class="image-container">
                                <img class="jyl_memberlevel_img" alt="list1" src="/DongGu/img/<%= dto1.getG_img() %>">
                            </div>
                    </li>
                    <li class="jyl_memberlevellist">
                          <div class="jyl_memberleve_msg">
                          <span><%= m_sname %>님의 이번달 등급은</span>
                          </div>
                    </li>
                    <li class="jyl_memberlevellist">       
                            <div class="jyl_memberlevel_medal">
                            <span ><%= dto1.getG_name() %></span>
                            </div>              
                    </li>
              </ul>  
        </div>
        <!------------- 나의 등급 영역 끝 ----------> 
     
     
        <!------------- 당월 정보 요약 영역 시작 ----------->  
          <div class="jyl_info_short"> 
              <div id="jyl_info_short1">
               
                    <div id="jyl_info_short1_summary"><span id="jyl_info_short1_span"> summary</span></div>
                    <div id="jyl_info_short1_month"><span><%= m_sname %>님의 8월 현황</span></div>
                    
                    
                    <div id="jyl_info_short2">
                       <div id="jyl_info_short3"><img class="jyl_info_short3_img" alt="list1" src="/DongGu/img/m_sec1_1.png"></div>
                       <div id="jyl_info_short4">
                          <div id="jyl_info_short4_spandiv"><span id="jyl_info_short4_span">지원하기</span></div>
                          <div class="jyl_graph">
                             <div class="jyl_bar-background">
                              <div class="jyl_bar-fill1" style="width: <%= widthPercentage1 %>%;"></div>
                          </div>
                          <div class="jyl_label">
                              <span class="jyl_label1"><%= int_applyCount %></span><span class="jyl_label2"> / 30</span>
                          </div>
                      	</div>
                       </div>
                   </div>                   
                   
                   <div id="jyl_info_short2">
                       <div id="jyl_info_short3"><img class="jyl_info_short3_img" alt="list1" src="/DongGu/img/m_sec1_2.png"></div>
                       <div id="jyl_info_short4">
                          <div id="jyl_info_short4_spandiv"><span id="jyl_info_short4_span">관심 횟수</span></div>
                          <div class="jyl_graph">
                             <div class="jyl_bar-background">
                              <div class="jyl_bar-fill2" style="width: <%= widthPercentage2 %>%;"></div>
                          </div>
                          <div class="jyl_label">
                              <span class="jyl_label1"><%= int_likeCount %></span><span class="jyl_label2"> / 30</span>
                          </div>
                      </div>
                       </div>
                   </div>
                   
                   <div id="jyl_info_short2">
                       <div id="jyl_info_short3"><img class="jyl_info_short3_img" alt="list1" src="/DongGu/img/m_sec1_3.png"></div>
                       <div id="jyl_info_short4">
                          <div id="jyl_info_short4_spandiv"><span id="jyl_info_short4_span">나의 평점</span></div>
                          <div class="jyl_graph">
                             <div class="jyl_bar-background">
                              <div class="jyl_bar-fill3" style="width: <%= widthPercentage3 %>%;"></div>
                          </div>
                          <div class="jyl_label">
                              <span class="jyl_label3"><%= starCount %></span><span class="jyl_label2"> / 5</span>
                          </div>
                      </div>               
                       </div>
                   </div>
                                      
           </div>   
        </div>
        <!------------- 당월 정보 요약 영역 끝 ----------->  
   <!------------- section1 -----------> 

  
  
  
  <!------------- section2 ----------->     
       <!------------- 지원 내역(최신순 3가지만) 영역 시작 ----------->  
       <div class="jyl_content2">   
              <span class="jyl_content2_title">지원 내역</span>              
       </div>
       
       <%
	    ArrayList<MyPageDTO> arr = dao.mypage_section2(m_sid); 
	    if (arr == null || arr.isEmpty()) {
	    %>
	        <div class="jyl_content2_list2">   
	        	<div><span class="jyl_my_arrempty1">지원 내역이 없습니다.</span></div>
	        	<div><span class="jyl_my_arrempty2">얼른 지원해보세요!</span></div>
	        </div>
	    <%
	    } else {
	        for (int i = 0; i < arr.size(); i++) {
	            MyPageDTO dto2 = arr.get(i);
		%> 
	         
    <div class="jyl_content2_list1">   
        <div class="jyl_content2_title_bottom">
     	<%
     	int a_num = dto2.getA_num();
     	if( a_num == 1 ){
     	%>   
            <div class="jyl_content2_list_title1"><span>멍구</span></div>     
        <%
     	}else if ( a_num == 2){
        %>    
         	<div class="jyl_content2_list_title1"><span>냥구</span></div> 
        <% 
     	}else{
        %>
        	<div class="jyl_content2_list_title1"><span>칭구</span></div> 
        <%
     	}
        %>
            <div class="jyl_content2_list_title2">
	            <%
	            	String m_name = dto2.getM_name();
	            	if( m_name.equals("매칭 대기")){
	            %>
                <span class="jyl_content2_list_title2_1"><%= dto2.getM_name() %></span>
                <%
                } else if(m_name.equals("매칭 중")){
                %>
                 <span class="jyl_content2_list_title2_2"><%= dto2.getM_name() %></span>
                <%
                } else if(m_name.equals("매칭 성공")){
                %>
                 <span class="jyl_content2_list_title2_3"><%= dto2.getM_name() %></span>
                <%
                } else if(m_name.equals("케어 완료")){
                %>
                 <span class="jyl_content2_list_title2_4"><%= dto2.getM_name() %></span>
                <%
                } else if(m_name.equals("후기작성 완료")){
                %>
                <span class="jyl_content2_list_title2_5"><%= dto2.getM_name() %></span>
                <%
                }
                %>
            </div> 
        </div>    
        <div class="jyl_content2_list_area">
            <div class="jyl_img_div">
                <img class="jyl_img" alt="list1" src="/DongGu/img/<%= dto2.getAi_img() %>">
            </div>
            <div class="jyl_list1_info">
                <div class="jyl_list1_info1">
                    <div class="jyl_list1_info1_1">
                        <span class="jyl_list1_info1_title"><%= dto2.getI_title() %></span>
                    </div>
                    <div class="jyl_list1_info1_2">
                         <%
                         	ArrayList<String> naturesList = dto2.getAn_words(); 
                            for (String nature : naturesList) { 
                        %>
                        <div class="jyl_list1_info1_nature"><span><%= nature %></span></div>
                        <% 
                        } 
                        %> 
                    </div>
                    <div class="jyl_list1_info1_3">
                    <%
                    Date i_start = dto2.getI_start();
                    Date i_end = dto2.getI_end();
               
                    if (i_start != null && i_end != null && i_start.equals(i_end)) {
                    %>                
                        <span class="jyl_list1_info1_date"><%= i_start %></span>
                    <% 
                    } else {
                    %> 
                        <span class="jyl_list1_info1_date"><%= i_start %> ~ <%= i_end %></span>
                    <%
                    }
                    %>
                    </div>
                </div>
                <div class="jyl_list1_info2">
	                <div class="jyl_list1_info2_btn1"><a href="#"><span>상세 내역</span></a></div> 
	                <%
	                	if( m_name.equals("매칭 대기")){
	                 %>  	                                    	
	                    <div class="jyl_list1_info2_btn2"><a href="#"><span>지원 수정</span></a></div>
	                    <div class="jyl_list1_info2_btn3"><a href="#"><span>지원 취소</span></a></div>
	                 <%
	                	} else if(m_name.equals("매칭 중")){
	                 %>  
	                  <div class="jyl_list1_info2_btn2"><a href="#"><span>매칭 수락</span></a></div>
                      <div class="jyl_list1_info2_btn3"><a href="#"><span>매칭 거절</span></a></div>
	                  <%
	                	} else if(m_name.equals("매칭 성공")){
	                  %>
	                    <div class="jyl_list1_info2_btn2"><a href="#"><span>매칭 포기</span></a></div>
	                  <%
		                } else if(m_name.equals("케어 완료")){
		              %>
		                <div class="jyl_list1_info2_btn2"><a href="#"><span>후기 작성</span></a></div>
		                <%
		                } else if(m_name.equals("후기작성 완료")){
		                %>
		                <div class="jyl_list1_info2_btn2"><a href="#"><span>후기 보기</span></a></div>
	                    <div class="jyl_list1_info2_btn3"><a href="#"><span>내 지원서</span></a></div>
		                 <%
		                }
		                %>           
                </div>
            </div>    
        </div>
    </div>
    <% 
        } 
    }
	%>
         <!------------- 지원 내역(최신순 3가지만) 영역 끝 ----------->
  <!------------- section2 ----------->          
      
      
      
      
           <!------------- 나의 활동 영역 시작 ----------->
         <div class="jyl_content3">   
                   <span class="jyl_content3_title">나의 활동</span>              
         </div>
         

         <div class="jyl_content3_list">    
              
            <div class="jyl_content3_list1"> 
               <div class="jyl_content3_list1_1">
                  <img class="jyl_animal" src="/DongGu/img/yel31.png">
               </div>
               <div class="jyl_content3_list1_2">
                  <span> 좋아한 </span>
               </div>
               <div class="jyl_content3_list1_3">
                 <a href="#"><img class="jyl_img2" alt="button" src="/DongGu/img/yel5.jpg"></a>
              </div>
         </div>
         
         <div class="jyl_content3_list2"> 
               <div class="jyl_content3_list1_1">
                  <img class="jyl_animal" src="/DongGu/img/yel32.png">
               </div>
               <div class="jyl_content3_list1_2">
                  <span> 게시판 활동 내역 </span>
               </div>
               <div class="jyl_content3_list1_3">
                 <a href="#"><img class="jyl_img2" alt="button" src="/DongGu/img/yel5.jpg"></a>
              </div>
         </div>
         
         <div class="jyl_content3_list3"> 
               <div class="jyl_content3_list1_1">
                  <img class="jyl_animal" src="/DongGu/img/yel33.png">
               </div>
               <div class="jyl_content3_list1_2">
                  <span> 이용 후기 내역</span>
               </div>
               <div class="jyl_content3_list1_3">
                 <a href="#"><img class="jyl_img2" alt="button" src="/DongGu/img/yel5.jpg"></a>
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