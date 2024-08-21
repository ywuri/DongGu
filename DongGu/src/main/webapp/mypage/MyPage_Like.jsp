<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.util.*" %>    
<%@ page import="java.sql.Date" %>    
<%@ page import="com.DongGu.mypage.MyPageDAO" %>    
<%@ page import="com.DongGu.mypage.MyPageDTO" %>  
 <jsp:useBean id="dao" class="com.DongGu.mypage.MyPageDAO"></jsp:useBean>
    
<%
   String m_sid = (String)session.getAttribute("sid");
   String m_sname = (String)session.getAttribute("sname");
   Integer m_usertype = (Integer)session.getAttribute("usertype");   
%>    



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
<script>
        function likeClick(value) { 
            // 폼의 hidden 필드에 클릭된 값을 설정
            document.getElementById('likevalue').value = value;
            // 폼 제출
            document.getElementById('valueForm').submit();            
            // value 값 확인용
            alert(document.getElementById('likevalue').value);
        }      
</script>
<script>
function Removeheart(element) { 
    alert("클릭됨!");
    var formId = element.getAttribute("data-form-id"); 
    var value = element.getAttribute("data-value");
    console.log("Data-value:", value);

    // 각 폼을 동적으로 생성할 필요 없이, 폼의 id를 동적으로 생성해 참조
    var form = document.getElementById("removeheart_" + formId);
    
    if (form) {
        form.elements["removeheart"].value = value;
        form.submit();
    } else {
        console.error("에러: 폼을 찾을 수 없습니다.");
    }
    console.log("Form ID:", "removeheart_" + formId);
    console.log("Data-value:", value);
}
</script>
</head>
<body >

<%@include file= "../Header.jsp"%>

