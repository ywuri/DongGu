<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DongGu.board.FreeBoardDAO" %>    
<%@ page import="com.DongGu.board.FreeBoardDTO" %>   
<jsp:useBean id="dao" class="com.DongGu.board.FreeBoardDAO"></jsp:useBean>
<jsp:useBean id="dto" class="com.DongGu.board.FreeBoardDTO"></jsp:useBean>
<%

int cp;
if(request.getParameter("cp")==null){
	cp=1;
}
else{
	cp = Integer.parseInt( request.getParameter("cp"));
}

String f_id = request.getParameter("f_id");
String sid = (String)session.getAttribute("sid");
String f_num =  request.getParameter("f_num");

int w_id_check = dao.isOwnerOrPet(f_id);

int result = dao.changeWishStatus(sid,f_num,w_id_check );

//삭제되거나 추가성공
if(result==1){
	%>
	<script>
	/* window.alert('성공'); */
	window.location.href="/DongGu/free/DetailFreeBoard.jsp?f_id=<%=f_id%>&f_num=<%=f_num%>&cp=<%=cp%>";
	</script>
	
	<%
}
//안되면
else{
	%>
	<script>
	/* window.alert('[오류] 작성실패'); */
	window.location.href="/DongGu/free/DetailFreeBoard.jsp?f_id=<%=f_id%>&f_num=<%=f_num%>&cp=<%=cp%>";
	</script>
	
	<%
}
%>