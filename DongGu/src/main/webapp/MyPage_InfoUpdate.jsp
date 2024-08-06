<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="/css/DongGu.css">
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
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

<%@include file="Header.jsp" %>

<div id="jyl_body">
<div class="jyl_container">
     <!------------- 왼쪽 사이드 메뉴 영역 ----------->
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
    <!------------- E : 왼쪽 메뉴 영역 ----------->
    
    <!------------- 오른쪽 컨텐츠 영역 ----------->    
    <div class="jyl_content">
    
      <div class="jyl_content2">   
	                <span class="jyl_content2_title"> 회원정보 수정</span>              
	      </div>
      
      
      <div class="jyl_infoupdate">
      	<form name="join" action="memberjoin_ok.jsp" method="post">
                <ul id="jyl_joinul">
                    <li class="jyl_inputlist">
                    <div class="image-container">
                                <img class="jyl_infoupdate_img" alt="list1" src="img/yel21.png">
                                <a onclick="open_file();"><img id="jyl_upload_click" class="jyl_infoupdate_img2" alt="list1" src="img/yel22.png"></a>
                                <input id="file-upload" type="file" style="display:none;" accept="image/*">
                            </div>
                    </li>
                    <li class="jyl_inputlist">
                        <i>아이디</i>
                        <input type="text" name="id" class="jyl_inputlist_readonly" readonly="readonly" value="yeling0821">                      
                    </li> 
                    <li class="jyl_inputlist">
                        <i>비밀번호</i>
                        <input type="text" name="pwd" placeholder="비밀번호를 입력하세요">
                    </li>
                    <li class="jyl_inputlist">
                        <i>이름</i>
                        <input type="text" name="name" class="jyl_inputlist_readonly" readonly="readonly" value="진예림">
                    </li>
                     <li class="jyl_inputlist">
                        <i>성별</i>
                        <div class="jyl_radio_group">
				            <label><input type="radio" name="gender" value="female" checked="checked">여자</label>
				            <label id="jyl_radio_male"><input type="radio" name="gender" value="male" disabled="disabled">남자</label>
				        </div>
					</li>
					<li class="jyl_inputlist">
                        <i>흡연여부</i>
                        <div class="jyl_radio_group">
				            <label><input type="radio" name="smoking" value="smoker" disabled="disabled">흡연</label>
				            <label id="jyl_radio_nosmoke"><input type="radio" name="smoking" value="non_smoker" checked="checked">비흡연</label>
				        </div>
					</li>
                    <li class="jyl_inputlist">
                        <i>닉네임</i>
                        <input type="text" name="nickname" placeholder="닉네임을 입력하세요" value="예예예예">
                    </li>
                    <li class="jyl_inputlist">
                        <i>전화번호</i>
                        <input type="text" name="tel" placeholder="전화번호를 입력하세요" value="010-0000-1234">
                    </li>
                    <li class="jyl_inputlist">
                        <i>주소</i>
                        <input type="text" name="addr" placeholder="주소를 입력하세요" value="서울 잠실 송파동">
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
<%@include file="Footer.jsp" %>
</html>