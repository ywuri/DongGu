<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">

<script>
	function id_duplicateCheck(){
		window.open('IdCheck.jsp','idCheck','width=450,height=300');
	}
	
	function nick_duplicateCheck(){
		window.open('NickName.jsp','NickName','width=450,height=300');
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
<%@include file="/SubHeader.jsp" %>

	<form name="MemberJoinOwner" action="MemberJoinOwner_ok.jsp" method="post">
	
		<div class="saveTableOne">
			<h3>고용자 가입하기</h3>
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="o_id" id="" value="" class="saveWS250" readonly>
						<input type="button" name="" id="" value="아이디 중복검사" class="btnType1" onclick="id_duplicateCheck()">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" name="o_pwd" id="pw1" value="" class="saveWS250" placeholder="8자리 이상 + 문자와 숫자를 조합해주세요.">
					</td>
				</tr>
				<tr>
					<th>비밀번호확인</th>
					<td>
						<input type="password" name="o_pwd" id="pw2" value="" class="saveWS250" placeholder="8자리 이상 + 문자와 숫자를 조합해주세요." onkeyup="pwCheck()">
						<span id="pwText" class="dpib"></span>
					</td>
				</tr>
				<tr>
					<th>비밀번호 찾기 질문</th>
					<td>
						<select name="q_num" class="saveWS260">
							<option value="">질문1</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>비밀번호 찾기 답</th>
					<td>
						<input type="text" name="q_answer" id="" value="" class="saveWS250">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="o_name" id="" value="" class="saveWS250">
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="o_gender" id="o_gender1" value="1" class=""><label for="o_gender1">남자</label>
						<input type="radio" name="o_gender" id="o_gender2" value="2" class=""><label for="o_gender2">여자</label>
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" name="o_nickname" id="" value="" class="saveWS250" readonly>
						<input type="button" name="" id="" value="닉네임 중복검사" class="btnType1" onclick="nick_duplicateCheck()">
					</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>
						<input type="text" name="o_tel1" id="" value="" class="saveWS40"> - 
						<input type="text" name="o_tel2" id="" value="" class="saveWS60"> - 
						<input type="text" name="o_tel3" id="" value="" class="saveWS60">
					</td>
				</tr>
				<tr>
					<th>거주지</th>
					<td>
						<input type="text" name="o_addr1" id="" value="" class="saveWS250" placeholder="기본주소">
						<input type="text" name="o_addr2" id="" value="" class="saveWS250" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td>
						<input type="text" name="o_jumin1" id="" value="" class="saveWS60"> - 
						<input type="text" name="o_jumin2" id="" value="" class="saveWS60">
					</td>
				</tr>
				<tr>
					<th>자택종류</th>
					<td>
						<input type="text" name="o_house" id="" value="" class="saveWS250" placeholder="단독주택, 아파트, 빌라">
					</td>
				</tr>
			</table>
			<input type="submit" name="" id="" value="동구구해요! 고용자 가입하기" class="saveBtnOne">
		</div>
		
	</form>	
	
<%@include file="/Footer.jsp" %>

</body>
</html>