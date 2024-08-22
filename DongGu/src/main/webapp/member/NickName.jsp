<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>닉네임 중복 검사</title>
<script>
//닉네임 유효성 검사
function NicknameCheck() {
	var NickCheckValue = document.getElementById('o_nickname').value;
	var NickText = document.getElementById('NickText');
	var submitButton = document.getElementById('submitButton');
	
	// 정규 표현식: 닉네임은 특수문자를 사용할 수 없고 2자에서 8자 사이여야 한다.
	var NickWordRegex = /^[a-zA-Z0-9가-힣]{2,8}$/;
	
	// "admin" 또는 "관리자" 단어가 포함된지 여부 확인 및 정규식 검사
	if (NickCheckValue.toLowerCase().includes("admin") || NickCheckValue.includes("관리자")) {
		NickText.innerHTML = '닉네임에 "admin" 또는 "관리자"라는 단어를 포함할 수 없습니다.';
		NickText.style.color = 'red';
		submitButton.disabled = true;
	} else if (NickWordRegex.test(NickCheckValue)) {
		NickText.innerHTML = '올바른 닉네임 구성입니다.';
		NickText.style.color = 'green';
		submitButton.disabled = false;
	} else {
		NickText.innerHTML = '닉네임에는 특수문자가 포함될 수 없습니다.<br>(최소 2~8글자)';
		NickText.style.color = 'red';
		submitButton.disabled = true;
	}
}
// 중복 검사 후 부모 창에 유효한 닉네임 전달
function sendValidNicknameToParent() {
    var nicknameCheckValue = document.getElementById('o_nickname').value;
    // 부모 창의 setNicknameCheckResult 함수 호출
    window.opener.setNicknameCheckResult(nicknameCheckValue);
    window.close();
}
</script>
</head>
<body>
<form name="zipform" action="javascript:sendValidNicknameToParent();">
    <fieldset>
        <h2>닉네임 중복검사</h2>
        <label>닉네임</label>
        <input type="text" name="o_nickname" id="o_nickname" required="required" onkeyup="NicknameCheck()">
        <input type="submit" value="중복확인" id="submitButton" disabled>
        <span id="NickText" class="dpib" style="display: inline-block;"></span>
    </fieldset>
</form>
</body>
</html>
