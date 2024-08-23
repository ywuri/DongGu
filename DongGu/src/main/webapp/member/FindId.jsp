<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
<script>
	
	function findAct(){
		var pwCheckText = "{이름}님의 아이디는 ~~~~ 입니다.";
		document.getElementById('findTextBox').innerHTML = pwCheckText;
		
		document.getElementById('find_box').style.display = 'none';
		document.getElementById('findActBox').style.display = 'block';
	}
</script>

</head>
<body>
	<%@include file="/SubHeader.jsp"%>
	<form name="">
		<div class="saveTableTwo m180_auto_80" id="find_box">
			<h3 class="saveTitle">아이디 찾기</h3>
			<div class="stt_box">
				<table>
					<tr>
						<th>이름</th>
						<td>
							<input type="text" name="" id="" value="" class="saveWS250">
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<input type="text" name="" id="" maxlength="3" value="" class="saveWS100">							
							 - <input type="text" name="" id="" maxlength="4" value="" class="saveWS100">							
							 - <input type="text" name="" id="" maxlength="4" value="" class="saveWS100"> 
						</td>
					</tr>
				</table>
				<div class="saveWS100p tac mt20 ">
					<input type="button" name="" id="" value="아이디 찾기" class="saveBtnOne" onclick="findAct()">
				</div>
			</div>
		
		</div>
	
		<div class="saveTableTwo m180_auto_80" id="findActBox" style="display:none;">
			
			<h3 class="saveTitle">아이디 찾기</h3>
			<div class="stt_box tac" id="findTextBox">
			</div>
			<div class="saveWS100p tac stt_box2">
				<input type="button" name="" id="" value="로그인" class="saveBtnOne" onclick="location.href='login.jsp'">
				<input type="button" name="" id="" value="비밀번호 찾기" class="saveBtnOne ml20" onclick="location.href='FindPw.jsp'">
			</div>
		</div>
	</form>	
	<%@include file="/Footer.jsp"%>
</body>
</html>