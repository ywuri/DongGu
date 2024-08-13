<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DongGu.board.NoticeDAO" %>    
<%@ page import="com.DongGu.board.NoticeDTO" %>       
    
<!DOCTYPE html>
<%@ page import="java.sql.Date" %>  
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
<jsp:useBean id="dao" class="com.DongGu.board.NoticeDAO"></jsp:useBean>
<%
//로그인 안했을 시 전 페이지로 돌아가게
String s_id =(String)session.getAttribute("sid");
if(s_id==null || s_id.equals("")){
	%>
	<script>
	window.alert('로그인이 필요한 작업입니다.');
	window.location.href="/DongGu/member/login.jsp";
	///////////////이거바꾸끼//////////////
	</script>
<%
}
String n_num = request.getParameter("n_num");
//게시글 제목과 내용가져오기
NoticeDTO dto =dao.getNoticeDetail(Integer.parseInt(n_num));



%>

</head>
<body>
<%@include file="../SubHeader.jsp" %>
<form name="WriteQnABoard" action="/DongGu/notice/UpdateNotice_ok.jsp">
	<div id="FreeBoardDivTitle">
		<img src="/DongGu/img/paw-solid.svg" class="FreeBoardTitleImg"> QnA 수정 <img src="/DongGu/img/paw-solid.svg" class="FreeBoardTitleImg">
		<span style="text-align:right; ">
			<input type="submit" value="수정" id="WriteFreeBoardSubmitButton">
		</span>
		
	</div>
	<input type="hidden" name="n_num" value="<%=n_num %>">
	<div id="WriteFreeBoardMainDiv">
		<input name="n_title" id="WriteFreeBoardTitleInput"  autofocus type="text" value="<%=dto.getN_title() %>" required>
		<div id="WriteFreeBoardContentDiv">
			<textarea name="n_content" id="WriteFreeBoardContent"  required><%=dto.getN_content() %></textarea>
		</div>
	</div>
	
</form>
<%@include file="../Footer.jsp" %>
</body>
</html>