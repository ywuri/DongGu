<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="fdto" class="com.DongGu.board.FreeBoardDTO"></jsp:useBean>
<jsp:useBean id="fdao" class="com.DongGu.board.FreeBoardDAO"></jsp:useBean>

<%
//System.out.println(request.getParameter("q_num"));
fdto.setF_content(request.getParameter("f_content"));
fdto.setF_title(request.getParameter("f_title"));
fdto.setF_num(Integer.parseInt(request.getParameter("f_num")));


int result = fdao.updateFreeBoard(fdto);

//오류
if(result==0){
	%>
	<script>
	window.alert('[오류] 수정실패');
	window.location.href="/DongGu/free/FreeBoard.jsp";
	</script>
<%
}else if(result>=1){
	%>
	<script>
	window.alert('수정완료!');
	window.location.href="/DongGu/free/FreeBoard.jsp";
	</script>
<%
}
%>