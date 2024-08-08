<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>  
<%@ page import="com.DongGu.board.QnABoardDAO" %>    
<%@ page import="com.DongGu.board.QnABoardDTO" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>  
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
</head>
<body>
<jsp:useBean id="dao" class="com.DongGu.board.QnABoardDAO"></jsp:useBean>
<jsp:useBean id="dto" class="com.DongGu.board.QnABoardDTO"></jsp:useBean>
<%
int q_num = Integer.parseInt(request.getParameter("q_num")) ;
QnABoardDTO qdto = dao.getQnABoardDetail(q_num);
int cp = Integer.parseInt( request.getParameter("cp"));
%>



<%@include file="Header.jsp" %>
<div id="BoardMargin">
	<div>
		<div id="WriteFreeBoardMainDiv">
			<div id="DetailBoardSubject" ><a href="QnABoard.jsp" class="DetailBoardSubject">QnA 게시판 ></a></div>
			<div id="DetailBoardTitle"><%=qdto.getQ_title()%></div>
			<div id="DetailBoardInfo">작성자 : <%=qdto.getQ_nickname()%>(<%=qdto.getQ_id()%>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성날짜 : <%=qdto.getQ_date()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회:<%=qdto.getQ_vcnt()%></div>
			<div id="WriteFreeBoardContentDiv">
				<div id="DetailQnABoardContentDiv" ><%=qdto.getQ_content()%></div>
			</div>
			<input class="FreeBoardButton" id="FreeBoardTableButton" type="button" value="뒤로가기"  onclick="window.history.back();">
			<%-- QnABoard.jsp?cp=<%=cp %> --%>
		</div>
	</div>
</div>
<%@include file="Footer.jsp" %>

</body>
</html>