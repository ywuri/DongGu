<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>   
<%@ page import="java.sql.Date.*" %>   
<%@ page import="java.time.format.*" %>   
<%@ page import="java.time.*" %>  
<%@ page import="com.DongGu.board.NoticeDAO" %>    
<%@ page import="com.DongGu.board.NoticeDTO" %>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>  
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
</head>
<body>

<jsp:useBean id="dao" class="com.DongGu.board.NoticeDAO"></jsp:useBean>
<%

	String cp_s = request.getParameter("cp");//현재 페이지 
	if(cp_s==null || cp_s.equals("")) cp_s="1";
	int cp = Integer.parseInt(cp_s);

	int listSize = 10; // 한 페이지에 표시할 게시물 수
	int pageSize =5; // 페이지 버튼을 그룹으로 묶을 수 (예: 1~5 페이지 버튼).
	
	
	//리스트갖고오기
	ArrayList<NoticeDTO> array = new ArrayList<>();
	array = dao.getNoticeList(cp,listSize);
	
	int totalCnt=dao.getNoticeCnt(); // 총 게시물 수
	
	int totalPage = totalCnt%listSize==0 ? (totalCnt/listSize):(totalCnt/listSize)+1;//총 페이지수

	//사용자 현재 위치 그룹(3이면 1쪽)
	int userGroup = (cp/pageSize)+1;
	if(cp%pageSize==0)  userGroup = userGroup-1;
	
	
%>

<%@include file="../SubHeader.jsp" %>

<div id="FreeBoardDivTitle"><img src="/DongGu/img/paw-solid.svg" class="FreeBoardTitleImg"> 공 지 사 항 <img src="/DongGu/img/paw-solid.svg" class="FreeBoardTitleImg"></div>

<div>
	<table id="FreeBoardTable">
		<thead>
		
			<tr>
				<td colspan="4" id="FindDongGuTagButton">
					<form name="FreeBoardForm" action="SearchNotice.jsp" >
						<div id="FreeBoardFormDiv" class="FreeBoardFormDivCenter">
							<select name="search_type" id="FreeBoardFormSelect">
								<option value="n_title">제목</option>
								<option value="n_content">내용</option>
							</select>
							<input name="search_word" type="text" id="FreeBoardSearch">
							<input  class="FreeBoardButton" id="FreeBoardFormSubmit" type="submit" value="검색">
						</div>
					</form>
				</td>

			</tr>
			<tr>
				<th id="QnABoardWidthTitle">제목</th>
				<th id="QnABoardWidthWriter">작성자</th>
				<th id="QnABoardWidthVcnt">조회수</th>
				<th id="QnABoardWidthDate">작성날짜</th>
			</tr>
		</thead>
		
		<tbody>
			
			<%
			if(array!=null){
				for(int i=0;i<array.size();i++){
					
				%>
				<tr>
					<% 
					if(array.get(i).getN_id().equals(" ")){
						%>
						<td id="QnABoardTitle"><a style="color:#808080" href='/DongGu/notice/DetailNotice.jsp?n_id=<%=array.get(i).getN_id() %>&n_num=<%=array.get(i).getN_num() %>&cp=<%=cp %>' class="FreeBoardA QnABoardMarginleft" >
						<img style="width:12px;" src="/DongGu/img/icon_trash.svg">
					<%
					}
					else{
						%>
						<td id="NoticeTitleCenter"><a href='/DongGu/notice/DetailNotice.jsp?n_id=<%=array.get(i).getN_id() %>&n_num=<%=array.get(i).getN_num() %>&cp=<%=cp %>' class="FreeBoardA QnABoardMarginleft" >
						<%
					}
					
						for(int j =0;j<array.get(i).getN_lev();j++){
							%>&nbsp;&nbsp;<%
						}
						%>
						<%=array.get(i).getN_title() %>
					</a><span class="FreeBoardComment"></span></td>
					
					<td><%=array.get(i).getN_nickname() %></td>
					<td><%=array.get(i).getN_vcnt() %></td>
					<td><%=array.get(i).getN_date() %>
					</td>
				</tr>
				<%
				}
			}
			%>
		
			<%
			if(totalCnt==0){
				%>
				<!-- //만약 게시글이 없다면 -->
				<tr >
					<td colspan="4"  style="text-align:center;">공지사항이 없습니다</td>
				</tr>
				<%
			}
			%>
			
		</tbody>
		
		<tfoot>
				<tr> 
					<%
					if("admin".equals(session.getAttribute("sid"))){
						%>
						<td colspan="4"><input class="FreeBoardButton" id="FreeBoardTableButton" type="button" value="글쓰기"  onclick="location.href='/DongGu/notice/WriteNotice.jsp';"></td>
						<%
					}
					%>
					</tr>
				
				<tr>
					<td colspan="4" align="center">
						
						<%
						if(totalCnt!=0){
							if(userGroup>1 ){
								%>
									<input class="FreeBoardButton" type="button" value="이전"  
									onclick="location.href='/DongGu/notice/Notice.jsp?cp=<%=(userGroup-1)*pageSize  %>';">
								<%
								}
							for(int i=(userGroup-1)*pageSize+1;i<=(userGroup-1)*pageSize+pageSize ;i++){
								if(cp==i){
									%>
									&nbsp;&nbsp;<a href="/DongGu/notice/Notice.jsp?cp=<%=i %>" class="FreeBoardPageNum" style="color:red;"><%=i %></a>&nbsp;&nbsp;
								<%
								}else{
								%>
									&nbsp;&nbsp;<a href="/DongGu/notice/Notice.jsp?cp=<%=i %>" class="FreeBoardPageNum"><%=i %></a>&nbsp;&nbsp;
								<%
								}
								if(i==totalPage) break;
								
							}
							%>
							
							<%
							if( userGroup != totalPage/pageSize+(totalPage%pageSize==0?0:1)  ){
								%>
									<input class="FreeBoardButton" type="button" value="다음"  
									onclick="location.href='/DongGu/notice/Notice.jsp?cp=<%= (userGroup+1)*pageSize- (pageSize-1)%>';">
								<%
								}
						}
						
						%>
						
						
					</td>
				</tr>
		</tfoot>
	</table>
	
</div>
	
	
<%@include file="../Footer.jsp" %>

</body>
</html>