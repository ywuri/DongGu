<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>   
<%@ page import="java.sql.Date.*" %>   
<%@ page import="java.time.format.*" %>   
<%@ page import="java.time.*" %>  
<%@ page import="com.DongGu.friend.FriendDAO" %>    
<%@ page import="com.DongGu.friend.InviteDTO" %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>  
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
<jsp:useBean id="dao" class="com.DongGu.friend.FriendDAO"></jsp:useBean>

<style>


</style>

</head>
<body>
<%

	String cp_s = request.getParameter("cp");//현재 페이지 
	if(cp_s==null || cp_s.equals("")) cp_s="1";
	int cp = Integer.parseInt(cp_s);

	int listSize = 5; // 한 페이지에 표시할 게시물 수
	int pageSize =5; // 페이지 버튼을 그룹으로 묶을 수 (예: 1~5 페이지 버튼).
	
	
	//동구냥구칭구 버튼 눌렀는지
	int int_dongNang=0;
	if(request.getParameter("int_dongNang")!=null && !("").equals(request.getParameter("int_dongNang").trim())){
		int_dongNang=Integer.parseInt(request.getParameter("int_dongNang"));
	}
	
	//리스트갖고오기
	ArrayList<InviteDTO> array = new ArrayList<>();
	array = dao.getInviteList(cp,listSize,int_dongNang);
	
	int totalCnt=-1;
	if(int_dongNang==0){
		totalCnt = dao.getInviteCnt(); // 총 게시물 수
	}
	else{
		totalCnt=array.size();
	}
	//int totalCnt=array.size(); // 총 게시물 수
	
	
	
	int totalPage = totalCnt%listSize==0 ? (totalCnt/listSize):(totalCnt/listSize)+1;//총 페이지수
	//int totalPage = totalCnt%listSize==0 ? (totalCnt/listSize):(totalCnt/listSize)+1;//총 페이지수

	//사용자 현재 위치 그룹(3이면 1쪽)
	int userGroup = (cp/pageSize)+1;
	if(cp%pageSize==0)  userGroup = userGroup-1;
	
	
	//이름 눌렀을 때 마이페이지로 이동시키게
	//필요한것, 이게 고용자인기 구직인지(usertype), 그리고 해당 아이디(id),그리고 매칭을 위해 i_num번호
	//(cp,listSize,int_dongNang)
%>

<%@include file="../SubHeader.jsp" %>

<div id="FreeBoardDivTitle">
<%
if(int_dongNang==0){
	%> 동 구 구 해 요 <%	
}
else if(int_dongNang==1){
	%> 멍 구 해 요 <%	
}
else if(int_dongNang==2){
	%> 냥 구 해 요 <%	
}
else if(int_dongNang==3){
	%> 칭 구 해 요 <%	
}
%>
</div>

<div>
	
	<table id="FreeBoardTable">
		<thead>
			<tr>
				<td colspan="5" id="FindDongGuTagButton" >
					<div class="FindDongGuSearchDiv">
						<input type="button" class="FreeBoardButton FindDongGuTagButton" value="멍구" onclick="location.href='/DongGu/saveForm/FindDongGu.jsp?int_dongNang=1';">
						<input type="button" class="FreeBoardButton FindDongGuTagButton" value="냥구" onclick="location.href='/DongGu/saveForm/FindDongGu.jsp?int_dongNang=2';">
						<input type="button" class="FreeBoardButton FindDongGuTagButton" value="칭구" onclick="location.href='/DongGu/saveForm/FindDongGu.jsp?int_dongNang=3';">
					
						<form name="FreeBoardForm" class="FreeBoardForm" action="/DongGu/saveForm/SearchDongGu.jsp">
							<div id="FreeBoardFormDiv">
								<select name="search_type" id="FreeBoardFormSelect">
									<option value="i_title">제목</option>
									<option value="o_nickname">작성자</option>
								</select>
								<input type="text" id="FreeBoardSearch" name="search_word">
								<input class="FreeBoardButton" id="FreeBoardFormSubmit" type="submit" value="검색">
							</div>
						</form>
						
					
					</div>
				</td>
			</tr>
			
			<tr>
				<th style="width:10%;">동구들</th>
				<th id="QnABoardWidthTitle">제목</th>
				<th id="QnABoardWidthWriter">작성자</th>
				<th id="QnABoardWidthVcnt">지원자수</th>
				<th id="QnABoardWidthDate" style="width:20%;">작성날짜</th>
			</tr>
		</thead>
		
		<tbody>
			
					
			<%
			
			if(array!=null){
				for(int i=0;i<array.size();i++){
					
				%>
				<tr>
					<td><%=array.get(i).getDongNang() %></td>
					<td id="NoticeTitleCenter"> 
						<a href='/DongGu/saveForm/DetailDongGu.jsp?i_num=<%=array.get(i).getI_num() %>&cp=<%=cp %>&o_id=<%=array.get(i).getO_id() %>' class="FreeBoardA QnABoardMarginleft" >
						<%=array.get(i).getI_title() %>
						</a><span class="FreeBoardComment"></span>
					</td>
					
					<td><a href="/DongGu/member/MemberDetail.jsp?usertype=0&o_id=<%=array.get(i).getO_id() %>" class="linkDeco"><%=array.get(i).getO_nickname() %></a></td>
					<td><%=array.get(i).getDoCnt() %>명</td>
					<td><%
						DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
				        LocalDateTime dateTime = LocalDateTime.parse(array.get(i).getI_date(), formatter);
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
					<td colspan="5"  style="text-align:center;">초대장이 없습니다</td>
				</tr>
				<%
			}
			%>
			
		</tbody>
		
		
		<tfoot>
			<tr>
				<td colspan="5" align="center" style="padding-top:15px;">
				<%
				if(totalCnt!=0){
					if(userGroup>1 ){
						%>
							<input class="FreeBoardButton" type="button" value="이전"  
							onclick="location.href='/DongGu/saveForm/FindDongGu.jsp?cp=<%=(userGroup-1)*pageSize  %>';">
						<%
						}
					for(int i=(userGroup-1)*pageSize+1;i<=(userGroup-1)*pageSize+pageSize ;i++){
						if(cp==i){
							%>
							&nbsp;&nbsp;<a href="/DongGu/saveForm/FindDongGu.jsp?cp=<%=i %>" class="FreeBoardPageNum" style="color:red;"><%=i %></a>&nbsp;&nbsp;
						<%
						}else{
						%>
							&nbsp;&nbsp;<a href="/DongGu/saveForm/FindDongGu.jsp?cp=<%=i %>" class="FreeBoardPageNum"><%=i %></a>&nbsp;&nbsp;
						<%
						}
						if(i==totalPage) break;
						
					}
					%>
					
					<%
					if( userGroup != totalPage/pageSize+(totalPage%pageSize==0?0:1)  ){
						%>
							<input class="FreeBoardButton" type="button" value="다음"  
							onclick="location.href='/DongGu/saveForm/FindDongGu.jsp?cp=<%= (userGroup+1)*pageSize- (pageSize-1)%>';">
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