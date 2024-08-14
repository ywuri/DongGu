<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>  
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">


<style>


</style>

</head>
<body>
<%@include file="Header.jsp" %>

<div id="FreeBoardDivTitle"><img src="img/paw-solid.svg" class="FreeBoardTitleImg"> 동 구 구 해 요 <img src="img/paw-solid.svg" class="FreeBoardTitleImg"></div>

<div>
	
	
	<table id="FreeBoardTable">
		<thead>
			<tr>
				<td colspan="5" id="FindDongGuTagButton" >
					<div class="FindDongGuSearchDiv">
						<input type="button" class="FreeBoardButton FindDongGuTagButton" value="동구" onclick="location.href='#;">
						<input type="button" class="FreeBoardButton FindDongGuTagButton" value="냥구" onclick="location.href='#;">
						<input type="button" class="FreeBoardButton FindDongGuTagButton" value="칭구" onclick="location.href='#;">
					
						<form name="FreeBoardForm" class="FreeBoardForm">
							<div id="FreeBoardFormDiv">
								<select name="" id="FreeBoardFormSelect">
									<option value="">제목</option>
									<option value="">내용</option>
									<option value="">작성자</option>
								</select>
								<input type="text" id="FreeBoardSearch">
								<input class="FreeBoardButton" id="FreeBoardFormSubmit" type="submit" value="검색">
							</div>
						</form>
					</div>
				</td>
				
		<!-- 		<td colspan="3" id="FreeBoardFormTd">
					
				</td> -->

			</tr>
			
			<tr>
				<th>동구들</th>
				<th>제목</th>
				<th>작성자</th>
				<th>지원자수</th>
				<th>작성날짜</th>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td>동구</td>
				<td><a href="/DongGu/DetailDongGu.jsp" class="FreeBoardA">우리 멍멍이 동구해주실 분</a></td>
				<td>멍구맹구</td>
				<td>3</td>
				<td>24.07.31</td>
			</tr>
			
			<tr>
				<td>냥구</td>
				<td><a href="/DongGu/DetailDongGu.jsp" class="FreeBoardA">고양이 하루만 부탁해요</a></td>
				<td>냥냥이</td>
				<td>15</td>
				<td>24.07.29</td>
			</tr>
			
			<tr>
				<td>동구</td>
				<td><a href=# class="FreeBoardA">우리 초코 1시간 산책해주실분</a></td>
				<td>초코촠코</td>
				<td>5</td>
				<td>24.07.22</td>
			</tr>
			
			<tr>
				<td>냥구</td>
				<td><a href=# class="FreeBoardA">고양이 간식좀 챙겨주세요</a></td>
				<td>멍구맹구</td>
				<td>3</td>
				<td>24.07.31</td>
			</tr>
			
			<tr>
				<td>멍구</td>
				<td><a href=# class="FreeBoardA">강아지 일주일 맡아주실분</a></td>
				<td>냥냥이</td>
				<td>15</td>
				<td>24.07.29</td>
			</tr>
			
			<tr>
				<td>칭구</td>
				<td><a href=# class="FreeBoardA">앵무새 밥만 주세요ㅠㅠㅠ</a></td>
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
					<td colspan="5"><input class="FreeBoardButton" id="FreeBoardTableButton" type="button" value="글쓰기"  onclick="location.href='#;"></td>
				</tr>
				
				<tr>
					<td colspan="5" align="center">
							<input class="FreeBoardButton" type="button" value="이전"  onclick="location.href='#;">
							&nbsp;&nbsp;<a href="#" class="FreeBoardPageNum">1</a>&nbsp;&nbsp;
							&nbsp;&nbsp;<a href="#" class="FreeBoardPageNum">2</a>&nbsp;&nbsp;
							&nbsp;&nbsp;<a href="#" class="FreeBoardPageNum">3</a>&nbsp;&nbsp;
							&nbsp;&nbsp;<a href="#" class="FreeBoardPageNum">4</a>&nbsp;&nbsp;
							&nbsp;&nbsp;<a href="#" class="FreeBoardPageNum">5</a>&nbsp;&nbsp;
							<input class="FreeBoardButton" type="button" value="다음"  onclick="location.href='#;">
					</td>
				</tr>
		</tfoot>
	</table>
	

</div>
	
	
<%@include file="Footer.jsp" %>

</body>
</html>