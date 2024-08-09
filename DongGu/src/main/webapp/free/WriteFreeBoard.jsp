<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">

<style>

</style>

<script>
function showFreeBoardImg(event){
	const input = event.target;
    const previewContainer = document.getElementById('showFreeBoardImgDiv');
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
<form>
<div id="FreeBoardDivTitle" style="">
	<img src="/DongGu/img/paw-solid.svg" class="FreeBoardTitleImg"> 자유 게시글 작성 <img src="/DongGu/img/paw-solid.svg" class="FreeBoardTitleImg">
	<span style="text-align:right; ">
		<input type="submit" value="등록" id="WriteFreeBoardSubmitButton">
	</span>
	
</div>

	<div id="WriteFreeBoardMainDiv">
		<input id="WriteFreeBoardTitleInput"  autofocus type="text" placeholder="제목을 입력해 주세요." name="title" required>
		<div id="WriteFreeBoardContentDiv">
			<textarea id="WriteFreeBoardContent" name="content" placeholder="내용을 입력하세요." required></textarea>
		</div>
	</div>
	
	<div id="WriteFreeBoardImgDiv">
		<div id="WriteFreeBoardImgDiv2" >
			<input id="WriteFreeBoardInputImg" type="file" name="" accept="image/*" onchange="showFreeBoardImg(event);"/>
			<div id="showFreeBoardImgDiv" >
			</div>
		</div>
		
	</div>
</form>
<%@include file="../Footer.jsp" %>
</body>
</html>