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
	// 페이징 처리를 위한 초반 세팅  
	// 1. 총 게시물 수 
	int totalCnt= dao.getTotal(m_sid);
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
            <a class="side_title toggle-menu" href="#"><span>나의 지원</span></a>                   
            <ul class="submenu1">
                <li class="jyl_submenu_check"><a href="/DongGu/mypage/MyPage_ApplyList.jsp"><span>지원 내역</span></a></li>
                <li id="submenu_last" class="jyl_submenu"><a href="/DongGu/mypage/MyPage_ApplyManage.jsp"><span>지원서 관리</span></a></li>
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
                <span class="jyl_content2_title">지원 내역</span>              
      </div>
      
     <%
	    ArrayList<MyPageDTO> arr = dao.mypage_applyList1(m_sid,cp,listSize); 
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
                        <div class="jyl_list1_info1_nature"><span><%= nature %></span></div>
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
	
	
	<!------------- 페이징 영역 시작 ----------->
	<div class="jyl_paging">
		<div class="jyl_paging2">
		
			<% 	
			if(userGroup !=0){
			%>
					<!-- 예를 들어 6페이지(userGroup = 1)에서 이전버튼을 누르면 (1-1)*5+5=5 페이지로 이동  -->
					<div class="jyl_paging_btn"><a href="MyPage_ApplyList.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>"><span>&lt;</span></a></div>
			<%	
			}
			%>
										
						<!-- 각 페이지 버튼 만들기 --> 
						<%
						for(int i=userGroup*pageSize+1; i<=userGroup*pageSize+pageSize; i++){
							// 현재 페이지와 i를 비교하여 일치하면 active 클래스를 추가
							String activeClass = (i == cp) ? "jyl_paging_btn_active" : "";
							%>
							<div class="jyl_paging_btn <%=activeClass%>"><a href="MyPage_ApplyList.jsp?cp=<%=i%>"><span><%=i %></span></a></div>
							
							<%
							if(i==totalPage){
								break;
							} 
							
						}
						%>
												
			<%
			if(userGroup !=(totalPage/pageSize-(totalPage%pageSize==0?1:0))){
			%>
					<!-- 예를 들어 10페이지(userGroup = 1)에서 다음버튼을 누르면 (1+1)*5+1=11 페이지로 이동  -->
					<div  class="jyl_paging_btn"><a href="MyPage_ApplyList.jsp?cp=<%=(userGroup+1)*pageSize+1%>"><span>&gt;</span></a></div>
			<%	
			}
			 %>             
		</div>
	</div>
	<!------------- 페이징 영역 끝 ----------->
	
    <!------------- 오른쪽 컨텐츠 영역 끝 ----------->
    	</div>
	</div>
</div>
</body>
<%@include file="../Footer.jsp" %>
</html>