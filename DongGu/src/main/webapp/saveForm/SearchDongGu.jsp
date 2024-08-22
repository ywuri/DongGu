<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.sql.Date" %>      
<%@ page import="java.time.format.*" %>   
<%@ page import="java.time.*" %>  

<%@ page import="com.DongGu.friend.InviteDAO" %>    
<%@ page import="com.DongGu.friend.InviteDTO" %>        
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>  
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
</head>
<body>

<jsp:useBean id="dao" class="com.DongGu.friend.InviteDAO"></jsp:useBean>
<%

	String cp_s = request.getParameter("cp");//현재 페이지 
	if(cp_s==null || cp_s.equals("")) cp_s="1";
	int cp = Integer.parseInt(cp_s);

	int listSize = 5; // 한 페이지에 표시할 게시물 수
	int pageSize =5; // 페이지 버튼을 그룹으로 묶을 수 (예: 1~5 페이지 버튼).
	
	
	//리스트갖고오기
	String search_type=request.getParameter("search_type");
	String search_word=request.getParameter("search_word");
	
	String search_type_kor="";
	if("i_title".equals(search_type)){
		search_type_kor="제목";
	}
	else if("o_nickname".equals(search_type)){
		search_type_kor="닉네임";
	}
	//System.out.println("search_type_kor "+search_type_kor);
	//System.out.println("search_word "+search_word);
	
	ArrayList<InviteDTO> array = new ArrayList<>();
	array = dao.searchInvite(search_type, search_word,cp,listSize);
	
	int totalCnt=dao.getInviteCnt(search_type,search_word); // 총 게시물 수
	
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

<%@include file="../SubHeader.jsp" %>

<div id="FreeBoardDivTitle"> 초대장 검색결과 </div>

<div>
	<table id="FreeBoardTable">
		<thead>
		
			<tr>
				<td colspan="5" id="searchTitle" >
					<%=search_type_kor %>으로 <%=search_word %>를 검색한 결과입니다.
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
						<a href='/DongGu/saveForm/DetailDongGu.jsp?i_num=<%=array.get(i).getI_num() %>&cp=<%=cp %>&o_id=<%=array.get(i).getO_id()%>' class="FreeBoardA QnABoardMarginleft" >
						 
						<%=array.get(i).getI_title() %>
						</a><span class="FreeBoardComment"></span>
					</td>
					
					<td><%=array.get(i).getO_nickname() %></td>
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
				<tr>
					<td colspan="4">검색결과가 없습니다.</td>
				</tr>
				<%
			}
			%>
			
			
		</tbody>
		
		<tfoot>
				<tr> 
					<td colspan="5"><input class="FreeBoardButton" id="FreeBoardTableButton" type="button" value="돌아가기"  onclick="location.href='/DongGu/saveForm/FindDongGu.jsp';"></td>
				</tr>
				
				<tr>
					<td colspan="5" align="center">
						
						<%
						if(totalCnt!=0){
							if(userGroup>1 ){
								%>
									<input class="FreeBoardButton" type="button" value="이전"  
									onclick="location.href='/DongGu/saveForm/SearchDongGu.jsp?cp=<%=(userGroup-1)*pageSize  %>&search_word=<%=search_word%>&search_type=<%=search_type%>';">
								<%
								}
							for(int i=(userGroup-1)*pageSize+1;i<=(userGroup-1)*pageSize+pageSize ;i++){
								if(cp==i){
									%>
									&nbsp;&nbsp;<a href="/DongGu/saveForm/SearchDongGu.jsp?cp=<%=i %>&search_word=<%=search_word%>&search_type=<%=search_type%>" class="FreeBoardPageNum" style="color:red;"><%=i %></a>&nbsp;&nbsp;
								<%
								}else{
								%>
									&nbsp;&nbsp;<a href="/DongGu/saveForm/SearchDongGu.jsp?cp=<%=i %>&search_word=<%=search_word%>&search_type=<%=search_type%>" class="FreeBoardPageNum"><%=i %></a>&nbsp;&nbsp;
								<%
								}
								if(i==totalPage) break;
								
							}
							%>
							
							<%
							if( userGroup != totalPage/pageSize+(totalPage%pageSize==0?0:1)  ){
								%>
									<input class="FreeBoardButton" type="button" value="다음"  
									onclick="location.href='/DongGu/saveForm/SearchDongGu.jsp?cp=<%= (userGroup+1)*pageSize- (pageSize-1)%>&search_word=<%=search_word%>&search_type=<%=search_type%>';">
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