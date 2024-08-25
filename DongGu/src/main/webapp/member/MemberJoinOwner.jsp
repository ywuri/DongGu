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
	<%@include file="/SubHeader.jsp"%>

	<form name="MemberJoinOwner" action="MemberJoinOwner_ok.jsp"
		method="post" onsubmit="return checkForm()">

		<div class="saveTableTwo m180_auto">
			<h3 class="saveTitle">고용자 가입하기</h3>
			<div class="stt_box">
				<table>
					<tr>
						<th>아이디</th>
						<td colspan="2" class="">
							<input type="text" name="o_id" id="o_id" value=""
							class="saveWS250" readonly onchange="idCheck()" placeholder="아이디"> 
							<input
							type="button" name="" id="" value="아이디 중복검사" class="btnType1"
							onclick="id_duplicateCheck()"> 
							<span id="idText" class="dpib"></span>
						</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td colspan="2" class="">
							<input type="text" name="o_nickname" id="o_nickname"
							value="" class="saveWS250" readonly onchange="nicknameCheck()" placeholder="닉네임">
							
							<input type="button" name="" id="" value="닉네임 중복검사"
							class="btnType1" onclick="nick_duplicateCheck()"> 
							
							<span id="nicknameText" class="dpib"></span>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td colspan="2" class="">
							<input type="password" name="o_pwd" id="pw1" value=""
							class="saveWS250" placeholder="8자리 이상 + 문자와 숫자를 조합해주세요.">
						</td>
					</tr>
					<tr>
						<th>비밀번호확인</th>
						<td colspan="2" class="">
							<input type="password" name="o_pwd" id="pw2" value=""
							class="saveWS250" placeholder="입력한 비밀번호를 한번 더 입력해주세요."
							onkeyup="pwCheck()"> 
							
							<span id="pwText" class="dpib"></span>
						</td>
					</tr>
					<tr>
						<th>비밀번호 찾기 질문</th>
						<td colspan="2" class="">
							<select name="q_num" class="saveWS410">
								<option value="1">내가 가장 좋아하는 간식은?</option>
								<option value="2">제일 기억에 남는 영화는?</option>
								<option value="3">부모님의 결혼기념일은?</option>
								<option value="4">어릴적(혹은 현재) 제일 친한친구 이름은?</option>
								<option value="5">제일 기억에 남는 생일선물은?</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>비밀번호 찾기 답</th>
						<td colspan="2" class="">
							<input type="text" name="q_answer" id="q_answer" value=""
							class="saveWS400" onblur="qanswerCheck()" placeholder="비밀번호 찾기 답을 입력해주세요."> 
							
							<span id="qanswerText" class="dpib"></span>
						</td>
					</tr>
					<tr>
						<th>이름</th>
						<td colspan="2" class="">
							<input type="text" name="o_name" id="o_name" value=""
							class="saveWS400" onkeyup="nameCheck()" placeholder="이름"> 
							
							<span id="nameText" class="dpib"></span>
						</td>
					</tr>
					<tr>
						<th>성별</th>
						<td class=" radio_td">
							<input type="radio" name="o_gender" id="o_gender1"
							value="1" class="" checked><label for="o_gender1">남자</label>
							
							<input type="radio" name="o_gender" id="o_gender2" value="2"
							><label for="o_gender2" class="ml20">여자</label>
						</td>
					</tr>
					<tr>
						<th>주민번호</th>
						<td class="">
							<input type="text" name="o_jumin1" id="o_jumin1"
							maxlength="6" value="" class="saveWS100" onkeyup="juminCheck()">
							
							- <input type="text" name="o_jumin2" id="o_jumin2" maxlength="7"
							value="" class="saveWS100" onkeyup="juminCheck()"> 
							
							<span id="juminText" class="dpib"></span>
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td class="">
							<input type="text" name="o_tel1" id="o_tel1" maxlength="3"
							value="" class="saveWS100" onkeyup="telCheck()">
							
							 - <input type="text" name="o_tel2" id="o_tel2" maxlength="4" value=""
							class="saveWS100" onkeyup="telCheck()">
							
							 - <input type="text" name="o_tel3" id="o_tel3" maxlength="4" value=""
							class="saveWS100" onkeyup="telCheck()"> 
							
							<span id="telText" class="dpib"></span>
						</td>
					</tr>
					<tr>
						<th>자택종류</th>
						<td>
							<input type="text" name="o_house" id="o_house" value=""
							class="saveWS250" placeholder="자택종류(단독주택, 아파트, 빌라)"
							onblur="houseCheck()"> 
							
							<span id="houseText" class="dpib"></span>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="2" >
							<input type="text" name="o_addr1" id="o_addr1" value=""
							class="saveWS400" placeholder="기본주소" onblur="addrCheck()">
							
							<input type="text" name="o_addr2" id="o_addr2" value=""
							class="saveWS400" placeholder="상세주소" onblur="addrCheck()">
							
							<span id="addrText" class="dpib"></span>
						</td>
					</tr>
				</table>
				<div class="saveWS100p tac mt20">
					<input type="button" name="" id="CancelBtn" value="취소하기" class="CancelBtn">
					<input type="submit" name="" id="" value="고용자 가입하기" class="saveBtnOne ml20">
				</div>
			</div>
		</div>
	</form>

	<%@include file="/Footer.jsp"%>
	<script>
		// 취소하기 버튼 경로이동
		document.getElementById('CancelBtn').onclick = function(){
			window.location.href="/DongGu/member/login.jsp"
		}
	
		// 아이디 중복체크 검사	
		function id_duplicateCheck() {
			window.open('IdCheck.jsp', 'idCheck', 'width=450,height=150');
		}
		
		// 닉네임 중복체크 검사
		function nick_duplicateCheck() {
			window.open('NickName.jsp', 'NickName', 'width=450,height=150');
		}

		// 아이디 비어있는지 확인하는 유효성 검사
		function idCheck() {
			var idCheckValue = document.getElementById('o_id').value;
			var idText = document.getElementById('idText');

			// 아이디가 비어있는지 확인
			if (idCheckValue === "") {
				idText.innerHTML = '아이디 중복검사를 실행해주세요.';
				idText.style.color = 'red';
				return false;
			} else {
				idText.innerHTML = '유효한 아이디 입니다.';
				idText.style.color = 'green';
				return true;
			}
		}

		// 팝업에서 중복 검사 결과를 받아와 아이디 값을 설정하는 함수
		function setIdCheckResult(validId) {
			var o_id_field = document.getElementById('o_id');
			o_id_field.value = validId;

			// 강제로 onchange 이벤트 발생시키기
			o_id_field.dispatchEvent(new Event('change'));
		}

		// 비밀번호 유효성 검사
		function pwCheck() {
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
					return true;
				} else {
					pwText.innerHTML = '비밀번호가 일치하지 않습니다.';
					pwText.style.color = 'red';
					return false;
				}
			} else {
				pwText.innerHTML = '비밀번호는 최소 8자에서 20자까지, 영문자, 숫자를 포함해야 합니다.';
				pwText.style.color = 'red';
				return false;
			}
		}

		// 비밀번호 찾기 답 유효성 검사
		function qanswerCheck() {
			var qanswerCheckValue = document.getElementById('q_answer').value;
			var qanswerText = document.getElementById('qanswerText');

			// 숫자, 영문자, 한글, 공백을 포함하는 2-10글자 정규식
			var qanswerRegex = /^[a-zA-Z가-힣0-9\s]{2,10}$/;

			if (qanswerRegex.test(qanswerCheckValue)) {
				qanswerText.innerHTML = '유효한 답변입니다.';
				qanswerText.style.color = 'green';
				return true;
			} else {
				qanswerText.innerHTML = '답변을 입력해주세요.(특수문자 사용불가)';
				qanswerText.style.color = 'red';
				return false;
			}
		}

		// 이름 유효성 검사
		function nameCheck() {
			var nameCheckValue = document.getElementById('o_name').value;
			var nameText = document.getElementById('nameText');

			var nameRegex = /^[a-zA-Z가-힣]{2,20}$/;

			if (nameRegex.test(nameCheckValue)) {
				nameText.innerHTML = '유효한 이름입니다.';
				nameText.style.color = 'green';
				return true;
			} else {
				nameText.innerHTML = '이름을 입력해주세요.(특수문자 사용불가)';
				nameText.style.color = 'red';
				return false;
			}
		}

		//닉네임 비어있는지 확인하는 유효성 검사
		function nicknameCheck() {
			var nicknameCheckValue = document.getElementById('o_nickname').value;
			var nicknameText = document.getElementById('nicknameText');

			// 닉네임이 비어있는지 확인
			if (nicknameCheckValue === "") {
				nicknameText.innerHTML = '닉네임 중복검사를 실행해주세요.';
				nicknameText.style.color = 'red';
				return false;
			} else {
				nicknameText.innerHTML = '유효한 닉네임 입니다.';
				nicknameText.style.color = 'green';
				return true;
			}
		}

		// 팝업에서 닉네임 중복 검사 결과를 받아와 닉네임 값을 설정하는 함수
		function setNicknameCheckResult(validNickname) {
			var o_nickname_field = document.getElementById('o_nickname');
			o_nickname_field.value = validNickname;

			// 닉네임이 설정된 후 문구를 즉시 업데이트
			var nicknameText = document.getElementById('nicknameText');
			nicknameText.innerHTML = '유효한 닉네임 입니다.';
			nicknameText.style.color = 'green';
		}

		// 연락처 유효성 검사
		function telCheck() {
			var tel1CheckValue = document.getElementById('o_tel1').value;
			var tel2CheckValue = document.getElementById('o_tel2').value;
			var tel3CheckValue = document.getElementById('o_tel3').value;
			var telText = document.getElementById('telText');

			var tel1Regex = /^[0-9]{3}$/;
			var tel2Regex = /^[0-9]{4}$/;
			var tel3Regex = /^[0-9]{4}$/;

			// 모든 필드를 검사하는 조건 수정
			if (tel1Regex.test(tel1CheckValue)
					&& tel2Regex.test(tel2CheckValue)
					&& tel3Regex.test(tel3CheckValue)) {
				// 모든 검증이 통과되면 폼 제출 또는 다른 로직을 진행
				telText.innerHTML = '유효한 번호 입니다.'; // 오류 메시지 초기화
				telText.style.color = 'green';
				return true;
			} else {
				telText.innerHTML = '필드를 모두 채워주세요.(숫자만 입력가능)';
				telText.style.color = 'red';
				return false;
			}
		}

		// 거주지 유효성 검사
		function addrCheck() {
			var addr1CheckValue = document.getElementById('o_addr1').value;
			var addr2CheckValue = document.getElementById('o_addr2').value;
			var addrText = document.getElementById('addrText');

			var addr1Regex = /^[a-zA-Z가-힣0-9\s\-]{3,25}$/;
			var addr2Regex = /^[a-zA-Z가-힣0-9\s\-]{3,25}$/;

			if (addr1Regex.test(addr1CheckValue)) {
				if (addr2CheckValue === '') {
					addrText.innerHTML = '상세주소를 구체적으로 입력해주세요.(특수문자 - 가능)';
					addrText.style.color = 'red';
					return false;
				} else if (addr2Regex.test(addr2CheckValue)) {
					addrText.innerHTML = '유효한 주소입니다.';
					addrText.style.color = 'green';
					return true;
				} else {
					addrText.innerHTML = '구체적으로 입력해주세요.(특수문자 - 가능)';
					addrText.style.color = 'red';
					return false;
				}

			} else {
				addrText.innerHTML = '기본주소를 입력해주세요.(특수문자 - 가능)';
				addrText.style.color = 'red';
				return false;
			}
		}

		// 주민등록 유효성 검사
		function juminCheck() {
			var jumin1CheckValue = document.getElementById('o_jumin1').value;
			var jumin2CheckValue = document.getElementById('o_jumin2').value;
			var juminText = document.getElementById('juminText');

			var jumin1Regex = /^[0-9]{6}$/;
			var jumin2Regex = /^[0-9]{7}$/;

			if (jumin1Regex.test(jumin1CheckValue)) {
				if (jumin2CheckValue === '') {
					juminText.innerHTML = '주민번호 뒷자리를 입력해주세요.';
					juminText.style.color = 'red';
					return false;
				} else if (jumin2Regex.test(jumin2CheckValue)) {
					juminText.innerHTML = '유효한 주민번호 입니다.';
					juminText.style.color = 'green';
					return true;
				} else {
					juminText.innerHTML = '숫자만 입력할 수 있습니다.(필드를 채워주세요)';
					juminText.style.color = 'red';
					return false;
				}

			} else {
				juminText.innerHTML = '주민번호 앞자리를 입력해주세요.';
				juminText.style.color = 'red';
				return false;
			}
		}

		// 자택종류 유효성 검사
		function houseCheck() {
			var houseCheckValue = document.getElementById('o_house').value;
			var houseText = document.getElementById('houseText');

			var houseRegex = /^[a-zA-Z가-힣\s]{2,20}$/;

			if (houseRegex.test(houseCheckValue)) {
				houseText.innerHTML = '';
				return true;
			} else {
				houseText.innerHTML = '자택종류를 입력해주세요.(특수문자 사용불가)';
				houseText.style.color = 'red';
				return false;
			}
		}

		// 폼 제출 전 유효성 검사
		function checkForm() {
			var checkValid = true;

			var idCheckResult = idCheck();
			var pwCheckResult = pwCheck();
			var qanswerCheckResult = qanswerCheck();
			var nameCheckResult = nameCheck();
			var nicknameCheckResult = nicknameCheck(); // 함수명 수정
			var telCheckResult = telCheck();
			var addrCheckResult = addrCheck();
			var juminCheckResult = juminCheck();
			var houseCheckResult = houseCheck();

			if (!idCheckResult)
				checkValid = false;
			if (!pwCheckResult)
				checkValid = false;
			if (!qanswerCheckResult)
				checkValid = false;
			if (!nameCheckResult)
				checkValid = false;
			if (!nicknameCheckResult)
				checkValid = false;
			if (!telCheckResult)
				checkValid = false;
			if (!addrCheckResult)
				checkValid = false;
			if (!juminCheckResult)
				checkValid = false;
			if (!houseCheckResult)
				checkValid = false;

			console.log("유효성 검사 결과:", checkValid);

			return checkValid;
		}
	</script>
</body>
</html>