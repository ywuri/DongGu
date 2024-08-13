<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="qdto" class="com.DongGu.board.NoticeDTO"></jsp:useBean>
<jsp:useBean id="qdao" class="com.DongGu.board.NoticeDAO"></jsp:useBean>

<%
//System.out.println(request.getParameter("n_num"));
qdto.setN_content(request.getParameter("n_content"));
qdto.setN_title(request.getParameter("n_title"));
qdto.setN_num(Integer.parseInt(request.getParameter("n_num")));


int result = qdao.updateNotice(qdto);

//오류
if(result==0){
	%>
	<script>
	window.alert('[오류] 수정실패');
	window.location.href="/DongGu/notice/Notice.jsp";
	</script>
<%
}else if(result>=1){
	%>
	<script>
	window.alert('수정완료!');
	window.location.href="/DongGu/notice/Notice.jsp";
	</script>
<%
}
%>