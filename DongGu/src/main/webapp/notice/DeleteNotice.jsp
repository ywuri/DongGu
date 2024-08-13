<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="dao" class="com.DongGu.board.NoticeDAO"></jsp:useBean>
<jsp:useBean id="dto" class="com.DongGu.board.NoticeDTO"></jsp:useBean>


<%
String n_num = request.getParameter("n_num");
String n_ref = request.getParameter("n_ref");
String n_lev = request.getParameter("n_lev");
String n_sunbun = request.getParameter("n_sunbun");

dto.setN_num(Integer.parseInt(n_num) );
dto.setN_ref(Integer.parseInt(n_ref));
dto.setN_lev(Integer.parseInt(n_lev));
dto.setN_sunbun(Integer.parseInt(n_sunbun));

int result =dao.deleteNotice(dto);
if(result>=1){
%>
	<script>
	window.alert('삭제완료!');
	window.location.href="/DongGu/notice/Notice.jsp";
	</script>
<%
}
else{
	%>
	<script>
	window.alert('[오류] 삭제실패!');
	window.location.href="/DongGu/notice/Notice.jsp";
	</script>
<%
}
%>



