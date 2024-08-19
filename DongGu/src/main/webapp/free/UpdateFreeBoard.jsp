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
<form name="WriteQnABoard" action="/DongGu/free/UpdateFreeBoard_ok.jsp">
	<div id="FreeBoardDivTitle">
		<img src="/DongGu/img/paw-solid.svg" class="FreeBoardTitleImg"> 게시글 수정 <img src="/DongGu/img/paw-solid.svg" class="FreeBoardTitleImg">
		<span style="text-align:right; ">
			<input type="submit" value="수정" id="WriteFreeBoardSubmitButton">
		</span>
		
	</div>
	<input type="hidden" name="f_num" value="<%=f_num %>">
	<div id="WriteFreeBoardMainDiv">
		<input name="f_title" id="WriteFreeBoardTitleInput"  autofocus type="text" value="<%=dto.getF_title() %>" required>
		<div id="WriteFreeBoardContentDiv">
			<textarea name="f_content" id="WriteFreeBoardContent"  required><%=dto.getF_content() %></textarea>
		</div>
	</div>
	
</form>
<%@include file="../Footer.jsp" %>
</body>
</html>