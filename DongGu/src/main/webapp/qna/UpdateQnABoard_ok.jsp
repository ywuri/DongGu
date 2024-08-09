<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="qdto" class="com.DongGu.board.QnABoardDTO"></jsp:useBean>
<jsp:useBean id="qdao" class="com.DongGu.board.QnABoardDAO"></jsp:useBean>

<%
//System.out.println(request.getParameter("q_num"));
qdto.setQ_content(request.getParameter("q_content"));
qdto.setQ_title(request.getParameter("q_title"));
qdto.setQ_num(Integer.parseInt(request.getParameter("q_num")));


int result = qdao.updateQnABoard(qdto);

//오류
if(result==0){
	%>
	<script>
	window.alert('[오류] 수정실패');
	window.location.href="/DongGu/qna/QnABoard.jsp";
	</script>
<%
}else if(result>=1){
	%>
	<script>
	window.alert('수정완료!');
	window.location.href="/DongGu/qna/QnABoard.jsp";
	</script>
<%
}
%>