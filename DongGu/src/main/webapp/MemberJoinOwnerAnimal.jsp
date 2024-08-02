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
			<h3>동물친구 정보를 입력해주세요!</h3>
			<table>
				<tr>
					<th>종류</th>
					<td>
						<select name="">
							<option value="">강아지</option>
							<option value="">고양이</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>품종</th>
					<td>
						<select name="" id="" class="saveWS250">
							<option value="">시츄</option>
							<option value="">말티즈</option>
							<option value="">푸들</option>
							<option value="">불독</option>
							<option value="">리트리버</option>
						</select>
						<!-- 
						<select name="" id="" class="saveWS250">
							<option value="">러시안블루</option>
							<option value="">먼치킨</option>
							<option value="">페르시안</option>
						</select>
						 -->
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="" id="" value="" class="saveWS250">
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="" id="" value="" class=""><label for="">남자</label>
						<input type="radio" name="" id="" value="" class=""><label for="">여자</label>
					</td>
				</tr>
				<tr>
					<th>사진</th>
					<td>
						<input type="file" name="" id="" value="" class="saveWS250">
					</td>
				</tr>
				<tr>
					<th>생년</th>
					<td>
						<input type="text" name="" id="" value="" class="saveWS250">
					</td>
				</tr>
				<tr>
					<th>성격</th>
					<td>
						<input type="button" class="saveBtnTypeClick_1" value="성격1" onclick="">
						<input type="button" class="saveBtnType_1" value="성격2" onclick="">
						<input type="button" class="saveBtnType_1" value="성격3" onclick="">
						<input type="button" class="saveBtnType_1" value="성격4" onclick="">
						<input type="button" class="saveBtnType_1" value="성격5" onclick="">
						<p/>
						<input type="button" class="saveBtnType_1" value="성격6" onclick="">
						<input type="button" class="saveBtnType_1" value="성격7" onclick="">
						<input type="button" class="saveBtnType_1" value="성격8" onclick="">
						<input type="button" class="saveBtnType_1" value="성격9" onclick="">
						<input type="button" class="saveBtnType_1" value="성격10" onclick="">
						<p/>
						<input type="button" class="saveBtnType_1" value="기타" onclick="">
						<input type="text" name="" id="" value="" class="saveWS100">
					</td>
				</tr>
				<tr>
					<th>알레르기</th>
					<td>
						<input type="text" name="" id="" value="" class="saveWS250">
					</td>
				</tr>
				<tr>
					<th>병력사항</th>
					<td>
						<input type="text" name="" id="" value="" class="saveWS250">
					</td>
				</tr>
				<tr>
					<th>주의사항</th>
					<td>
						<textarea></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" name="" id="" value="동물친구정보 입력완료!" class="saveBtnOne">
		</div>
		
	</form>	
	
<%@include file="Footer.jsp" %>

</body>
</html>