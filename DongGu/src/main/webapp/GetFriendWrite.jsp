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

	<form name="getWrite" action="GetWrite_ok.jsp">
	
		<div class="saveTableOne">
			<h3>초 대 장</h3>
			<table>
				<tr>
					<th>초대제목</th>
					<td>
						<input type="text" name="i_title" id="" value="" class="saveWS250">
					</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>
						<input type="date" name="i_start" id="" value="" class="saveWS100"> ~ 
						<input type="date" name="i_end" id="" value="" class="saveWS100">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<select name="ai_num" id="" class="saveWS250">
							<option value="1">콩나</option>
							<option value="2">숑이</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>동물</th>
					<td>
						동물이름선택에 따른 동물 값(강아지 고양이 중 하나)
					</td>
				</tr>
				<tr>
					<th>품종</th>
					<td>
						동물이름선택에 따른 품종 값(시츄, 말티즈, 푸들 중 하나)
					</td>
				</tr>
				<tr>
					<th>사진</th>
					<td>동물이름선택후 동물사진</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						동물이름선택후 고용자의 주소
					</td>
				</tr>
				<tr>
					<th>자택종류</th>
					<td>
						동물이름선택후 고용자의 자택종류
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>동물이름선택후 동물의 생년월일</td>
				</tr>
				<tr>
					<th>성격</th>
					<td>
						동물이름선택후 동물의 성격
						<input type="button" class="saveBtnTypeClick_2" value="성격1" onclick="">
						<input type="button" class="saveBtnTypeClick_2" value="성격3" onclick="">
						<input type="button" class="saveBtnTypeClick_2" value="성격4" onclick="">
						
					</td>
				</tr>
				<tr>
					<th>알레르기</th>
					<td>동물이름선택후 동물의 알레르기</td>
				</tr>
				<tr>
					<th>병력사항</th>
					<td>동물이름선택후 동물의 병력사항</td>
				</tr>
				<tr>
					<th>주의사항</th>
					<td>
						동물이름선택후 동물의 주의사항
					</td>
				</tr>
				<tr>
					<th>추가내용</th>
					<td>
						<textarea class="saveWS100p saveHS100" placeholder="추가할 내용을 적어주세요." name="i_content"></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" name="" id="" value="초대하기" class="saveBtnOne">
		</div>
		
	</form>	
	
<%@include file="Footer.jsp" %>

</body>
</html>