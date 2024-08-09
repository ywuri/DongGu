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
String q_id = request.getParameter("q_id");
String sid = (String)session.getAttribute("sid");
%>



<%@include file="../SubHeader.jsp" %>
<div id="BoardMargin">
	<div>
		<div id="WriteFreeBoardMainDiv">
			<div id="DetailBoardSubject" ><a href="/DongGu/qna/QnABoard.jsp" class="DetailBoardSubject">QnA 게시판 ></a></div>
			<%
				if(q_id.equals(" ")){
					%>
					<div id="DetailBoardTitle" style="color:#808080;">
						<img style="width:28px; padding-right:10px;" src="/DongGu/img/icon_trash.svg"><%=qdto.getQ_title()%></div>
					<%
				}
				else{
					%>
					<div id="DetailBoardTitle" ><%=qdto.getQ_title()%></div>
					<%
				}
			%>
			<div id="DetailBoardInfo">작성자 : <%=qdto.getQ_nickname()%>(<%=qdto.getQ_id()%>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성날짜 : <%=qdto.getQ_date()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회:<%=qdto.getQ_vcnt()%></div>
			<div id="WriteFreeBoardContentDiv">
				<div id="DetailQnABoardContentDiv" ><%=qdto.getQ_content()%></div>
			</div>
			<%
				if(!q_id.equals(" ")){
					%>
					<input class="FreeBoardButton" id="ReWriteButton" type="button" value="답글쓰기"  onclick="location.href='/DongGu/qna/ReWriteQnABoard.jsp?q_title=<%=qdto.getQ_title()%>&q_ref=<%=qdto.getQ_ref() %>&q_lev=<%=qdto.getQ_lev() %>&q_sunbun=<%=qdto.getQ_sunbun() %>';">
			<%
				}
			%>
			
			<%
				if(q_id.equals(sid)){
					%>
					<input class="FreeBoardButton" id="ReWriteButton" type="button" value="수정하기"  onclick="location.href='/DongGu/qna/UpdateQnABoard.jsp?q_num=<%=q_num %>';">
					<input class="FreeBoardButton" id="ReWriteButton" type="button" value="삭제하기"  onclick="location.href='/DongGu/qna/DeleteQnABoard.jsp?q_num=<%=q_num %>&q_ref=<%=qdto.getQ_ref() %>&q_lev=<%=qdto.getQ_lev() %>&q_sunbun=<%=qdto.getQ_sunbun() %>';">
					<%
				}
			%>
			
			<input class="FreeBoardButton" id="FreeBoardTableButton" type="button" value="뒤로가기"  onclick="window.history.back();">
			<%-- QnABoard.jsp?cp=<%=cp %> --%>
		</div>
	</div>
</div>
<%@include file="../Footer.jsp" %>

</body>
</html>