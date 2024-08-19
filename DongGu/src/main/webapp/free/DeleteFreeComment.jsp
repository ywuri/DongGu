<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dao" class="com.DongGu.board.FreeBoardDAO"></jsp:useBean>
<jsp:useBean id="dto" class="com.DongGu.board.FreeCommentDTO"></jsp:useBean>


<!-- 
댓글인 경우 qna처럼
하위가 있으면 삭제된 댓글입니다로 변경
그리고 대댓글 안됨. 

삭제된 댓글
ㄴㅎㅎㅎㅎ
이상태면 ㅎㅎㅎ에 댓글가능-->
<%
String fc_num = request.getParameter("fc_num");
int fc_num_int = Integer.parseInt(fc_num);

//fc_renum이 0이면서 내가 갖고있는 fc_num이랑 같은 값을 갖은 fc_ref가 두개이상이면(하나는 자신)
//삭제된 댓글입니다로 수정 후 작성자도 '' 
//사진도 있으면 ''로

//만약 저게 아예 아니라면 

int result =dao.deleteComment(fc_num_int);
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



