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
			<h3>초 대 장</h3>
			<table>
				<tr>
					<th>초대제목</th>
					<td>
						<input type="text" name="" id="" value="" class="saveWS250">
					</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>
						<input type="date" name="" id="" value="" class="saveWS100"> ~ 
						<input type="date" name="" id="" value="" class="saveWS100">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<select name="" id="" class="saveWS250">
							<option value="">콩나</option>
							<option value="">숑이</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>동물</th>
					<td>
						<select name="" id="" class="saveWS250">
							<option value="D">강아지</option>
							<option value="C">고양이</option>
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
					<th>자택종류</th>
					<td>
						<input type="text" name="" id="" value="" class="saveWS250" placeholder="단독주택, 아파트, 빌라">
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="" id="" value="" class="saveWS250"></td>
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
						
					</td>
				</tr>
				<tr>
					<th>알레르기</th>
					<td><input type="text" name="" id="" value="" class="saveWS250"></td>
				</tr>
				<tr>
					<th>병력사항</th>
					<td><input type="text" name="" id="" value="" class="saveWS250"></td>
				</tr>
				<tr>
					<th>주의사항</th>
					<td>
						<textarea class="saveWS100p saveHS100" placeholder="동구가 주의해야 할 점을 적어주세요. (안는 걸 싫어합니다, 손을 내밀면 할퀼 수 있으니 조심해주세요.)"></textarea>
					</td>
				</tr>
				<tr>
					<th>추가내용</th>
					<td>
						<textarea class="saveWS100p saveHS100" placeholder="추가할 내용을 적어주세요."></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" name="" id="" value="초대하기" class="saveBtnOne">
		</div>
		
	</form>	
	
<%@include file="Footer.jsp" %>

</body>
</html>