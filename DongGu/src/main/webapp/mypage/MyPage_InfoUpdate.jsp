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
   MyPageDTO dto = dao.mypage_InfoUpdate1(m_sid,m_usertype); 
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
</head>
<script>
	function open_file() {
		document.getElementById('file-upload').click();
	}
	
	function handleFileSelect(event) {
	        const file = event.target.files[0];
	        if (file) {
	            const reader = new FileReader();
	            reader.onload = function(e) {
	                const image = document.querySelector('.jyl_infoupdate_img');
	                image.src = e.target.result;
	            };
	            reader.readAsDataURL(file);
	        }
	    }

    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('file-upload').addEventListener('change', handleFileSelect);
    });
</script>
<body >

<%@include file="../Header.jsp" %>

<div id="jyl_body">
<div class="jyl_container">
     <!------------- 왼쪽 사이드 메뉴 영역 시작 ----------->
	     <div class="jyl_sidebar">
	     <ul class="jyl_menu">
	        <li><a class="side_title" href="/DongGu/mypage/MyPage.jsp"><span>My Home</span></a></li>
	        <li >
	            <a class="side_title toggle-menu" href="#"><span>나의 지원</span></a>                   
	            <ul class="submenu1">
	                <li class="jyl_submenu"><a href="/DongGu/mypage/MyPage_ApplyList.jsp"><span>지원 내역</span></a></li>
	                <li id="submenu_last" class="jyl_submenu"><a href="/DongGu/mypage/MyPage_ApplyManage.jsp"><span>지원서 관리</span></a></li>
	             </ul>
	        </li>  
	       
	        <li>
	            <a class="side_title toggle-menu" href="#"><span>나의 활동</span></a>
	            <ul class="submenu1">
	                <li id="submenu_last" class="jyl_submenu"><a href="/DongGu/mypage/MyPage_Like.jsp"><span>관심 내역</span></a></li>
	           </ul>
	        </li>
	        <li class="jyl_menu1">
	            <a class="side_title toggle-menu" href="#"><span>회원 정보</span></a>
	            <ul class="submenu1">
	                <li class="jyl_submenu_check"><a href="/DongGu/mypage/MyPage_InfoUpdate.jsp"><span>회원정보 수정</span></a></li>
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
    
    
    
    <!------------- 오른쪽 컨텐츠 영역 ----------->    
    <div class="jyl_content">
	    
	    <div class="jyl_content1">   
	          <span class="jyl_content2_title">회원정보 수정</span>              
	    </div>
            
      <div class="jyl_infoupdate">
	      	<form action="/DongGu/mypage/MyPage_InfoUpdate_ok.jsp" method="post" enctype="multipart/form-data">
                <ul id="jyl_joinul">
                    <li class="jyl_inputlist">
                    <div class="image-container">
                    			<% if (m_usertype==1){%>
                                <img class="jyl_infoupdate_img" alt="list1" src="/DongGu/img/petsitter_profile/<%= dto.getP_img()%>">
                                <input type="hidden" name="p_img" value="<%= dto.getP_img()%>">
                                <a onclick="open_file();"><img id="jyl_upload_click" class="jyl_infoupdate_img2" alt="list1" src="/DongGu/img/m_camera.png"></a>
                                <input id="file-upload" name="profileImage" type="file" style="display:none;" accept="image/*">
                                <% } else if (m_usertype==0){
                                	String gendercheck_nickname  = dto.getO_nickname();
                                    ArrayList<String> juminList = dao.mypage_Like2(gendercheck_nickname);
                                    
                                    String imageSrc = "/DongGu/img/random.png"; // 기본 이미지
                                    for (String jumin : juminList) {
                                        // 주민번호가 null일 경우를 대비
                                        if (jumin != null && jumin.length() > 7) {
                                            String secondBlock = jumin.split("-")[1].substring(0, 1); // 주민번호의 두 번째 블록의 첫 번째 문자

                                            if ("1".equals(secondBlock)||"3".equals(secondBlock)) {
                                                int randomIndex = (int) (Math.random() * 5) + 1; // 1 ~ 5 사이의 랜덤 숫자
                                                imageSrc = "/DongGu/img/random1_" + randomIndex + ".png";
                                            } else if ("2".equals(secondBlock)||"4".equals(secondBlock)) {
                                                int randomIndex = (int) (Math.random() * 5) + 1; // 1 ~ 5 사이의 랜덤 숫자
                                                imageSrc = "/DongGu/img/random2_" + randomIndex + ".png";
                                            }
                                        }
                                    }
                                %>
                                <img class="jyl_infoupdate_img" alt="list1" src="<%= imageSrc%>">  
                                <% }%>                           
                            </div>
                    </li>
                    <li class="jyl_inputlist">
                        <i>아이디</i>
                        <% if (m_usertype==1){%>
                        <input type="text" name="id" class="jyl_inputlist_readonly" readonly="readonly" value="<%= dto.getP_id()%>">   
                        <% }else if (m_usertype==0){%> 
                        <input type="text" name="id" class="jyl_inputlist_readonly" readonly="readonly" value="<%= dto.getO_id()%>">   
                        <% }%> 
                        <i class="jyl_infoupdate_hidden"></i>                    
                    </li> 
                    <li class="jyl_inputlist">
                        <i>비밀번호</i>
                        <input type="text" name="pwd" placeholder="비밀번호를 입력하세요">
                        <i class="jyl_infoupdate_hidden"></i>
                    </li>
                    <li class="jyl_inputlist">
                        <i>비번확인</i>
                        <input type="text" name="pwdcheck" placeholder="비밀번호를 다시 입력하세요">
                        <i class="jyl_infoupdate_hidden"></i>
                    </li>
                    <li class="jyl_inputlist">
                        <i>이름</i>
                        <% if (m_usertype==1){%>
                        <input type="text" name="p_name" class="jyl_inputlist_readonly" readonly="readonly" value="<%= dto.getP_name()%>">
                        <% }else if (m_usertype==0){%>
                        <input type="text" name="o_name" class="jyl_inputlist_readonly" readonly="readonly" value="<%= dto.getO_name()%>">                       
                        <% }%> 
                        <i class="jyl_infoupdate_hidden"></i>
                    </li>
                     <li class="jyl_inputlist">
                        <i>성별</i>
                        <div class="jyl_radio_group">
                         <% if (m_usertype==1){%>
	                         	<% if (dto.getP_gender()==1){%>
					            <label><input type="radio" name="p_gender" value="female" disabled="disabled">여자</label>
					            <label id="jyl_radio_male"><input type="radio" name="p_gender" value="male" checked="checked">남자</label>
					            <% }else if (dto.getP_gender()==2){%>
					            <label><input type="radio" name="p_gender" value="female" checked="checked">여자</label>
					            <label id="jyl_radio_male"><input type="radio" name="p_gender" value="male" disabled="disabled">남자</label>
					            <% }%>
					     <% }else if (m_usertype==0){%>
					     		<% if (dto.getO_gender()==1){%>
					            <label><input type="radio" name="o_gender" value="female" disabled="disabled">여자</label>
					            <label id="jyl_radio_male"><input type="radio" name="o_gender" value="male" checked="checked">남자</label>
					            <% }else if (dto.getO_gender()==2){%>
					            <label><input type="radio" name="o_gender" value="female" checked="checked">여자</label>
					            <label id="jyl_radio_male"><input type="radio" name="o_gender" value="male" disabled="disabled">남자</label>
					            <% }%>
				         <% }%>				         
				        </div>
				        <i class="jyl_infoupdate_hidden"></i>
					</li>
					<% if (m_usertype==1){%>
					<li class="jyl_inputlist">
                        <i>흡연여부</i>
                        <div class="jyl_radio_group">
                        	<% if (dto.getP_smoke()==0){%>
				            <label><input type="radio" name="p_smoke" value="1">흡연</label>
				            <label id="jyl_radio_nosmoke"><input type="radio" name="p_smoke" value="0" checked="checked">비흡연</label>
				            <% }else if (dto.getP_smoke()==1){%>
				            <label><input type="radio" name="p_smoke" value="1" checked="checked">흡연</label>
				            <label id="jyl_radio_nosmoke"><input type="radio" name="p_smoke" value="0" >비흡연</label>
				            <% }%>				            
				        </div>
				        <i class="jyl_infoupdate_hidden"></i>
					</li>
					<% }%>
                    <li class="jyl_inputlist">
				    <i>닉네임</i>
				    <% 
				        String nicknameName = (m_usertype == 1) ? "p_nickname" : "o_nickname";
				        String nicknameValue = (m_usertype == 1) ? dto.getP_nickname() : dto.getO_nickname();
				    %>
				    <input type="text" id="nicknameInput" name="<%= nicknameName %>" placeholder="닉네임을 입력하세요" value="<%= nicknameValue %>">
				    <input type="button" value="중복확인" class="jyl_btn" onclick="validateNickname()">    
				</li>


                    <li class="jyl_inputlist">
                        <i>전화번호</i>
                        <% if (m_usertype==1){%>
                        <input type="text" name="p_tel" placeholder="전화번호를 입력하세요" value="<%= dto.getP_tel()%>">
                        <% }else if (m_usertype==0){%>
                        <input type="text" name="o_tel" placeholder="전화번호를 입력하세요" value="<%= dto.getO_tel()%>">
                        <% }%>
                        <i class="jyl_infoupdate_hidden"></i>
                    </li>
                    <li class="jyl_inputlist">
                        <i>주소</i>
                        <% if (m_usertype==1){%>
                        <input type="text" name="p_addr" placeholder="주소를 입력하세요" value="<%= dto.getP_addr()%>">
                        <% }else if (m_usertype==0){%>
                        <input type="text" name="o_addr" placeholder="주소를 입력하세요" value="<%= dto.getO_addr()%>">
                        <% }%>
                        <i class="jyl_infoupdate_hidden"></i>
                    </li>                
                    <li class="jyl_inputlist">
                    <input type="submit" value="수정" class="jyl_btn">
                    <input type="reset" value="다시작성" class="jyl_btn">
                    </li>  
                    <li class="jyl_inputlist">
                    <a href="#" class="jyl_resign">회원 탈퇴</a>
                    </li>       
                </ul> 
                </form>
      </div>
      
 
	</div>
    <!------------- E : 오른쪽 컨텐츠 영역 ----------->
</div>
</div>
</body>
<%@include file="../Footer.jsp" %>
</html>