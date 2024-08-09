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

	<form name="DoWrite" action="">
	<!-- 
	<form name="DoWrite" action="DoWrite_ok.jsp">
	 -->
	
		초대장번호<input type="text" name="" id="" value="1" class="saveWS250">
		
		<div class="saveTableOne">
			<h3>지 원 할 래 요!</h3>
			<table>
				<tr>
					<th>지원제목</th>
					<td>
						<input type="text" name="" id="" value="" class="saveWS250">
						얘기 후 저장하는 곳에 추가 필요
					</td>
				<tr>
					<th>성별</th>
					<td>
						남자/여자
					</td>
				</tr>
				<tr>
					<th>흡연여부</th>
					<td>
						흡연/비흡연
					</td>
				</tr>
				<tr>
					<th>사진</th>
					<td>
						사진
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						주소
					</td>
				</tr>
				<tr>
					<th>반려경험</th>
					<td>
						반려경험
					</td>
				</tr>
				<tr>
					<th>동구경험</th>
					<td>
						동구경험
					</td>
				</tr>
				<tr>
					<th>기타경험</th>
					<td>
						기타경험
					</td>
				</tr>
				<tr>
					<th>추가내용</th>
					<td>
						<textarea class="saveWS100p saveHS100" name="ap_content" placeholder="추가할 내용을 적어주세요."></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" name="" id="" value="지원하기" class="saveBtnOne">
		</div>
		
	</form>	
	
<%@include file="Footer.jsp" %>

</body>
</html>