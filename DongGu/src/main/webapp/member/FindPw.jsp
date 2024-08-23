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
		var pwCheckText = "{이름}님의 비밀번호는 ~~~~ 입니다.";
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
			<h3 class="saveTitle">비밀번호 찾기</h3>
			<div class="stt_box">
				<table>
					<tr>
						<th>비밀번호 찾기 질문</th>
						<td>
							<select name="" class="saveWS260">
								<option value="">질문1</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>비밀번호 찾기 답</th>
						<td>
							<input type="text" name="" id="" value="" class="saveWS300">
						</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" name="" id="" value="" class="saveWS300">
						</td>
					</tr>
				</table>
				<div class="saveWS100p tac mt20 ">
					<input type="button" name="" id="" value="비밀번호 찾기" class="saveBtnOne" onclick="findAct()">
				</div>
			</div>
		
		</div>
	
		<div class="saveTableTwo m180_auto_80" id="findActBox" style="display:none;">
			
			<h3 class="saveTitle">비밀번호 찾기</h3>
			<div class="stt_box tac" id="findTextBox">
			</div>
			<div class="saveWS100p tac stt_box2">
				<input type="button" name="" id="" value="로그인" class="saveBtnOne" onclick="location.href='login.jsp'">
			</div>
		</div>
	</form>	
	<%@include file="/Footer.jsp"%>
</body>





<body>
	<h1 class="mt100">
		<a href="/DongGu/Index.jsp"><img src="/DongGu/img/logo.png" alt="logo"></a>
	</h1>

	<div class="saveTableOne margin_tbtype1">
		<h3>비밀번호 찾기</h3>
		<form name="">
			<table>
				<tr>
					<th>비밀번호 찾기 질문</th>
					<td>
						<select name="" class="saveWS260">
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
					<th>아이디</th>
					<td>
						<input type="text" name="" id="" value="" class="saveWS250">
					</td>
				</tr>
			</table>
			<input type="button" name="" id="" value="비밀번호 찾기" class="saveBtnOne" onclick="findAct()">
		</form>	
		<span class="span_go_page" onclick="location.href='login.jsp'">로그인하러 가기</span>
	</div>
	
	<div class="findTableOne" id="findActBox">
	</div>

	<%@include file="/Footer.jsp"%>
</body>
</html>