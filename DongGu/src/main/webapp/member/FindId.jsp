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
		var pwCheckText = "아이디찾기완료";
		document.getElementById('findActBox').innerHTML = pwCheckText;
	}
</script>

</head>
<body>
	<h1 class="mt100">
		<a href="/DongGu/Index.jsp"><img src="/DongGu/img/logo.png" alt="logo"></a>
	</h1>

	<div class="saveTableOne margin_tbtype1">
		<h3>아이디 찾기</h3>
		<form name="">
			<table>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="" id="" value="" class="saveWS250">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="text" name="" id="" value="" class="saveWS250">
					</td>
				</tr>
			</table>
			<input type="button" name="" id="" value="아이디 찾기" class="saveBtnOne" onclick="findAct()">
		</form>	
		<span class="span_go_page" onclick="location.href='login.jsp'">로그인하러 가기</span>
		<span class="span_go_page" onclick="location.href='FindPw.jsp'">비밀번호 찾기</span>
	</div>
	
	<div class="findTableOne" id="findActBox">
	
	</div>
	

</body>
</html>