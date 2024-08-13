<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="qdto" class="com.DongGu.board.NoticeDTO"></jsp:useBean>
<jsp:useBean id="qdao" class="com.DongGu.board.NoticeDAO"></jsp:useBean>

<%
qdto.setN_content(request.getParameter("n_content"));
qdto.setN_title(request.getParameter("n_title"));

//여기에 현재 세션에서 아이디 가져오기
//여기에 현재 세션에서 닉네임 가져오기
qdto.setN_id((String)session.getAttribute("sid"));
qdto.setN_nickname((String)session.getAttribute("snickname"));

int result = qdao.WriteNotice(qdto);

//오류
if(result==0){
	%>
	<script>
	window.alert('[오류] 작성실패');
	window.location.href="/DongGu/notice/Notice.jsp";
	</script>
<%
}else if(result>=1){
	%>
	<script>
	window.alert('작성완료!');
	window.location.href="/DongGu/notice/Notice.jsp";
	</script>
<%
}
%>