<div id="jyl_body">
<div class="jyl_container">
    
	<!------------- 왼쪽 사이드 메뉴 영역 시작 ----------->
	     <div class="jyl_sidebar">
	     <ul class="jyl_menu">
	        <li><a class="side_title" href="/DongGu/mypage/MyPage.jsp"><span>My Home</span></a></li>
	        <li>
	            <a class="side_title toggle-menu" href="#"><span>나의 지원</span></a>                   
	            <ul class="submenu1">
	                <li class="jyl_submenu"><a href="/DongGu/mypage/MyPage_ApplyList.jsp"><span>지원 내역</span></a></li>
	                <li id="submenu_last" class="jyl_submenu"><a href="/DongGu/mypage/MyPage_ApplyManage.jsp"><span>지원서 관리</span></a></li>
	             </ul>
	        </li>  
	       
	        <li class="jyl_menu1">
	            <a class="side_title toggle-menu" href="#"><span>나의 활동</span></a>
	            <ul class="submenu1">
	                <li class="jyl_submenu_check"><a href="/DongGu/mypage/MyPage_Like.jsp"><span>관심 내역</span></a></li>
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
	                <span class="jyl_content2_title">관심 내역</span>              
	    </div>
	    
	    <%  
	    // 폼에서 전달된 값 가져오기
    	String likeValue = request.getParameter("likevalue"); 
	    // likeValue가 null이거나 빈 문자열일 경우 기본 값으로 "10" 설정
	    if (likeValue == null || likeValue.isEmpty()) {
	        likeValue = "10";
	    }
	    %>
	    <%
		//요청 파라미터를 읽어오기
		String removeHeartValueStr = request.getParameter("removeheart");
		
		if (removeHeartValueStr != null && !removeHeartValueStr.isEmpty()) {
		    try {
		        int removeHeartValue = Integer.parseInt(removeHeartValueStr); // 문자열을 정수로 변환
		        int success = dao.deleteWishlist(removeHeartValue);

		        if (success > 0) { // 삭제된 행의 수를 체크하여 성공 여부 확인
		        
		        	String redirectUrl = "MyPage_Like.jsp?likevalue=" + likeValue;
		        	response.sendRedirect(redirectUrl);
		        } else {         
		            out.println("삭제 실패!");
		            out.println(removeHeartValue);
		        }
		    } catch (NumberFormatException e) {
		        out.println("잘못된 요청입니다.");
		    }
		}
	%>
	     
	      
	    <form id="valueForm" action="MyPage_Like.jsp" method="post">
        		<input type="hidden" id="likevalue" name="likevalue" />
    	</form> 
	    
	    
	    <div class="like_category">
	      <div class="like_category_list <%= "10".equals(likeValue) ? "category_selected" : "" %>"><a href="#" onclick="likeClick(10);">관심 고용자</a></div>
	      <div class="like_category_list <%= "20".equals(likeValue) ? "category_selected" : "" %>"><a href="#" onclick="likeClick(20);">관심 구직자</a></div>
	      <div class="like_category_list <%= "30".equals(likeValue) ? "category_selected" : "" %>"><a href="#" onclick="likeClick(30);">관심 초대장</a></div>
	      <div class="like_category_list <%= "40".equals(likeValue) ? "category_selected" : "" %>"><a href="#" onclick="likeClick(40);">관심 자유게시판</a></div>
	      <div class="like_category_list <%= "50".equals(likeValue) ? "category_selected" : "" %>"><a href="#" onclick="likeClick(50);">관심 QnA게시판</a></div>	      
	    </div>
	  
	      
	 <%   
	ArrayList<MyPageDTO> arr = dao.mypage_Like1(m_sid, likeValue);	
	
	
	// 관심 고용자 내역 처리 (10)
	if ("10".equals(likeValue)) {
		if (arr == null || arr.isEmpty()) {
	%>
		<div class="jyl_like_content">   
	        	<div><span class="jyl_my_arrempty1">관심 고용자 내역이 없습니다.</span></div>
	        	<div><span class="jyl_my_arrempty2">고용자를 한번 살펴보세요!</span></div>
	        </div>
		<%
        } else {
        %>
     	<div class="like_array">
     	<%
            for (int i = 0; i < arr.size(); i++) {
                MyPageDTO dto = arr.get(i);
                String gendercheck_nickname  = dto.getO_nickname();
                ArrayList<String> juminList = dao.mypage_Like2(gendercheck_nickname);
                
                String imageSrc = "/DongGu/img/random.png"; // 기본 이미지
                for (String jumin : juminList) {
                    // 주민번호가 null일 경우를 대비
                    if (jumin != null && jumin.length() > 7) {
                        String secondBlock = jumin.split("-")[1].substring(0, 1); // 주민번호의 두 번째 블록의 첫 번째 문자

                        if ("1".equals(secondBlock)) {
                            int randomIndex = (int) (Math.random() * 5) + 1; // 1 ~ 5 사이의 랜덤 숫자
                            imageSrc = "/DongGu/img/random1_" + randomIndex + ".png";
                        } else if ("2".equals(secondBlock)) {
                            int randomIndex = (int) (Math.random() * 5) + 1; // 1 ~ 5 사이의 랜덤 숫자
                            imageSrc = "/DongGu/img/random2_" + randomIndex + ".png";
                        }
                    }
                }
		%>
					<form id="removeheart_<%= i %>" action="MyPage_Like.jsp" method="post">
                    <input type="hidden" name="removeheart" value="<%= dto.getW_num() %>" />
                    <input type="hidden" name="likevalue" value="10" />
                	</form>
		
                    <div class="jyl_like_list">
                        <div class="jyl_likeimg_margin10">
                            <a href="#" onclick="Removeheart(this);" data-form-id="<%= i %>" data-value="<%= dto.getW_num() %>">
                            <img class="jyl_likeimg_heart" alt="likelist1" src="/DongGu/img/yel13.png">
                        	</a>
                        <img class="jyl_likeownerimg" alt="likelist1" src="<%= imageSrc %>">

                        </div>
                        <div class="jyl_like_list1_info_10">
                            <ul>
                                <li class="jyl_like_info1"><span class="jyl_like_info_title"> <%= dto.getO_nickname()%><span> ( </span><%= dto.getO_name()%> <span>) </span></span></li>                                                      
                                <li class="jyl_like_info1">
                                    <span class="jyl_like_info_star">고용자 평점: <img class="jyl_likestar_img" alt="likestar" src="/DongGu/img/m_sec1_3.png">
                                    <span class="like_point"><%= dto.getStarcount() %></span><span> (</span><%= dto.getReviewcount() %><span>)</span></span>
                                </li>
                                <li class="jyl_like_info1">
                                    <span class="jyl_like_info_invitation">작성한 초대장 수: 
                                    <img class="jyl_likeinvitation_img" alt="likeinvitation" src="/DongGu/img/likeinvitation.png">
                                    <span class="like_point"> <%= dto.getInvitationcount()%></span></span>
                                </li>
                            </ul>
                        </div>	      
                    </div>
                <%
            	}
     			%>
	</div>	
	<%
        }
	// 관심 구직자 내역 처리 (20)
	}else if ("20".equals(likeValue)) {
	    if (arr == null || arr.isEmpty()) {
	    %> 
	    <div class="jyl_like_content">   
	        <div><span class="jyl_my_arrempty1">관심 구직자 내역이 없습니다.</span></div>
	        <div><span class="jyl_my_arrempty2">구직자를 한번 살펴보세요!</span></div>
	    </div>
	    <%
	    } else {
	    %>
	    <div class="like_array">
	        <%
	            for (int i = 0; i < arr.size(); i++) {
	                MyPageDTO dto = arr.get(i);
	        %>              
	        
	        <form id="removeheart_<%= i %>" action="MyPage_Like.jsp" method="post">
                    <input type="hidden" name="removeheart" value="<%= dto.getW_num() %>" />
                    <input type="hidden" name="likevalue" value="20" />
            </form>
	        
	        <div class="jyl_like_list">
	            <div class="jyl_likeimg_margin20">
	                <a href="#" onclick="Removeheart(this);" data-form-id="<%= i %>" data-value="<%= dto.getW_num() %>">
                            <img class="jyl_likeimg_heart" alt="likelist1" src="/DongGu/img/yel13.png">
                    </a>	                
                    <img class="jyl_likepetsitterimg" alt="likelist1" src="/DongGu/img/<%= dto.getP_img()%>">
	            </div>
	            <div class="jyl_like_list1_info_20">
	                <ul>
	                    <li class="jyl_like_info1"><span class="jyl_like_info_title"> <%= dto.getP_nickname()%><span> ( </span><%= dto.getP_name()%> <span>) </span></span></li>                                                      
	                    <li class="jyl_like_info1">
	                        <span class="jyl_like_info_star">구직자 평점: <img class="jyl_likestar_img" alt="likestar" src="/DongGu/img/m_sec1_3.png">
	                        <span class="like_point"><%= dto.getStarcount() %></span><span> (</span><%= dto.getReviewcount() %><span>)</span></span>
	                    </li>
	                    <li class="jyl_like_info1">
	                        <span class="jyl_like_info_application">지원 횟수: 
	                        <img class="jyl_likeapplication_img" alt="likeapplication" src="/DongGu/img/likeapplication.png">
	                        <span class="like_point"><%= dto.getApplycount()%></span></span>
	                    </li>
	                </ul>
	            </div>	      
	        </div>
	        <%        
	            }
	        %>     
	    </div>
	<%           
        }
    // 관심 초대장 내역 처리 (30)
	}else if ("30".equals(likeValue)) {     
        if (arr == null || arr.isEmpty()) {
    %>
           <div class="jyl_like_content">   
	        	<div><span class="jyl_my_arrempty1">관심 초대장 내역이 없습니다.</span></div>
	        	<div><span class="jyl_my_arrempty2">초대장을 한번 살펴보세요!</span></div>
	        </div>
		<%
        } else {
        %>
    <div class="like_array">
    <%
        for (int i = 0; i < arr.size(); i++) {
            MyPageDTO dto = arr.get(i);
    %>              
    
    	<form id="removeheart_<%= i %>" action="MyPage_Like.jsp" method="post">
                    <input type="hidden" name="removeheart" value="<%= dto.getW_num() %>" />
                    <input type="hidden" name="likevalue" value="30" />
        </form>

        <div class="jyl_like_list">
            <div class="jyl_likeimg_margin">
                <a href="#" onclick="Removeheart(this);"  data-form-id="<%= i %>" data-value="<%= dto.getW_num() %>">
                            <img class="jyl_likeimg_heart" alt="likelist1" src="/DongGu/img/yel13.png">
               </a>	  
                <img class="jyl_likeimg" alt="likelist1" src="/DongGu/img/<%= dto.getAi_img() %>">
            </div>
            <div class="jyl_like_list1_info">
                <ul>
                    <li class="jyl_like_info1"><span class="jyl_like_info_title"><%= dto.getI_title() %></span></li>
                    <%
                    Date i_start = dto.getI_start();
                    Date i_end = dto.getI_end();

                    if (i_start != null && i_end != null && i_start.equals(i_end)) {
                    %>     
                        <li class="jyl_like_info1"><span class="jyl_like_info_date"><%= i_start %></span></li>                   			 
                    <%
                    } else {
                    %>            
                        <li class="jyl_like_info1"><span class="jyl_like_info_date"><%= i_start %> ~ <%= i_end %></span></li>
                    <%
                    }
                    %>  
                    <li class="jyl_like_info1">
                        <span class="jyl_like_info_star">글쓴이 평점: <img class="jyl_likestar_img" alt="likestar" src="/DongGu/img/m_sec1_3.png">
                        <span class="like_point"><%= dto.getStarcount() %></span><span> (</span><%= dto.getReviewcount() %><span>)</span></span>
                    </li>
                </ul>
            </div>	      
        </div>
    <%        
        }
    %>     
    </div>
<%      
    }
} else if ("40".equals(likeValue)) {      
	if (arr == null || arr.isEmpty()) { 
		%>
		        <div class="jyl_like_content">   
		            <div><span class="jyl_my_arrempty1">관심 자유게시판 내역이 없습니다.</span></div>
		            <div><span class="jyl_my_arrempty2">자유게시판을 한번 살펴보세요!</span></div>
		        </div>
		<%
		    } else { 
		%>
		        <div class="like_array">
		         
		                <% 
		                for (int i = 0; i < arr.size(); i++) {
		                    MyPageDTO dto = arr.get(i); 
		                %>        
		                    <form id="removeheart_<%= i %>" action="MyPage_Like.jsp" method="post">
						        <input type="hidden" name="removeheart" value="<%= dto.getW_num() %>" />
						        <input type="hidden" name="likevalue" value="40" />
						    </form>
						 
						    <div class="jyl_like_border">        
						        <a href="#" onclick="Removeheart(this);" data-form-id="<%= i %>" data-value="<%= dto.getW_num() %>">
						            <img class="jyl_likeimg_boardheart" alt="likelist1" src="/DongGu/img/yel13.png">   
						        </a>
                          <%
                          if(dto.getF_img()!=null){
                          %>
                        	<div class="jyl_freelikeimg_margin">				                
				                <img class="jyl_freelikeimg" alt="likelist1" src="/DongGu/img/<%= dto.getF_img() %>">
				            </div>     
				          <%
                          }
				          %>   
	                        <div class="jyl_like_freeinfo">      
		                         <ul>
	                                <li class="jyl_like_freeinfo1"><span class="jyl_like_info_title"><%= dto.getF_title() %></span></li>	      
	                                <%
			                          if(dto.getO_name()!=null){
			                          %>                        
	                                <li class="jyl_like_freeinfo1"><span class="jyl_like_info_name"><%= dto.getF_nickname()%><span> ( </span><%= dto.getO_name()%> <span>) </span></span></li>                                                                                    	 
	                                <%
			                          } else if(dto.getP_name()!=null){
							          %> 
							          <li class="jyl_like_freeinfo1"><span class="jyl_like_info_name"><%= dto.getF_nickname()%><span> ( </span><%= dto.getP_name()%> <span>) </span></span></li>                                                                                    	 
							          <%
			                          } 
							          %>  
	                                <li class="jyl_like_freeinfo1"><span class="jyl_like_info_date"><%= dto.getF_date()%></span></li>                   			 
	                            </ul>                   
	                        </div> 		                               
                        </div>
		                
		         <%		                			
		         }
		          %>      
		 
	</div>	
<%
        }
    } else if ("50".equals(likeValue)) {     
        if (arr == null || arr.isEmpty()) {
    %>
		<div class="jyl_like_content">   
	        	<div><span class="jyl_my_arrempty1">관심 QnA 게시판 내역이 없습니다.</span></div>
	        	<div><span class="jyl_my_arrempty2">QnA 게시판을 한번 살펴보세요!</span></div>
	        </div>
		<%
        } else {
        %>
        <div class="like_array">
		         
		                <% 
		                for (int i = 0; i < arr.size(); i++) {
		                    MyPageDTO dto = arr.get(i); 
		                %>        
		                    <form id="removeheart_<%= i %>" action="MyPage_Like.jsp" method="post">
						        <input type="hidden" name="removeheart" value="<%= dto.getW_num() %>" />
						        <input type="hidden" name="likevalue" value="50" />
						    </form>
						 
						    <div class="jyl_like_border">        
						        <a href="#" onclick="Removeheart(this);" data-form-id="<%= i %>" data-value="<%= dto.getW_num() %>">
						            <img class="jyl_likeimg_boardheart" alt="likelist1" src="/DongGu/img/yel13.png">   
						        </a>
                          
	                        <div class="jyl_like_freeinfo">      
		                         <ul>
	                                <li class="jyl_like_freeinfo1"><span class="jyl_like_info_title"><%= dto.getQ_title() %></span></li>	      
	                                <%
			                          if(dto.getO_name()!=null){
			                          %>                        
	                                <li class="jyl_like_freeinfo1"><span class="jyl_like_info_name"><%= dto.getQ_nickname()%><span> ( </span><%= dto.getO_name()%> <span>) </span></span></li>                                                                                    	 
	                                <%
			                          } else if(dto.getP_name()!=null){
							          %> 
							          <li class="jyl_like_freeinfo1"><span class="jyl_like_info_name"><%= dto.getQ_nickname()%><span> ( </span><%= dto.getP_name()%> <span>) </span></span></li>                                                                                    	 
							          <%
			                          } 
							          %>  
	                                <li class="jyl_like_freeinfo1"><span class="jyl_like_info_date"><%= dto.getQ_date()%></span></li>                   			 
	                            </ul>                   
	                        </div> 		                               
                        </div>
		                
		         <%		                			
		         }
		          %>      	 
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