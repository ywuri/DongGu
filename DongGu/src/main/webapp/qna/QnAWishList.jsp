<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DongGu.board.QnABoardDAO" %>    
<%@ page import="com.DongGu.board.QnABoardDTO" %>   
<jsp:useBean id="dao" class="com.DongGu.board.QnABoardDAO"></jsp:useBean>
<jsp:useBean id="dto" class="com.DongGu.board.QnABoardDTO"></jsp:useBean>
<%

int cp;
if(request.getParameter("cp")==null){
	cp=1;
}
else{
	cp = Integer.parseInt( request.getParameter("cp"));
}

String q_id = request.getParameter("q_id");
String sid = (String)session.getAttribute("sid");
String q_num =  request.getParameter("q_num");


int w_id_check = dao.isOwnerOrPet(q_id);


int result = dao.changeWishStatus(sid,q_num,w_id_check );

//삭제되거나 추가성공
if(result==1){
	%>
	<script>
	/* window.alert('성공'); */
	window.location.href="/DongGu/qna/DetailQnABoard.jsp?q_id=<%=q_id%>&q_num=<%=q_num%>&cp=<%=cp%>";
	</script>
	
	<%
}
//안되면
else{
	%>
	<script>
	/* window.alert('[오류] 작성실패'); */
	window.location.href="/DongGu/qna/DetailQnABoard.jsp?q_id=<%=q_id%>&q_num=<%=q_num%>&cp=<%=cp%>";
	</script>
	
	<%
}
%>