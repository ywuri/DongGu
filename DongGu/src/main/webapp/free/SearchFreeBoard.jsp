<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.sql.Date" %>    
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

	int listSize = 5; // 한 페이지에 표시할 게시물 수
	int pageSize =5; // 페이지 버튼을 그룹으로 묶을 수 (예: 1~5 페이지 버튼).
	
	
	//리스트갖고오기
	String search_type=request.getParameter("search_type");
	String search_word=request.getParameter("search_word");
	
	String search_type_kor="";
	if("q_title".equals(search_type)){
		search_type_kor="제목";
	}
	else if("q_content".equals(search_type)){
		search_type_kor="내용";
	}
	else if("q_nickname".equals(search_type)){
		search_type_kor="닉네임";
	}
	//System.out.println("search_type_kor "+search_type_kor);
	//System.out.println("search_word "+search_word);
	
	ArrayList<FreeBoardDTO> array = new ArrayList<>();
	array = dao.searchFreeBoard(search_type, search_word,cp,listSize);
	
	int totalCnt=dao.getFreeBoardCnt(search_type,search_word); // 총 게시물 수
	
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

<div id="FreeBoardDivTitle"> 자유게시판 검색결과 </div>

<div>
	<table id="FreeBoardTable">
		<thead>
		
			<tr>
				<td colspan="4" id="searchTitle" >
					<%=search_type_kor %>으로 <%=search_word %>를 검색한 결과입니다.
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
					<td><a href='/DongGu/free/DetailFreeBoard.jsp?f_id=<%= array.get(i).getF_id()%>&f_num=<%=array.get(i).getF_num() %>&cp=<%=cp %>' class="FreeBoardA"><%=array.get(i).getF_title() %></a><span class="FreeBoardComment"></span></td>
					<td><%=array.get(i).getF_nickname() %></td>
					<td><%=array.get(i).getF_vcnt() %></td>
					<td><%=array.get(i).getF_date() %></td>
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
					<td colspan="4"><input class="FreeBoardButton" id="FreeBoardTableButton" type="button" value="돌아가기"  onclick="location.href='/DongGu/free/FreeBoard.jsp';"></td>
				</tr>
				
				<tr>
					<td colspan="4" align="center">
						
						<%
						if(totalCnt!=0){
							if(userGroup>1 ){
								%>
									<input class="FreeBoardButton" type="button" value="이전"  
									onclick="location.href='/DongGu/free/SearchFreeBoard.jsp?cp=<%=(userGroup-1)*pageSize  %>&search_word=<%=search_word%>&search_type=<%=search_type%>';">
								<%
								}
							for(int i=(userGroup-1)*pageSize+1;i<=(userGroup-1)*pageSize+pageSize ;i++){
								if(cp==i){
									%>
									&nbsp;&nbsp;<a href="/DongGu/free/SearchFreeBoard.jsp?cp=<%=i %>&search_word=<%=search_word%>&search_type=<%=search_type%>" class="FreeBoardPageNum" style="color:red;"><%=i %></a>&nbsp;&nbsp;
								<%
								}else{
								%>
									&nbsp;&nbsp;<a href="/DongGu/free/SearchFreeBoard.jsp?cp=<%=i %>&search_word=<%=search_word%>&search_type=<%=search_type%>" class="FreeBoardPageNum"><%=i %></a>&nbsp;&nbsp;
								<%
								}
								if(i==totalPage) break;
								
							}
							%>
							
							<%
							if( userGroup != totalPage/pageSize+(totalPage%pageSize==0?0:1)  ){
								%>
									<input class="FreeBoardButton" type="button" value="다음"  
									onclick="location.href='/DongGu/free/SearchFreeBoard.jsp?cp=<%= (userGroup+1)*pageSize- (pageSize-1)%>&search_word=<%=search_word%>&search_type=<%=search_type%>';">
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