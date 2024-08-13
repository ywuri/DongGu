<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>  
<%@ page import="com.DongGu.board.NoticeDAO" %>    
<%@ page import="com.DongGu.board.NoticeDTO" %>     
<%@ page import="java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>  
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">

</head>
<body>
<jsp:useBean id="dao" class="com.DongGu.board.NoticeDAO"></jsp:useBean>
<jsp:useBean id="dto" class="com.DongGu.board.NoticeDTO"></jsp:useBean>
<%
int n_num = Integer.parseInt(request.getParameter("n_num")) ;
NoticeDTO qdto = dao.getNoticeDetail(n_num);
//게시글 상세 내용 가져오기

int cp;
if(request.getParameter("cp")==null){
	cp=1;
}
else{
	cp = Integer.parseInt( request.getParameter("cp"));
}

String n_id = request.getParameter("n_id");
String sid = (String)session.getAttribute("sid");



ArrayList<NoticeDTO> array = null;
array = dao.getNextNotice(n_num);



%>


<%@include file="../SubHeader.jsp" %>
<div id="BoardMargin">
	<div>
		<div id="WriteFreeBoardMainDiv">
			<div id="DetailBoardSubject" ><a href="/DongGu/notice/Notice.jsp" class="DetailBoardSubject">공지사항 게시판 ></a></div>
			<div id="DetailBoardTitle" ><%=qdto.getN_title()%></div>
			<div id="DetailBoardInfo" style="display:flex;">
				<div style="width:700px;">
					작성자 : <%=qdto.getN_nickname()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					작성날짜 : <%=qdto.getN_date()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					조회:<%=qdto.getN_vcnt()%>
				</div>
				
			</div>
			
			<div id="WriteFreeBoardContentDiv">
				<div id="DetailQnABoardContentDiv" ><%=qdto.getN_content().replaceAll("\n", "<br>") %></div>
			</div>
			
			<%
				if("admin".equals(sid)){
					%>
					<input class="FreeBoardButton" id="ReWriteButton" type="button" value="수정하기"  onclick="location.href='/DongGu/notice/UpdateNotice.jsp?n_num=<%=n_num %>';">
					<input class="FreeBoardButton" id="ReWriteButton" type="button" value="삭제하기"  onclick="location.href='/DongGu/notice/DeleteNotice.jsp?n_num=<%=n_num %>&n_ref=<%=qdto.getN_ref() %>&n_lev=<%=qdto.getN_lev() %>&n_sunbun=<%=qdto.getN_sunbun() %>';">
					<%
				}
			%>
			
			<input class="FreeBoardButton" id="FreeBoardTableButton" type="button" value="뒤로가기"  onclick="location.href='/DongGu/notice/Notice.jsp?cp=<%=cp %>';">
			<%-- Notice.jsp?cp=<%=cp %> --%>
		</div>
	</div>
	
</div>
	<div>
		<% 
		// 이 게시물이 유일한거라면 아무것도 안함
		if(array==null||array.size()==0){
			
		}
		//한 게시글만 있어서 다음 또는 이전글만 있다면
		else if(array.size()==1){
			
			//만약 갖고온글이 다음 글이라면?
			if(array.get(0).getN_num()>n_num){
				%>
				<div class="QnABoardNextBeforeSizeDiv QnABoardMarginDiv">
					<p><span class="QnABoardNextBeforeSpan">다음</span> <a href="/DongGu/notice/DetailNotice.jsp?n_id=<%=n_id%>&n_num=<%=array.get(0).getN_num()%>&cp=<%=cp%>"><%=array.get(0).getN_title() %> </a></p>
				</div>
				<%
			}
			//전글
			else if(array.get(0).getN_num()<n_num){
				%>
				<div class="QnABoardNextBeforeSizeDiv QnABoardMarginDiv">
					<p><span class="QnABoardNextBeforeSpan">이전</span>  <a href="/DongGu/notice/DetailNotice.jsp?n_id=<%=n_id%>&n_num=<%=array.get(0).getN_num()%>&cp=<%=cp%>"><%=array.get(0).getN_title() %> </a></p>
				</div>
				<%
			}
		}
		else if(array.size()==2){
			
			if(array.get(0).getN_num() >array.get(1).getN_num() ){
			%>
			<div class="QnABoardNextBeforeSizeDiv QnABoardTopMarginDiv">
				<p><span class="QnABoardNextBeforeSpan">다음</span>  <a href="/DongGu/notice/DetailNotice.jsp?n_id=<%=n_id%>&n_num=<%=array.get(0).getN_num()%>&cp=<%=cp%>"><%=array.get(0).getN_title() %></a></p> 
			</div>
			<div class="QnABoardBottomMarginDiv">
				<p><span class="QnABoardNextBeforeSpan">이전</span>  <a href="/DongGu/notice/DetailNotice.jsp?n_id=<%=n_id%>&n_num=<%=array.get(1).getN_num()%>&cp=<%=cp%>"><%=array.get(1).getN_title() %> </a></p>
			</div>
			<%
			}
			else{
				%>
				<div class="QnABoardNextBeforeSizeDiv QnABoardTopMarginDiv">
					<p><span class="QnABoardNextBeforeSpan">다음</span>  <a href="/DongGu/notice/DetailNotice.jsp?n_id=<%=n_id%>&n_num=<%=array.get(1).getN_num()%>&cp=<%=cp%>"><%=array.get(1).getN_title() %> </a></p>
				</div>
				<div class="QnABoardNextBeforeSizeDiv QnABoardBottomMarginDiv ">
					<p><span class="QnABoardNextBeforeSpan">이전</span>  <a href="/DongGu/notice/DetailNotice.jsp?n_id=<%=n_id%>&n_num=<%=array.get(0).getN_num()%>&cp=<%=cp%>"><%=array.get(0).getN_title() %> </a></p>
				</div>
				<%
			}
		}
		%>
		
	</div>
<%@include file="../Footer.jsp" %>

</body>


</html>