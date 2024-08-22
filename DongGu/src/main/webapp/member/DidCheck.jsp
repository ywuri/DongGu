<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
//아이디 유효성 검사
function idCheck() {
    var idCheckValue = document.getElementById('p_id').value;
    var idText = document.getElementById('idText');
    var submitButton = document.getElementById('submitButton');
    
    // 정규 표현식: 아이디는 영어 대소문자와 숫자를 포함하고, 4자에서 10자 사이여야 한다.
    var idWordRegex = /^[a-zA-Z0-9]{4,10}$/;
    
    // "admin"이 포함된지 여부 확인 및 정규식 검사
    if (idCheckValue.toLowerCase().includes("admin")) {
        idText.innerHTML = '아이디에 "admin"이라는 단어를 포함할 수 없습니다.';
        idText.style.color = 'red';
        submitButton.disabled = true;
    } else if (idWordRegex.test(idCheckValue)) {
        idText.innerHTML = '올바른 아이디 구성입니다.';
        idText.style.color = 'green';
        submitButton.disabled = false;
    } else {
        idText.innerHTML = '아이디에는 한글과 특수문자가 포함될 수 없습니다.<br>(최소 4~10글자)';
        idText.style.color = 'red';
        submitButton.disabled = true;
    }
}

//중복 검사 후 부모 창에 유효한 아이디 전달
function sendValidIdToParent() {
    var idCheckValue = document.getElementById('o_id').value;
    // 부모 창의 setIdCheckResult 함수 호출
    window.opener.setIdCheckResult(idCheckValue);
    window.close();
}

</script>
</head>
<body>
<form name="zipform" action="DidCheck_ok.jsp">
	<fieldset>
		<h2>ID 중복검사</h2>
		<label>ID</label>
		<input type="text" name="p_id" id="p_id" required="required" onkeyup="idCheck()">
		<input type="submit" value="중복확인" id="submitButton" disabled>
		<span id="idText" class="dpib" style="display: inline-block;"></span>
	</fieldset>
</form>
</body>
</html>