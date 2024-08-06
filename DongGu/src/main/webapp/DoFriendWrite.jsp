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
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="" id="" value="" class=""><label for="">남자</label>
						<input type="radio" name="" id="" value="" class=""><label for="">여자</label>
					</td>
				</tr>
				<tr>
					<th>흡연여부</th>
					<td>
						<input type="radio" name="" id="" value="" class=""><label for="">흡연</label>
						<input type="radio" name="" id="" value="" class=""><label for="">비흡연</label>
					</td>
				</tr>
				<tr>
					<th>사진</th>
					<td><input type="file" name="" id="" value="" class="saveWS250"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name="" id="" value="" class="saveWS250" placeholder="기본주소">
						<input type="text" name="" id="" value="" class="saveWS250" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<th>반려경험</th>
					<td>
						<textarea class="saveWS100p saveHS100" placeholder="본인의 반려경험을 적어주세요."></textarea>
					</td>
				</tr>
				<tr>
					<th>동구경험</th>
					<td>
						<textarea class="saveWS100p saveHS100" placeholder="타인의 반려동물을 돌봐본 경험을 적어주세요."></textarea>
					</td>
				</tr>
				<tr>
					<th>기타경험</th>
					<td>
						<textarea class="saveWS100p saveHS100" placeholder="기타 경험을 적어주세요."></textarea>
					</td>
				</tr>
				<tr>
					<th>추가내용</th>
					<td>
						<textarea class="saveWS100p saveHS100" placeholder="추가할 내용을 적어주세요."></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" name="" id="" value="지원하기" class="saveBtnOne">
		</div>
		
	</form>	
	
<%@include file="Footer.jsp" %>

</body>
</html>