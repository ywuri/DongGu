<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>   
<%@ page import="java.time.format.*" %>   
<%@ page import="java.time.*" %>  
<%@ page import="com.DongGu.board.FreeBoardDAO" %>    
<%@ page import="com.DongGu.board.FreeBoardDTO" %>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>  
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
</head>
<body>

<jsp:useBean id="dao" class="com.DongGu.board.FreeBoardDAO"></jsp:useBean>
<%

	String cp_s = request.getParameter("cp");//현재 페이지 
	if(cp_s==null || cp_s.equals("")) cp_s="1";
	int cp = Integer.parseInt(cp_s);

	int listSize = 10; // 한 페이지에 표시할 게시물 수
	int pageSize =5; // 페이지 버튼을 그룹으로 묶을 수 (예: 1~5 페이지 버튼).
	
	
	//리스트갖고오기
	ArrayList<FreeBoardDTO> array = new ArrayList<>();
	array = dao.getFreeBoardList(cp,listSize);
	
	int totalCnt=dao.getFreeBoardCnt(); // 총 게시물 수
	
	int totalPage = totalCnt%listSize==0 ? (totalCnt/listSize):(totalCnt/listSize)+1;//총 페이지수

	//사용자 현재 위치 그룹(3이면 1쪽)
	int userGroup = (cp/pageSize)+1;
	if(cp%pageSize==0)  userGroup = userGroup-1;
	
	
%>

<%@include file="../SubHeader.jsp" %>

<div id="FreeBoardDivTitle"><img src="/DongGu/img/paw-solid.svg" class="FreeBoardTitleImg"> 자 유 게 시 판 <img src="/DongGu/img/paw-solid.svg" class="FreeBoardTitleImg"></div>

<div>
	<table id="FreeBoardTable">
		<thead>
		
			<tr>
				<td colspan="4" id="FindDongGuTagButton">
					<form name="FreeBoardForm" action="SearchFreeBoard.jsp" >
						<div id="FreeBoardFormDiv" class="FreeBoardFormDivCenter">
							<select name="search_type" id="FreeBoardFormSelect">
								<option value="f_title">제목</option>
								<option value="f_content">내용</option>
								<option value="f_nickname">닉네임</option>
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
					if(array.get(i).getF_id().equals(" ")){
						%>
						<td id="QnABoardTitle"><a style="color:#808080" href='/DongGu/free/DetailFreeBoard.jsp?f_id=<%=array.get(i).getF_id() %>&f_num=<%=array.get(i).getF_num() %>&cp=<%=cp %>' class="FreeBoardA QnABoardMarginleft" >
						<img style="width:12px;" src="/DongGu/img/icon_trash.svg">
					<%
					}
					else{
						%>
						<td id="QnABoardTitle"><a href='/DongGu/free/DetailFreeBoard.jsp?f_id=<%=array.get(i).getF_id() %>&f_num=<%=array.get(i).getF_num() %>&cp=<%=cp %>' class="FreeBoardA QnABoardMarginleft" >
						<%
					}
					
						for(int j =0;j<array.get(i).getF_lev();j++){
							%>&nbsp;&nbsp;<%
						}
						%>
						<%=array.get(i).getF_title() %>
					</a><span class="FreeBoardComment"></span></td>
					
					<td><%=array.get(i).getF_nickname() %></td>
					<td><%=array.get(i).getF_vcnt() %></td>
					<td>
						<%
						DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				        LocalDateTime dateTime = LocalDateTime.parse(array.get(i).getF_date(), formatter);
				        LocalDateTime now = LocalDateTime.now();
				        Duration duration = Duration.between(dateTime, now);

				        // 차이 계산
				        long minutes = duration.toMinutes();
				        long hours = duration.toHours();
				        long days = duration.toDays();
				        long weeks = days / 7;

				        String result;

				        if (weeks > 0) {
				            DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
				            result = dateTime.format(dateFormatter);
				        } else if (days > 0) {
				            result = days + "일 전";
				        } else if (hours > 0) {
				            result = hours + "시간 전";
				        } else if (minutes > 0) {
				            result = minutes + "분 전";
				        } else {
				            result = "방금 전";
				        }
						%>
						<%=result %>
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
					<td colspan="4"  style="text-align:center;">게시글이 없습니다</td>
				</tr>
				<%
			}
			%>
			
		</tbody>
		
		<tfoot>
				<tr> 
					<td colspan="4"><input class="FreeBoardButton" id="FreeBoardTableButton" type="button" value="글쓰기"  onclick="location.href='/DongGu/free/WriteFreeBoard.jsp';"></td>
				</tr>
				
				<tr>
					<td colspan="4" align="center">
						
						<%
						if(totalCnt!=0){
							if(userGroup>1 ){
								%>
									<input class="FreeBoardButton" type="button" value="이전"  
									onclick="location.href='/DongGu/free/FreeBoard.jsp?cp=<%=(userGroup-1)*pageSize  %>';">
								<%
								}
							for(int i=(userGroup-1)*pageSize+1;i<=(userGroup-1)*pageSize+pageSize ;i++){
								if(cp==i){
									%>
									&nbsp;&nbsp;<a href="/DongGu/free/FreeBoard.jsp?cp=<%=i %>" class="FreeBoardPageNum" style="color:red;"><%=i %></a>&nbsp;&nbsp;
								<%
								}else{
								%>
									&nbsp;&nbsp;<a href="/DongGu/free/FreeBoard.jsp?cp=<%=i %>" class="FreeBoardPageNum"><%=i %></a>&nbsp;&nbsp;
								<%
								}
								if(i==totalPage) break;
								
							}
							%>
							
							<%
							if( userGroup != totalPage/pageSize+(totalPage%pageSize==0?0:1)  ){
								%>
									<input class="FreeBoardButton" type="button" value="다음"  
									onclick="location.href='/DongGu/free/FreeBoard.jsp?cp=<%= (userGroup+1)*pageSize- (pageSize-1)%>';">
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