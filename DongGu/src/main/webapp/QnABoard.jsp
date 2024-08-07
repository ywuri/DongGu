<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.sql.Date" %>    
<%@ page import="com.DongGu.board.QnABoardDAO" %>    
<%@ page import="com.DongGu.board.QnABoardDTO" %>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>  
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
</head>
<body>

<jsp:useBean id="dao" class="com.DongGu.board.QnABoardDAO"></jsp:useBean>
<%

	String cp_s = request.getParameter("cp");//현재 페이지 
	if(cp_s==null || cp_s.equals("")) cp_s="1";
	int cp = Integer.parseInt(cp_s);

	int listSize = 5; // 한 페이지에 표시할 게시물 수
	int pageSize =5; // 페이지 버튼을 그룹으로 묶을 수 (예: 1~5 페이지 버튼).
	
	//리스트갖고오기
	ArrayList<QnABoardDTO> array = new ArrayList<>();
	array = dao.getQnABoardList(cp,listSize);
	
	int totalCnt=dao.getQnABoardCnt(); // 총 게시물 수
	
	int totalPage = totalCnt%listSize==0 ? (totalCnt/listSize):(totalCnt/listSize)+1;//총 페이지수

	//사용자 현재 위치 그룹(3이면 1쪽)
	int userGroup = (cp/pageSize)+1;
	if(cp%pageSize==0)  userGroup = userGroup-1;


	
/*  	System.out.println("totalCnt ="+totalCnt);
	System.out.println("cp ="+cp);
	System.out.println("totalPage ="+totalPage);
	System.out.println("userGroup ="+userGroup); 
	System.out.println("arraysize ="+array.size());  */
%>

<%@include file="Header.jsp" %>

<div id="FreeBoardDivTitle"><img src="img/paw-solid.svg" class="FreeBoardTitleImg"> Q n A 게 시 판 <img src="img/paw-solid.svg" class="FreeBoardTitleImg"></div>

<div>
	<table id="FreeBoardTable">
		<thead>
		
			<tr>
				<td colspan="4" id="FindDongGuTagButton">
					<form name="FreeBoardForm" >
						<div id="FreeBoardFormDiv" class="FreeBoardFormDivCenter">
							<select name="" id="FreeBoardFormSelect">
								<option value="">제목</option>
								<option value="">내용</option>
								<option value="">작성자</option>
							</select>
							<input type="text" id="FreeBoardSearch">
							<input class="FreeBoardButton" id="FreeBoardFormSubmit" type="submit" value="검색">
						</div>
					</form>
				</td>

			</tr>
			<tr>
				<th id="FreeBoardTableTitle">제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성날짜</th>
			</tr>
		</thead>
		
		<tbody>
			
			<%
			if(array!=null){
				for(int i=0;i<array.size();i++){
				%>
				<tr>
					<td><a href='DetailQnABoard.jsp?q_num=<%=array.get(i).getQ_num() %>&cp=<%=cp %>' class="FreeBoardA"><%=array.get(i).getQ_title() %></a><span class="FreeBoardComment"></span></td>
					<td><%=array.get(i).getQ_nickname() %></td>
					<td><%=array.get(i).getQ_vcnt() %></td>
					<td><%=array.get(i).getQ_date() %></td>
				</tr>
				<%
				}
			}
			%>
		
			<%
			if(totalCnt==0){
				%>
				<!-- //만약 게시글이 없다면 -->
				<tr>
					<td>게시글이 없습니다</td>
				</tr>
				<%
			}
			%>
			
			
		</tbody>
		
		<tfoot>
				<tr> 
					<td colspan="4"><input class="FreeBoardButton" id="FreeBoardTableButton" type="button" value="글쓰기"  onclick="location.href='WriteQnABoard.jsp';"></td>
				</tr>
				
				<tr>
					<td colspan="4" align="center">
						
						<%
						if(totalCnt!=0){
							if(userGroup>1 ){
								%>
									<input class="FreeBoardButton" type="button" value="이전"  
									onclick="location.href='QnABoard.jsp?cp=<%=(userGroup-1)*pageSize  %>';">
								<%
								}
							for(int i=(userGroup-1)*pageSize+1;i<=(userGroup-1)*pageSize+pageSize ;i++){
								if(cp==i){
									%>
									&nbsp;&nbsp;<a href="QnABoard.jsp?cp=<%=i %>" class="FreeBoardPageNum" style="color:red;"><%=i %></a>&nbsp;&nbsp;
								<%
								}else{
								%>
									&nbsp;&nbsp;<a href="QnABoard.jsp?cp=<%=i %>" class="FreeBoardPageNum"><%=i %></a>&nbsp;&nbsp;
								<%
								}
								if(i==totalPage) break;
								
							}
							%>
							
							<%
							if( userGroup != totalPage/pageSize+(totalPage%pageSize==0?0:1)  ){
								%>
									<input class="FreeBoardButton" type="button" value="다음"  
									onclick="location.href='QnABoard.jsp?cp=<%= (userGroup+1)*pageSize- (pageSize-1)%>';">
								<%
								}
						}
						
						%>
						
						
					</td>
				</tr>
		</tfoot>
	</table>
	
</div>
	
	
<%@include file="Footer.jsp" %>

</body>
</html>