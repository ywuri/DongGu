<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
</head>
<body>
<%@include file="Header.jsp" %>

<div id="FreeBoardDivTitle"><img src="img/paw-solid.svg" class="FreeBoardTitleImg"> 자 유 게 시 판 <img src="img/paw-solid.svg" class="FreeBoardTitleImg"></div>

<div>
	<table id="FreeBoardTable">
		<thead>
			<tr>
				<td colspan="4" id="FindDongGuTagButton"  >
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
			<tr>
				<td><a href='DetailFreeBoard.jsp?q_num=1' class="FreeBoardA">강아지 키우신지 얼마나 됐나요??</a><span class="FreeBoardComment">(1)</span></td>
				<td>멍구맹구</td>
				<td>3</td>
				<td>24.07.31</td>
			</tr>
			
			<tr>
				<td><a href='DetailFreeBoard.jsp?q_num=1' class="FreeBoardA">오늘 고양이 입양받았습니다</a><span class="FreeBoardComment">(55)</span></td>
				<td>냥냥이</td>
				<td>15</td>
				<td>24.07.29</td>
			</tr>
			
			<tr>
				<td><a href='DetailFreeBoard.jsp?q_num=1' class="FreeBoardA">우리 초코가 산책을 너무 좋아해요..</a><span class="FreeBoardComment">(3)</span></td>
				<td>초코촠코</td>
				<td>5</td>
				<td>24.07.22</td>
			</tr>
			
			<tr>
				<td><a href='DetailFreeBoard.jsp?q_num=1' class="FreeBoardA">강아지 키우신지 얼마나 됐나요??</a><span class="FreeBoardComment">(13)</span></td>
				<td>멍구맹구</td>
				<td>3</td>
				<td>24.07.31</td>
			</tr>
			
			<tr>
				<td><a href='DetailFreeBoard.jsp?q_num=1' class="FreeBoardA">오늘 고양이 입양받았습니다</a><span class="FreeBoardComment"></span></td>
				<td>냥냥이</td>
				<td>15</td>
				<td>24.07.29</td>
			</tr>
			
			<tr>
				<td><a href='DetailFreeBoard.jsp?q_num=1' class="FreeBoardA">우리 초코가 산책을 너무 좋아해요..</a><span class="FreeBoardComment">(60)</span></td>
				<td>초코촠코</td>
				<td>5</td>
				<td>24.07.22</td>
			</tr>
			
		
			
			<!-- //만약 게시글이 없다면
			<tr>
				<td>게시글이 없습니다</td>
			</tr>
			 -->
		</tbody>
		
		<tfoot>
				<tr> 
					<td colspan="4">
						<input class="FreeBoardButton" id="FreeBoardTableButton" type="button" value="글쓰기"  onclick="location.href='WriteFreeBoard.jsp';">
					</td>
				</tr>
				
				<tr>
					<td colspan="4" align="center">
							<input class="FreeBoardButton" type="button" value="이전"  onclick="location.href='#;">
							&nbsp;&nbsp;<a href="#" class="FreeBoardPageNum">1</a>&nbsp;&nbsp;
							&nbsp;&nbsp;<a href="#" class="FreeBoardPageNum">2</a>&nbsp;&nbsp;
							&nbsp;&nbsp;<a href="#" class="FreeBoardPageNum">3</a>&nbsp;&nbsp;
							&nbsp;&nbsp;<a href="#" class="FreeBoardPageNum">4</a>&nbsp;&nbsp;
							&nbsp;&nbsp;<a href="#" class="FreeBoardPageNum">5</a>&nbsp;&nbsp;
							<input class="FreeBoardButton" type="button" value="다음"  onclick="location.href=#;">
					</td>
				</tr>
		</tfoot>
	</table>
	

</div>
	
	
<%@include file="Footer.jsp" %>

</body>
</html>