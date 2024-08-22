<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.Date" %>  
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
<%
//로그인 안했을 시 전 페이지로 돌아가게
String s_id =(String)session.getAttribute("sid");
if(s_id==null || s_id.equals("")){
	%>
	<script>
	window.alert('로그인이 필요한 작업입니다.');
	window.location.href="/DongGu/member/login.jsp";
	</script>
<%
}
%>

<script>
function showFreeBoardImg(event){
	const input = event.target;
    const previewContainer = document.getElementById('showFreeBoardImgDiv3');
    const file = input.files[0];
    const reader = new FileReader();

    // 기존 이미지나 텍스트 제거
    previewContainer.innerHTML = '';

    reader.onload = function(e) {
      const img = document.createElement('img');
      img.src = e.target.result;
      previewContainer.appendChild(img);
    };

    if (file) {
      reader.readAsDataURL(file);
    } 
}
</script>

</head>
<body>
<%@include file="../SubHeader.jsp" %>
<form name="WriteFreeBoard" action="/DongGu/free/WriteFreeBoard_ok.jsp" method="post" enctype="multipart/form-data">
	<div id="FreeBoardDivTitle2">
	    <div style="width:90%; left: 50%; text-align:center; "><span>자유게시판 작성</span></div>
	    <div style="width:10%;">
	    	<span style="text-align: right;">
	        <input type="submit" value="등록" id="WriteFreeBoardSubmitButton">
	    </span>
	    </div>
	</div>
	
	

	<div id="WriteFreeBoardMainDiv">
		<div style="display: flex; align-items: center;">
			<input name="f_title" id="WriteFreeBoardTitleInput"  autofocus type="text" placeholder="제목을 입력해 주세요." required>
			<label for="labelImg" id="commentLabel" style="" >
		           <img src="/DongGu/img/icon_camera.svg" style="width: 40px; padding-right: 17px;">
		     </label>
		</div>
		
		
		<div id="WriteFreeBoardContentDiv">
			<textarea name="f_content" id="WriteFreeBoardContent" placeholder="내용을 입력하세요." required></textarea>
			<input id="labelImg" style="display:none;" class="WriteFreeBoardInputImg" type="file" name="f_img" accept="image/*" onchange="showFreeBoardImg(event);"/>
			<div id="showFreeBoardImgDiv3" >
			</div>
		</div>
	</div>

	
	<div id="WriteFreeBoardImgDiv" >
		<div style="    margin-top: 10px; border-radius: 10px;text-align:center;" >
		</div>
		
	</div>
	
</form>
<%@include file="../Footer.jsp" %>
</body>
</html>