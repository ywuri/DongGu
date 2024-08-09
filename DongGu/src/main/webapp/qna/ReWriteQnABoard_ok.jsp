<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="qdto" class="com.DongGu.board.QnABoardDTO"></jsp:useBean>
<jsp:useBean id="qdao" class="com.DongGu.board.QnABoardDAO"></jsp:useBean>

<%
qdto.setQ_content(request.getParameter("q_content"));
qdto.setQ_title(request.getParameter("q_title"));
qdto.setQ_ref(Integer.parseInt(request.getParameter("q_ref")) );
qdto.setQ_lev(Integer.parseInt(request.getParameter("q_lev")));
qdto.setQ_sunbun(Integer.parseInt(request.getParameter("q_sunbun")));

qdto.setQ_id((String)session.getAttribute("sid"));
qdto.setQ_nickname((String)session.getAttribute("snickname"));

int result = qdao.ReWriteQnABoard(qdto);

//오류
if(result==0){
	%>
	<script>
	window.alert('[오류] 답글 작성실패');
	window.location.href="/DongGu/qna/QnABoard.jsp";
	</script>
<%
}else if(result>=1){
	%>
	<script>
	window.alert('답글 작성완료!');
	window.location.href="/DongGu/qna/QnABoard.jsp";
	</script>
<%
}
%>