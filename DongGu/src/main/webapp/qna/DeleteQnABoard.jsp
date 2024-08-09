<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dao" class="com.DongGu.board.QnABoardDAO"></jsp:useBean>
<jsp:useBean id="dto" class="com.DongGu.board.QnABoardDTO"></jsp:useBean>


<!-- 	내가 만드는 삭제는 답글이 달린 게시물이 삭제되면 삭제된 게시글입니다로 변경.
		근데 그냥 삭제해도 괜찮다.
		답글은 그냥 무조건 지우기 -->
<%
String q_num = request.getParameter("q_num");
String q_ref = request.getParameter("q_ref");
String q_lev = request.getParameter("q_lev");
String q_sunbun = request.getParameter("q_sunbun");

dto.setQ_num(Integer.parseInt(q_num) );
dto.setQ_ref(Integer.parseInt(q_ref));
dto.setQ_lev(Integer.parseInt(q_lev));
dto.setQ_sunbun(Integer.parseInt(q_sunbun));

int result =dao.deleteQnABoard(dto);
if(result>=1){
%>
	<script>
	window.alert('삭제완료!');
	window.location.href="/DongGu/qna/QnABoard.jsp";
	</script>
<%
}
else{
	%>
	<script>
	window.alert('[오류] 삭제실패!');
	window.location.href="/DongGu/qna/QnABoard.jsp";
	</script>
<%
}
%>



