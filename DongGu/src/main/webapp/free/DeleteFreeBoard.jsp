<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dao" class="com.DongGu.board.FreeBoardDAO"></jsp:useBean>
<jsp:useBean id="dto" class="com.DongGu.board.FreeBoardDTO"></jsp:useBean>


<!-- 
자유게시판은 본문이 지워지면 전부 삭제.
댓글인 경우 마지막 댓글은 그냥 지우고
댓글이 달린 댓글은 삭제된 댓글입니다. 나머지 전부 지움	 -->
<%
String f_num = request.getParameter("f_num");

dto.setF_num(Integer.parseInt(f_num) );

int result =dao.deleteFreeBoard(dto);
if(result>=1){
%>
	<script>
	window.alert('삭제완료!');
	window.location.href="/DongGu/free/FreeBoard.jsp";
	</script>
<%
}
else{
	%>
	<script>
	window.alert('[오류] 삭제실패!');
	window.location.href="/DongGu/free/FreeBoard.jsp";
	</script>
<%
}
%>



