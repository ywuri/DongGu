<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DongGu.board.FreeBoardDAO" %>    
<%@ page import="com.DongGu.board.FreeBoardDTO" %>       
    
<!DOCTYPE html>
<%@ page import="java.sql.Date" %>  
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
<jsp:useBean id="dao" class="com.DongGu.board.FreeBoardDAO"></jsp:useBean>
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
String f_num = request.getParameter("f_num");
//게시글 제목과 내용가져오기
FreeBoardDTO dto =dao.getFreeBoardDetail(Integer.parseInt(f_num));



%>

</head>
<body>
<%@include file="../SubHeader.jsp" %>
<form name="WriteQnABoard" action="/DongGu/free/UpdateFreeBoard_ok.jsp" method="post" enctype="multipart/form-data">

	<div id="FreeBoardDivTitle2">
	    <div style="width:90%; left: 50%; text-align:center; "><span>자유게시판 수정</span></div>
	    <div style="width:10%;">
	    	<span style="text-align: right;">
	        <input type="submit" value="수정" id="WriteFreeBoardSubmitButton">
	    </span>
	    </div>
	    
	</div>	
	
	
		<div id="WriteFreeBoardMainDiv">
		<div style="display: flex; align-items: center;">
			<input name="f_title" id="WriteFreeBoardTitleInput"  autofocus type="text"  value="<%=dto.getF_title() %>" required>
			<label for="labelImg" id="commentLabel" style="" >
		           <img src="/DongGu/img/icon_camera.svg" style="width: 40px; padding-right: 17px;">
		     </label>
		</div>
		
		
		<div id="WriteFreeBoardContentDiv">
			<textarea name="f_content" id="WriteFreeBoardContent"  required><%=dto.getF_content() %></textarea>
			<input name="f_img"  id="labelImg" style="display:none;" class="WriteFreeBoardInputImg" type="file" accept="image/*" onchange="showFreeBoardImg(event);"/>
			<div id="showFreeBoardImgDiv3" style="position: relative; display: flex; justify-content: left; width: 100%;" >
				<%
					if(dto.getF_img()!=null && !("").equals(dto.getF_img().trim())){	
				%>
					<img  id="existingImage" src="/DongGu/img/free/<%=dto.getF_img() %>" style="display: block;">
					<img id="delete_icon" class="delete_icon" onclick="deleteImage();" src="/DongGu/img/icon_x_red.svg"  style="width:40px;height: 40px; position: absolute; top: -1px; right: 482px; display:block;">					
					<%
					}
					else{
					%>
					<img id="delete_icon" class="delete_icon" onclick="deleteImage();" src="/DongGu/img/icon_x_red.svg"  style="width:40px;height: 40px; position: absolute; top: -1px; right: 482px; display:none;">					
					<% 
					}
				%>	
				
			</div>
		</div>
	</div>
		
	<input type="hidden" name="f_num" value="<%=f_num %>">

	
</form>
<%@include file="../Footer.jsp" %>
</body>

<script>
function showFreeBoardImg(event){
	const input = event.target;
    const previewContainer = document.getElementById('showFreeBoardImgDiv3');
    const file = input.files[0];
    const reader = new FileReader();

    // 기존 이미지 요소만 제거 (삭제 버튼은 유지)
    const existingImage = previewContainer.querySelector('img:not(.delete_icon)');
    if (existingImage) {
        previewContainer.removeChild(existingImage);
    }

    reader.onload = function(e) {
      const img = document.createElement('img');
      img.src = e.target.result;
      previewContainer.appendChild(img);
      
      // 삭제 버튼 보이게 하기
      var deleteIcon = document.getElementById('delete_icon');
      if (deleteIcon) {
          deleteIcon.style.display = 'block'; // 삭제 버튼을 보이게 함
      }
    };

    if (file) {
      reader.readAsDataURL(file);
    } 
}

//x를 누르면 사진 지워지면서 x자 display : none으로
function deleteImage(){
	var fileInput  = document.getElementById('labelImg');
	console.log("1");
	// 파일 입력값 초기화
    if (fileInput ) {
    	fileInput  = '';
    }
    console.log("2");
 	// 기존 이미지와 삭제 버튼 요소 선택
    var existingImage = document.getElementById('existingImage');
    var deleteIcon = document.getElementById('delete_icon');
    
 	// 요소가 존재하면 제거
    if (existingImage) {
        existingImage.style.display = 'none';
        console.log("3");
    }
    if (deleteIcon) {
    	deleteIcon.style.display = 'none';  // 삭제 버튼을 숨김
    	console.log("4");
    }
}
</script>


</html>

