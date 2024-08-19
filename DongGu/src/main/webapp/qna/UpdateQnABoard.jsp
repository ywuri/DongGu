<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DongGu.board.QnABoardDAO" %>    
<%@ page import="com.DongGu.board.QnABoardDTO" %>       
    
<!DOCTYPE html>
<%@ page import="java.sql.Date" %>  
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
<jsp:useBean id="dao" class="com.DongGu.board.QnABoardDAO"></jsp:useBean>
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
String q_num = request.getParameter("q_num");
//게시글 제목과 내용가져오기
QnABoardDTO dto =dao.getQnABoardDetail(Integer.parseInt(q_num));



%>

</head>
<body>
<%@include file="../SubHeader.jsp" %>
<form name="WriteQnABoard" action="/DongGu/qna/UpdateQnABoard_ok.jsp">
	<div id="FreeBoardDivTitle2">
	    <div style="width:90%; left: 50%; text-align:center; "><span>QnA 수정 </span></div>
	    <div style="width:10%;">
	    	<span style="text-align: right;">
	        <input type="submit" value="수정" id="WriteFreeBoardSubmitButton">
	    </span>
	    </div>
	</div>
	<input type="hidden" name="q_num" value="<%=q_num %>">
	<div id="WriteFreeBoardMainDiv">
		<input name="q_title" id="WriteFreeBoardTitleInput"  autofocus type="text" value="<%=dto.getQ_title() %>" required>
		<div id="WriteFreeBoardContentDiv">
			<textarea name="q_content" id="WriteFreeBoardContent"  required><%=dto.getQ_content() %></textarea>
		</div>
	</div>
	
</form>
<%@include file="../Footer.jsp" %>
</body>
</html>