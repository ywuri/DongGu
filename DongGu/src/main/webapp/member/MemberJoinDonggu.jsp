<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">

<script>
	function duplicateCheck(){
		window.open('IdCheck.jsp','idCheck','width=450,height=300');
	}
	
	function pwCheck(){
		//var pwCheckText = "유효성검사";
		//document.getElementById('pwText').innerHTML = pwCheckText;
		
		var pwCheckValue1 = document.getElementById('pw1').value;
		var pwCheckValue2 = document.getElementById('pw2').value;
		
		var pwText = document.getElementById('pwText');

		//var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_]).{8,20}$/;
		//비밀번호 유효성 검사식 : 영문자 소문자와 숫자가 하나씩은 포함되어야한다.
		var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,20}$/;

		if (passwordRegex.test(pwCheckValue1)) {
			if (pwCheckValue1 === pwCheckValue2) {
				pwText.innerHTML = '비밀번호가 일치하며 유효합니다.';
				pwText.style.color = 'green';
			}else{
				pwText.innerHTML = '비밀번호가 일치하지 않습니다.';
				pwText.style.color = 'red';
			}
		}else{
			pwText.innerHTML = '비밀번호는 최소 8자에서 20자까지, 영문자, 숫자를 포함해야 합니다.';
			pwText.style.color = 'red';
		}
	}
</script>

</head>
<body>
<%@include file="/Header.jsp" %>

	<form name="">
	
		<div class="saveTableOne">
			<h3>구직자 가입하기</h3>
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="" id="" value="" class="saveWS250" readonly>
						<input type="button" name="" id="" value="아이디 중복검사" class="btnType1" onclick="duplicateCheck()">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="" id="pw1" value="" class="saveWS250" placeholder="8자리 이상 + 문자와 숫자를 조합해주세요.">
					</td>
				</tr>
				<tr>
					<th>비밀번호확인</th>
					<td>
						<input type="password" name="" id="pw2" value="" class="saveWS250" placeholder="8자리 이상 + 문자와 숫자를 조합해주세요." onkeyup="pwCheck()">
						<span id="pwText" class="dpib"></span>
					</td>
				</tr>
				<tr>
					<th>비밀번호 찾기 질문</th>
					<td>
						<select name="" class="saveWS250">
							<option value="">질문1</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>비밀번호 찾기 답</th>
					<td>
						<input type="text" name="" id="" value="" class="saveWS250">
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
					<th>흡연여부</th>
					<td>
						<input type="radio" name="" id="" value="" class=""><label for="">흡연</label>
						<input type="radio" name="" id="" value="" class=""><label for="">비흡연</label>
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" name="" id="" value="" class="saveWS250">
						<input type="button" name="" id="" value="닉네임 중복검사" class="btnType1" onclick="duplicateCheck()">
					</td>
				</tr>
				<tr>
					<th>사진</th>
					<td>
						<input type="file" name="" id="" value="" class="saveWS250">
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input type="text" name="" id="" value="" class="saveWS40"> - 
						<input type="text" name="" id="" value="" class="saveWS60"> - 
						<input type="text" name="" id="" value="" class="saveWS60">
					</td>
				</tr>
				<tr>
					<th>거주지</th>
					<td>
						<input type="text" name="" id="" value="" class="saveWS250" placeholder="기본주소">
						<input type="text" name="" id="" value="" class="saveWS250" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td>
						<input type="text" name="" id="" value="" class="saveWS60"> - 
						<input type="text" name="" id="" value="" class="saveWS60">
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
			</table>
			<input type="submit" name="" id="" value="동구할래요! 구직자 가입하기" class="saveBtnOne">
		</div>
		
	</form>	
	
<%@include file="/Footer.jsp" %>

</body>
</html>