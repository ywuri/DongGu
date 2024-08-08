<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="qdto" class="com.DongGu.board.QnABoardDTO"></jsp:useBean>
<jsp:useBean id="qdao" class="com.DongGu.board.QnABoardDAO"></jsp:useBean>

<%
qdto.setQ_content(request.getParameter("q_content"));
qdto.setQ_title(request.getParameter("q_title"));

//여기에 현재 세션에서 아이디 가져오기
//여기에 현재 세션에서 닉네임 가져오기
qdto.setQ_id((String)session.getAttribute("sid"));
qdto.setQ_nickname((String)session.getAttribute("snickname"));

int result = qdao.WriteQnABoard(qdto);

//오류
if(result==0){
	%>
	<script>
	window.alert('[오류] 작성실패');
	window.location.href="QnABoard.jsp";
	</script>
<%
}else if(result>=1){
	%>
	<script>
	window.alert('작성완료!');
	window.location.href="QnABoard.jsp";
	</script>
<%
}
%>