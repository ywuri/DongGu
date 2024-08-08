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
   // 페이징을 위한 처리 
   
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

      <!------------- 왼쪽 사이드 메뉴 영역 ----------->
     <div class="jyl_sidebar">
      <ul class="jyl_menu">
        <li><a class="side_title" href="/DongGu/mypage/MyPage.jsp">My Home</a></li>
        <li><a class="side_title" href="/DongGu/mypage/MyPage_ApplyList.jsp">나의 이력</a></li>
        <li><a href="/DongGu/mypage/MyPage_ApplyList.jsp">지원 내역</a></li>
        <li><a href="#">지원서 관리</a></li>     
        <li><a class="side_title" href="/DongGu/mypage/MyPage_Like.jsp">나의 활동</a></li>
        <li><a href="/DongGu/mypage/MyPage_Like.jsp">관심 내역</a></li>
        <li><a href="/DongGu/mypage/MyPage_BoardList.jsp">게시판 활동 내역</a></li>
        <li><a href="/DongGu/mypage/MyPage_ReviewList.jsp">이용 후기 내역</a></li>
        <li><a class="side_title" href="/DongGu/mypage/MyPage_InfoUpdate.jsp">회원 정보</a></li>
        <li><a href="/DongGu/mypage/MyPage_InfoUpdate.jsp">회원정보 수정</a></li>
        <li><a href="/DongGu/mypage/MyPage_MemberLevel.jsp">나의회원 등급</a></li>
        <li><a class="side_title" href="#">1:1 문의</a></li>
      </ul>
     </div>
     <!------------- 왼쪽 사이드 메뉴 영역 끝----------->
    
    
    
    
     <!------------- 오른쪽 컨텐츠 영역 시작 ----------->     
     <div class="jyl_content">
    
      <div class="jyl_content1">   
                <span class="jyl_content2_title">지원 내역</span>              
      </div>
      
     <%
	    ArrayList<MyPageDTO> arr = dao.mypage_applyList1(m_sid); 
	    if (arr == null || arr.isEmpty()) {
	    %>
	        <div class="jyl_content2_list2">   
	        	<div><span class="jyl_my_arrempty1">지원 내역이 없습니다.</span></div>
	        	<div><span class="jyl_my_arrempty2">얼른 지원해보세요!</span></div>
	        </div>
	    <%
	    } else {
	        for (int i = 0; i < arr.size(); i++) {
	            MyPageDTO dto = arr.get(i);
		%> 
	         
    <div class="jyl_content2_list">   
        <div class="jyl_content2_title_bottom">
     	<%
     	int a_num = dto.getA_num();
     	if( a_num == 1 ){
     	%>   
            <div class="jyl_content2_list_title1">멍구</div>     
        <%
     	}else if ( a_num == 2){
        %>    
         	<div class="jyl_content2_list_title1">냥구</div> 
        <% 
     	}else{
        %>
        	<div class="jyl_content2_list_title1">칭구</div> 
        <%
     	}
        %>
            <div class="jyl_content2_list_title2">
	            <%
	            	String m_name = dto.getM_name();
	            	if( m_name.equals("매칭 대기")){
	            %>
                <span class="jyl_content2_list_title2_1"><%= dto.getM_name() %></span>
                <%
                } else if(m_name.equals("매칭 중")){
                %>
                 <span class="jyl_content2_list_title2_2"><%= dto.getM_name() %></span>
                <%
                } else if(m_name.equals("매칭 성공")){
                %>
                 <span class="jyl_content2_list_title2_3"><%= dto.getM_name() %></span>
                <%
                } else if(m_name.equals("케어 완료")){
                %>
                 <span class="jyl_content2_list_title2_4"><%= dto.getM_name() %></span>
                <%
                } else if(m_name.equals("후기작성 완료")){
                %>
                <span class="jyl_content2_list_title2_5"><%= dto.getM_name() %></span>
                <%
                }
                %>
            </div> 
        </div>    
        <div class="jyl_content2_list_area">
            <div class="jyl_img_div">
                <img class="jyl_img" alt="list1" src="/DongGu/img/<%= dto.getAi_img() %>">
            </div>
            <div class="jyl_list1_info">
                <div class="jyl_list1_info1">
                    <div class="jyl_list1_info1_1">
                        <span class="jyl_list1_info1_title"><%= dto.getI_title() %></span>
                    </div>
                    <div class="jyl_list1_info1_2">
                         <%
                         	ArrayList<String> naturesList = dto.getAn_words(); 
                            for (String nature : naturesList) { 
                        %>
                        <div class="jyl_list1_info1_nature"><%= nature %></div>
                        <% 
                        } 
                        %> 
                    </div>
                    <div class="jyl_list1_info1_3">
                    <%
                    Date i_start = dto.getI_start();
                    Date i_end = dto.getI_end();
               
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
	                <div class="jyl_list1_info2_btn1"><a href="#">상세 내역</a></div> 
	                <%
	                	if( m_name.equals("매칭 대기")){
	                 %>  	                                    	
	                    <div class="jyl_list1_info2_btn2"><a href="#">지원 수정</a></div>
	                    <div class="jyl_list1_info2_btn3"><a href="#">지원 취소</a></div>
	                 <%
	                	} else if(m_name.equals("매칭 중")){
	                 %>  
	                  <div class="jyl_list1_info2_btn2"><a href="#">매칭 수락</a></div>
                      <div class="jyl_list1_info2_btn3"><a href="#">매칭 거절</a></div>
	                  <%
	                	} else if(m_name.equals("매칭 성공")){
	                  %>
	                    <div class="jyl_list1_info2_btn2"><a href="#">매칭 포기</a></div>
	                  <%
		                } else if(m_name.equals("케어 완료")){
		              %>
		                <div class="jyl_list1_info2_btn2"><a href="#">후기 작성</a></div>
		                <%
		                } else if(m_name.equals("후기작성 완료")){
		                %>
		                <div class="jyl_list1_info2_btn2"><a href="#">후기 보기</a></div>
	                    <div class="jyl_list1_info2_btn3"><a href="#">내 지원서</a></div>
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
    <!------------- 오른쪽 컨텐츠 영역 끝 ----------->
    	</div>
	</div>
</div>
</body>
<%@include file="../Footer.jsp" %>
</html>