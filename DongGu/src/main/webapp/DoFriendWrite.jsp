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

	<form name="">
	
		<div class="saveTableOne">
			<h3>지 원 할 래 요!</h3>
			<table>
				<tr>
					<th>지원제목</th>
					<td>
						<input type="text" name="" id="" value="" class="saveWS250">
					</td>
				</tr>
				<tr>
					<th>지원자이름/닉네임</th>
					<td><input type="text" name="" id="" value="" class="saveWS250"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<select name="" id="" class="saveWS250">
							<option value="">남자</option>
							<option value="">여자</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>흡연여부</th>
					<td>
						<select name="" id="" class="saveWS250">
							<option value="">흡연</option>
							<option value="">비흡연</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>사진</th>
					<td><input type="file" name="" id="" value="" class="saveWS250"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="" id="" value="" class="saveWS250"></td>
				</tr>
				
				
				
				<tr>
					<th>반려경험</th>
					<td>
						<textarea class="saveWS250"></textarea>
					</td>
				</tr>
				<tr>
					<th>동구경험</th>
					<td>
						<textarea class="saveWS250"></textarea>
					</td>
				</tr>
				<tr>
					<th>기타경험</th>
					<td>
						<textarea class="saveWS250"></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" name="" id="" value="지원하기" class="saveBtnOne">
		</div>
		
	</form>	
	
<%@include file="Footer.jsp" %>

</body>
</html>