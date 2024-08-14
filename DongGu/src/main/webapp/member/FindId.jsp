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
<%@include file="Header.jsp" %>


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
	</div>
	
	<div class="findTableOne" id="findActBox">
	</div>
	
<%@include file="Footer.jsp" %>

</body>
</html>