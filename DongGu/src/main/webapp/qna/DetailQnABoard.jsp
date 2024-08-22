<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>  
<%@ page import="com.DongGu.board.QnABoardDAO" %>    
<%@ page import="com.DongGu.board.QnABoardDTO" %>     
<%@ page import="java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>  
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">

</head>
<body>
<jsp:useBean id="dao" class="com.DongGu.board.QnABoardDAO"></jsp:useBean>
<jsp:useBean id="dto" class="com.DongGu.board.QnABoardDTO"></jsp:useBean>
<%
int q_num = Integer.parseInt(request.getParameter("q_num")) ;
QnABoardDTO qdto = dao.getQnABoardDetail(q_num);
//게시글 상세 내용 가져오기

int cp;
if(request.getParameter("cp")==null){
	cp=1;
}
else{
	cp = Integer.parseInt( request.getParameter("cp"));
}

String q_id = request.getParameter("q_id");
String sid = (String)session.getAttribute("sid");

int isWishList =-2;
if(sid!=null ){
	//sid와 글번호로 해당 게시글 위시리스트에 있는지 확인
	isWishList = dao.isWishList(q_num,sid);
}

ArrayList<QnABoardDTO> array = null;
array = dao.getNextQnABoard(q_num);



%>


<%@include file="../SubHeader.jsp" %>
<div id="BoardMargin">
	<div>
		<div id="WriteFreeBoardMainDiv">
			<div id="DetailBoardSubject" ><a href="/DongGu/qna/QnABoard.jsp" class="DetailBoardSubject">QnA 게시판 ></a></div>
			<%
				if(q_id.equals(" ")){
					%>
					<div id="DetailBoardTitle" style="color:#808080;">
						<img style="width:28px; padding-right:10px;" src="/DongGu/img/icon_trash.svg"><%=qdto.getQ_title()%></div>
					<%
				}
				else{
					%>
					<div id="DetailBoardTitle" ><%=qdto.getQ_title()%></div>
					<%
				}
			%>
			<div id="DetailBoardInfo" >
				<div style="width:700px;">
					작성자 : <%=qdto.getQ_nickname()%>(<%=qdto.getQ_id()%>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					작성날짜 : <%=qdto.getQ_date().substring(0, 16)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					조회:<%=qdto.getQ_vcnt()%>
				</div>
				<div >
					<form name="wishListForm" action="QnAWishList.jsp"  id="wishListForm">
					<input type="hidden" name="q_id" value="<%=q_id %>">
					<input type="hidden" name="q_num" value="<%=q_num %>">
					<input type="hidden" name="cp" value="<%=cp %>">
					<%
					if(isWishList==1){
						%>
						<input type="image" id="wishHeart" class="heartIconSize" src="/DongGu/img/heart_full.svg">
						<%
					}else if(isWishList==0){
						%>
						<input type="image" id="wishHeart" class="heartIconSize" src="/DongGu/img/heart_empty.svg" >
						<%
					}else{
						
					}
					%>
					</form>
					
				</div>
			</div>
			
			<div id="WriteFreeBoardContentDiv">
				<div id="DetailQnABoardContentDiv" ><%=qdto.getQ_content().replaceAll("\n", "<br>") %></div>
			</div>
			<%
				if(!q_id.equals(" ")){
					%>
					<input class="FreeBoardButton" id="ReWriteButton" type="button" value="답글쓰기"  onclick="location.href='/DongGu/qna/ReWriteQnABoard.jsp?q_title=<%=qdto.getQ_title()%>&q_ref=<%=qdto.getQ_ref() %>&q_lev=<%=qdto.getQ_lev() %>&q_sunbun=<%=qdto.getQ_sunbun() %>';">
			<%
				}
			%>
			
			<%
				if(q_id.equals(sid)){
					%>
					<input class="FreeBoardButton" id="ReWriteButton" type="button" value="수정하기"  onclick="location.href='/DongGu/qna/UpdateQnABoard.jsp?q_num=<%=q_num %>';">
					<input class="FreeBoardButton" id="ReWriteButton" type="button" value="삭제하기"  onclick="location.href='/DongGu/qna/DeleteQnABoard.jsp?q_num=<%=q_num %>&q_ref=<%=qdto.getQ_ref() %>&q_lev=<%=qdto.getQ_lev() %>&q_sunbun=<%=qdto.getQ_sunbun() %>';">
					<%
				}
			%>
			
			<input class="FreeBoardButton" id="FreeBoardTableButton" type="button" value="뒤로가기"  onclick="location.href='/DongGu/qna/QnABoard.jsp?cp=<%=cp %>';">
			<%-- QnABoard.jsp?cp=<%=cp %> --%>
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
			if(array.get(0).getQ_num()>q_num){
				%>
				<div class="QnABoardNextBeforeSizeDiv QnABoardMarginDiv">
					<p><span class="QnABoardNextBeforeSpan">다음</span> <a href="/DongGu/qna/DetailQnABoard.jsp?q_id=<%=q_id%>&q_num=<%=array.get(0).getQ_num()%>&cp=<%=cp%>"><%=array.get(0).getQ_title() %> </a></p>
				</div>
				<%
			}
			//전글
			else if(array.get(0).getQ_num()<q_num){
				%>
				<div class="QnABoardNextBeforeSizeDiv QnABoardMarginDiv">
					<p><span class="QnABoardNextBeforeSpan">이전</span>  <a href="/DongGu/qna/DetailQnABoard.jsp?q_id=<%=q_id%>&q_num=<%=array.get(0).getQ_num()%>&cp=<%=cp%>"><%=array.get(0).getQ_title() %> </a></p>
				</div>
				<%
			}
		}
		else if(array.size()==2){
			
			if(array.get(0).getQ_num() >array.get(1).getQ_num() ){
			%>
			<div class="QnABoardNextBeforeSizeDiv QnABoardTopMarginDiv">
				<p><span class="QnABoardNextBeforeSpan">다음</span>  <a href="/DongGu/qna/DetailQnABoard.jsp?q_id=<%=q_id%>&q_num=<%=array.get(0).getQ_num()%>&cp=<%=cp%>"><%=array.get(0).getQ_title() %></a></p> 
			</div>
			<div class="QnABoardBottomMarginDiv">
				<p><span class="QnABoardNextBeforeSpan">이전</span>  <a href="/DongGu/qna/DetailQnABoard.jsp?q_id=<%=q_id%>&q_num=<%=array.get(1).getQ_num()%>&cp=<%=cp%>"><%=array.get(1).getQ_title() %> </a></p>
			</div>
			<%
			}
			else{
				%>
				<div class="QnABoardNextBeforeSizeDiv QnABoardTopMarginDiv">
					<p><span class="QnABoardNextBeforeSpan">다음</span>  <a href="/DongGu/qna/DetailQnABoard.jsp?q_id=<%=q_id%>&q_num=<%=array.get(1).getQ_num()%>&cp=<%=cp%>"><%=array.get(1).getQ_title() %> </a></p>
				</div>
				<div class="QnABoardNextBeforeSizeDiv QnABoardBottomMarginDiv ">
					<p><span class="QnABoardNextBeforeSpan">이전</span>  <a href="/DongGu/qna/DetailQnABoard.jsp?q_id=<%=q_id%>&q_num=<%=array.get(0).getQ_num()%>&cp=<%=cp%>"><%=array.get(0).getQ_title() %> </a></p>
				</div>
				<%
			}
		}
		%>
		
	</div>
<%@include file="../Footer.jsp" %>

</body>
<script>
//위시리스트 되면 색깔 바꾸기
document.getElementById('wishHeart').addEventListener('click', function(event) {
    event.preventDefault(); // 폼 자동 제출 방지

    var heartIcon = document.getElementById('wishHeart');
    
    if (heartIcon.src.includes('heart_empty.svg')) {
        heartIcon.src = '/DongGu/img/heart_full.svg'; // 색이 채워진 하트 이미지로 변경
    } else {
        heartIcon.src = '/DongGu/img/heart_empty.svg'; // 빈 하트 이미지로 변경
    }


    document.getElementById('wishListForm').submit(); // 폼 제출
});
</script>

</html>