<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.sql.Date" %>    
<%@ page import="com.DongGu.mypage.MyPageDAO" %>    
<%@ page import="com.DongGu.mypage.MyPageDTO" %>  

<%
   String m_sid = (String)session.getAttribute("sid");
   String m_sname = (String)session.getAttribute("sname");
   String m_snickname = (String)session.getAttribute("snickname");
%>

<jsp:useBean id="dao" class="com.DongGu.mypage.MyPageDAO"></jsp:useBean>

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
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
   .jyl_graph{display: flex; margin-left:10px;}
   .jyl_bar-background {background-color: #e1e1e1; height: 18px; border-radius: 15px; overflow: hidden; position: relative; margin-bottom: 10px; width: 90%;}   
   .jyl_bar-fill1 {background-color: #8290e3; height: 100%; transition: width 0.3s;}   
   .jyl_bar-fill2 {background-color: #8290e3; height: 100%; transition: width 0.3s;}
   .jyl_bar-fill3 {background-color: #fee37a; height: 100%; transition: width 0.3s;}
</style>
</head>
<body >
<%@ include file="Header.jsp" %>

<div id="jyl_body">
<div class="jyl_container">

     <!------------- 왼쪽 사이드 메뉴 영역 시작 ----------->
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
    <!------------- 왼쪽 사이드 메뉴 영역 끝----------->
    
    
    
    <!------------- 오른쪽 컨텐츠 영역 시작 ----------->  
    <div class="jyl_content">
    
    <!------------- section1 ----------->     
         <!------------- 나의 등급 영역 시작 ----------->  
       <div class="jyl_memberlevel"> 
           <ul id="jyl_memberlevel1">
                    <li class="jyl_memberlevellist"> 
                          <div class="image-container">
                                <img class="jyl_memberlevel_img" alt="list1" src="img/<%= dto1.getG_img() %>">
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
                    <div id="jyl_info_short1_month" ><%= m_sname %>님의 8월 현황</div>
                    
                    
                    <div id="jyl_info_short2">
                       <div id="jyl_info_short3"><img class="jyl_info_short3_img" alt="list1" src="img/yel29.png"></div>
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
                       <div id="jyl_info_short3"><img class="jyl_info_short3_img" alt="list1" src="img/yel30.png"></div>
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
                       <div id="jyl_info_short3"><img class="jyl_info_short3_img" alt="list1" src="img/yel6.png"></div>
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

    
       <!------------- 지원 내역(최신순 3가지만) 영역 시작 ----------->  
       <div class="jyl_content2">   
              <span class="jyl_content2_title">지원 내역</span>              
       </div>
         
        <div class="jyl_content2_list1">   
           <div class="jyl_content2_title_bottom">
              <div class="jyl_content2_list_title1">멍구</div>      
              <div class="jyl_content2_list_title2"><span class="jyl_content2_list_title2_1">매칭 대기</span></div> 
           </div>    
           <div class="jyl_content2_list_area">
              <div class="jyl_img_div">
                 <img class="jyl_img" alt="list1" src="/DongGu/img/yel1.jpg">
              </div>
              <div class="jyl_list1_info">
                   <div class="jyl_list1_info1">
                     <div class ="jyl_list1_info1_1"><span class ="jyl_list1_info1_title">잠실 석촌동 멍구!</span></div>
                     <div class ="jyl_list1_info1_2">
                           <div class="jyl_list1_info1_nature">활발함</div>
                           <div class="jyl_list1_info1_nature">애교많음</div>
                           <div class="jyl_list1_info1_nature">잘먹음</div>                    
                     </div>
                      <div class ="jyl_list1_info1_3"><span class ="jyl_list1_info1_date">2024-07-25</span></div>
                    </div>
                    <div class="jyl_list1_info2">
                       <div class="jyl_list1_info2_btn1"><a href="#">상세 내역</a></div>
                       <div class="jyl_list1_info2_btn2"><a href="#">지원 수정</a></div>
                       <div class="jyl_list1_info2_btn3"><a href="#">지원 취소</a></div>
                    </div>
             </div>    
          </div>
         </div>
         
         <div class="jyl_content2_list1">   
           <div class="jyl_content2_title_bottom">
              <div class="jyl_content2_list_title1">냥구</div>      
              <div class="jyl_content2_list_title2"><span class="jyl_content2_list_title2_2">매칭 성공</span></div> 
           </div>    
           <div class="jyl_content2_list_area">
              <div class="jyl_img_div">
                 <img class="jyl_img" alt="list1" src="/DongGu/img/yel3.jpg">
              </div>
              <div class="jyl_list1_info">
                   <div class="jyl_list1_info1">
                     <div class ="jyl_list1_info1_1"><span class ="jyl_list1_info1_title">아기고양이 하루 봐주실분~~</span></div>
                     <div class ="jyl_list1_info1_2">
                           <div class="jyl_list1_info1_nature">소심함</div>
                           <div class="jyl_list1_info1_nature">겁많음</div>                  
                     </div>
                      <div class ="jyl_list1_info1_3"><span class ="jyl_list1_info1_date">2024-06-11</span></div>
                    </div>
                    <div class="jyl_list1_info2">
                       <div class="jyl_list1_info2_btn1"><a href="#">상세 내역</a></div>
                       <div class="jyl_list1_info2_btn3"><a href="#">지원 취소</a></div>
                    </div>
             </div>    
          </div>
         </div>
         
         <div class="jyl_content2_list1">   
           <div class="jyl_content2_title_bottom">
              <div class="jyl_content2_list_title1">냥구</div>      
              <div class="jyl_content2_list_title2"><span class="jyl_content2_list_title2_3">후기작성 완료</span></div> 
           </div>    
           <div class="jyl_content2_list_area">
              <div class="jyl_img_div">
                 <img class="jyl_img" alt="list1" src="/DongGu/img/yel4.jpg">
              </div>
              <div class="jyl_list1_info">
                   <div class="jyl_list1_info1">
                     <div class ="jyl_list1_info1_1"><span class ="jyl_list1_info1_title">순한 푸들 4월 5일~8일까지 멍구 구해요!</span></div>
                     <div class ="jyl_list1_info1_2">
                           <div class="jyl_list1_info1_nature">활발함</div>
                           <div class="jyl_list1_info1_nature">애교많음</div>        
                           <div class="jyl_list1_info1_nature">분리불안있음</div>              
                     </div>
                      <div class ="jyl_list1_info1_3"><span class ="jyl_list1_info1_date">2024-03-31</span></div>
                    </div>
                    <div class="jyl_list1_info2">
                       <div class="jyl_list1_info2_btn1"><a href="#">상세 내역</a></div>
                       <div class="jyl_list1_info2_btn3"><a href="#">작성 후기</a></div>
                    </div>
             </div>    
          </div>
         </div>
         <!------------- 지원 내역(최신순 3가지만) 영역 끝 ----------->
      
      
      
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
<%@include file="Footer.jsp" %>
</html>