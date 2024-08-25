<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">

<script>
  /*  function id_duplicateCheck(){
      window.open('DidCheck.jsp','DidCheck','width=450,height=150');
   }
   
   function nick_duplicateCheck(){
      window.open('DnickName.jsp','DnickName','width=450,height=150');
   } */
   
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
   
// 이미지 첨부 삭제 함수
function deleteFile() {
      var fileInput = document.getElementById('ai_img');
      fileInput.value = '';
      document.getElementById('fileName').innerHTML = '사진첨부는 jpg,png,gif 파일만 가능합니다. 사진을 선택해주세요.';
   }
   


//파일 탐색기 실행시
window.onload = function() {
    // 파일 탐색기 실행 시 파일 이름 표시
    document.getElementById('p_img').addEventListener('change', function() {
        if (this.files.length > 0) {
            const fileName = this.files[0].name;
            //alert('선택한 파일: ' + fileName);
            document.getElementById('fileName').textContent = fileName;
        } else {
            document.getElementById('fileName').textContent = 'Choose File';
        }
    });
};
   
</script>

</head>
<body>
	<%@include file="/SubHeader.jsp"%>

   <form name="MemberJoinDonggu"  method="post" enctype="multipart/form-data"  action="MemberJoinDonggu_ok.jsp" onsubmit="return checkForm()">
   
		<div class="saveTableTwo m180_auto">
			<h3 class="saveTitle">구직자 가입하기</h3>
			<div class="stt_box">
				<table>
					<tr>
		               <th>아이디</th>
		               <td>
		                  <input type="text" name="p_id" id="p_id" value="" class="saveWS250" readonly onblur="idCheck()">
		                  <input type="button" name="" id="" value="아이디 중복검사" class="btnType1" onclick="id_duplicateCheck()">
		                  <span id="idText" class="dpib"></span>
		               </td>
		            </tr>
		            <tr>
		               <th>비밀번호</th>
		               <td>
		                  <input type="password" name="p_pwd" id="pw1" value="" class="saveWS250" placeholder="8자리 이상 + 문자와 숫자를 조합해주세요.">
		               </td>
		            </tr>
		            <tr>
		               <th>비밀번호확인</th>
		               <td>
		                  <input type="password" name="p_pwd" id="pw2" value="" class="saveWS250" placeholder="8자리 이상 + 문자와 숫자를 조합해주세요." onkeyup="pwCheck()">
		                  <span id="pwText" class="dpib"></span>
		               </td>
		            </tr>
		            <tr>
		               <th>비밀번호 찾기 질문</th>
		               <td>
		                  <select name="q_num" class="saveWS250">
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
		               <td>
		                  <input type="text" name="p_answer" id="p_answer" maxlength="12" value="" class="saveWS250" placeholder="기억할 수 있도록 간결히 답변해주세요." onblur="panswerCheck()">
		                  <span id="panswerText" class="dpib"></span>
		               </td>
		            </tr>
		            <tr>
		               <th>이름</th>
		               <td>
		                  <input type="text" name="p_name" id="p_name" value="" class="saveWS250" onkeyup="nameCheck()">
		                  <span id="nameText" class="dpib"></span>
		               </td>
		            </tr>
		            <tr>
		               <th>성별</th>
		               <td class="radio_td">
		                  <input type="radio" name="p_gender" id="p_gender1" value="1" class="" checked><label for="p_gender1">남자</label>
		                  <input type="radio" name="p_gender" id="p_gender2" value="2" class=""><label for="p_gender2" class="ml20">여자</label>
		               </td>
		            </tr>
		            <tr>
		               <th>흡연여부</th>
		               <td class="radio_td">
		                  <input type="radio" name="p_smoke" id="p_smoke1" value="1" class=""><label for="p_smoke1">흡연</label>
		                  <input type="radio" name="p_smoke" id="p_smoke2" value="0" class="" checked><label for="p_smoke2" class="ml20">비흡연</label>
		               </td>
		            </tr>
		            <tr>
		               <th>닉네임</th>
		               <td>
		                  <input type="text" name="p_nickname" id="p_nickname" value="" class="saveWS250"  readonly onblur="nicknameCheck()">
		                  <input type="button" name="" id="" value="닉네임 중복검사" class="btnType1" onclick="nick_duplicateCheck()">
		                  <span id="nicknameText" class="dpib"></span>
		               </td>
		            </tr>
		            <tr>
		                <th>사진</th>
		                <td style="display: flex; align-items: baseline; gap: 10px;">
			                <div>
								<input type="file" name="p_img" accept="image/*" id="p_img" class="saveWS250">		                
			                    <p id="fileName" style="color: #b2b2b2; font-size: 14px; margin-top: 5px; cursor:pointer;" onclick="document.getElementById('p_img').click();">사진첨부는 jpg,png,gif 파일만 가능합니다. 사진을 선택해주세요.</p>
			                    <span id="imageText" class="dpib"></span>
			                </div>
		                    <button type="button" onclick="deleteFile()">삭제</button>
		                    
		                    <!--
		                <div>
		                    <input type="file" name="p_img" accept="image/*" id="p_img" class="saveWS250">
		                    <p style="color: #b2b2b2; font-size: 14px; margin-top: 5px;">사진첨부는 jpg,png,gif 파일만 가능합니다.</p>
		                    <span id="imageText" class="dpib"></span>
		                </div>
		                    <button type="button" onclick="deleteFile()">삭제</button> 
		                     -->
		                </td>
		            </tr>
		            <tr>
		               <th>연락처</th>
		               <td>
		                  <input type="text" name="p_tel1" id="p_tel1" value="" class="saveWS100" onkeyup="telCheck()"> - 
		                  <input type="text" name="p_tel2" id="p_tel2" value="" class="saveWS100" onkeyup="telCheck()"> - 
		                  <input type="text" name="p_tel3" id="p_tel3" value="" class="saveWS100" onkeyup="telCheck()">
		                  <span id="telText" class="dpib"></span>
		               </td>
		            </tr>
		            <tr>
		               <th>주소</th>
		               <td>
		                  <input type="text" name="p_addr1" id="p_addr1" value="" class="saveWS400" placeholder="기본주소" onblur="addrCheck()">
		                  <input type="text" name="p_addr2" id="p_addr2" value="" class="saveWS400" placeholder="상세주소" onblur="addrCheck()">
		                  <span id="addrText" class="dpib"></span>
		               </td>
		            </tr>
		            <tr>
		               <th>주민번호</th>
		               <td>
		                  <input type="text" name="p_jumin1" id="p_jumin1" value="" class="saveWS100" onkeyup="juminCheck()"> - 
		                  <input type="text" name="p_jumin2" id="p_jumin2" value="" class="saveWS100" onkeyup="juminCheck()">
		                  <span id="juminText" class="dpib"></span>
		               </td>
		            </tr>
		            <tr>
		               <th>은행명</th>
		               <td>
		                  <select name="p_bank_name" class="saveWS250">
		                     <option value="1">KB국민은행</option>
		                     <option value="2">신한은행</option>
		                     <option value="3">하나은행</option>
		                     <option value="4">우리은행</option>
		                     <option value="5">SC제일은행</option>
		                     <option value="6">한국씨티은행</option>
		                     <option value="7">부산은행</option>
		                     <option value="8">대구은행</option>
		                     <option value="9">광주은행</option>
		                     <option value="10">전북은행</option>
		                     <option value="11">경남은행</option>
		                     <option value="12">제주은행</option>
		                     <option value="13">산업은행 (KDB)</option>
		                     <option value="14">IBK기업은행</option>
		                     <option value="15">NH농협은행</option>
		                     <option value="16">수협은행</option>
		                     <option value="17">Sh수협은행</option>
		                     <option value="18">우체국</option>
		                     <option value="19">카카오뱅크</option>
		                     <option value="20">케이뱅크</option>
		                     <option value="21">토스뱅크</option>
		                     <option value="22">기타(계좌번호 옆에 써주세요.)</option>
		                  </select>
		               </td>
		            </tr>
		            <tr>
		               <th>계좌번호</th>
		               <td>
		                  <input type="text" name="p_bank_num" id="p_bank_num" value="" class="saveWS250" placeholder="-를 포함해서 입력해주세요." onblur="banknumCheck()">
		                  <span id="banknumText" class="dpib"></span>
		               </td>
		            </tr>
		            <tr>
		               <th>반려경험</th>
		               <td>
		                  <textarea name="p_ex_my"  id="p_ex_my" class="saveWS80p saveHS100 write_ta" placeholder="본인의 반려경험을 적어주세요." onblur="pexmyCheck()"></textarea>
		                  <span id="pexmyText" class="dpib"></span>
		               </td>
		            </tr>
		            <tr>
		               <th>동구경험</th>
		               <td>
		                  <textarea name="p_ex_other" id="p_ex_other" class="saveWS80p saveHS100 write_ta" placeholder="타인의 반려동물을 돌봐본 경험을 적어주세요." onblur="pexotherCheck()"></textarea>
		                  <span id="pexotherText" class="dpib"></span>
		               </td>
		            </tr>
		            <tr>
		               <th>기타경험</th>
		               <td>
		                  <textarea name="p_ex_etc" id="p_ex_etc" class="saveWS80p saveHS100 write_ta" placeholder="기타 경험을 적어주세요." onblur="pexetcCheck()"></textarea>
		                  <span id="pexetcText" class="dpib"></span>
		               </td>
		            </tr>
				</table>
				<div class="saveWS100p tac mt20">
					<input type="button" name="" id="" value="취소하기" class="CancelBtn">
					<input type="submit" name="" id="" value="구직자 가입하기" class="saveBtnOne ml20">
				</div>
			</div>
		</div>
      
	</form>   
   
<%@include file="/Footer.jsp" %>
<script>
//아이디 중복 검사 창을 열고, 중복 검사 후 아이디를 설정
function id_duplicateCheck() {
    // 중복 검사 창을 열고, 검사 후 아이디가 설정되면 idCheck 호출
    window.open('DidCheck.jsp','DidCheck','width=450,height=150');

    // 새 창이 닫힌 후 idCheck 함수 호출 (간단한 방법으로는 타이머를 이용)
    setTimeout(function() {
        idCheck();  // 창이 닫히고 아이디가 설정된 후 호출
    }, 500);  // 0.5초 후에 실행 (필요에 따라 조정 가능)
}
function nick_duplicateCheck(){
   window.open('DnickName.jsp','DnickName','width=450,height=150');
}

//아이디 비어있는지 확인하는 유효성 검사
function idCheck() {
    var idCheckValue = document.getElementById('p_id').value;
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

function pwCheck(){
   
   var pwCheckValue1 = document.getElementById('pw1').value;
   var pwCheckValue2 = document.getElementById('pw2').value;
   var pwText = document.getElementById('pwText');

   var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,20}$/;

   if (passwordRegex.test(pwCheckValue1)) {
      if (pwCheckValue1 === pwCheckValue2) {
         pwText.innerHTML = '비밀번호가 일치하며 유효합니다.';
         pwText.style.color = 'green';
         return true;
      }else{
         pwText.innerHTML = '비밀번호가 일치하지 않습니다.';
         pwText.style.color = 'red';
         return false;
      }
   }else{
      pwText.innerHTML = '비밀번호는 최소 8자에서 20자까지, 영문자, 숫자를 포함해야 합니다.';
      pwText.style.color = 'red';
      return false;
   }
}

// 비밀번호 찾기 답 유효성 검사
function panswerCheck(){
   var panswerCheckValue = document.getElementById('p_answer').value;
   var panswerText = document.getElementById('panswerText');

   var panswerRegex = /^[a-zA-Z가-힣0-9\s]{2,10}$/;

   if (panswerRegex.test(panswerCheckValue)) {
      panswerText.innerHTML = '유효한 답변입니다.';
      panswerText.style.color = 'green';
      return true;
   } else{
      panswerText.innerHTML = '답변을 입력해주세요.(특수문자 사용불가)';
      panswerText.style.color = 'red';
      return false;
   }
}

//이름 유효성 검사
function nameCheck(){
   var nameCheckValue = document.getElementById('p_name').value;
   var nameText = document.getElementById('nameText');

   var nameRegex = /^[a-zA-Z가-힣]{2,20}$/;

   if (nameRegex.test(nameCheckValue)) {
      nameText.innerHTML = '유효한 이름입니다.';
      nameText.style.color = 'green';
      return true;
   }else{
      nameText.innerHTML = '이름을 입력해주세요.(특수문자 사용불가)';
      nameText.style.color = 'red';
      return false;
   }
}

// 닉네임 비어있는지 확인하는 유효성 검사
function nicknameCheck() {
    var nicknameCheckValue = document.getElementById('p_nickname').value;
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

//사진 유효성 검사 함수
var imageInput = document.getElementById('p_img');
   var imageText = document.getElementById('imageText');
   
   imageInput.addEventListener('change', function() {
       if (imageInput.files.length > 0) {
           imageText.innerHTML = '';
           
       } else {
           imageText.innerHTML = '사진을 첨부해주세요.';
           imageText.style.color = 'red';
           
       }
   });

   function imageCheck() {
       if (imageInput.files.length > 0) {
           return true;
       } else {
           imageText.innerHTML = '사진을 첨부해주세요.';
           imageText.style.color = 'red';
           return false;
       }
   }

   function deleteFile() {
       imageInput.value = '';  // 파일 선택 초기화
       imageText.innerHTML = '사진을 첨부해주세요.';
       imageText.style.color = 'red';
       
       document.getElementById('fileName').innerHTML = '사진첨부는 jpg,png,gif 파일만 가능합니다. 사진을 선택해주세요.';
   }

// 연락처 유효성 검사
   function telCheck(){
      var tel1CheckValue = document.getElementById('p_tel1').value;
      var tel2CheckValue = document.getElementById('p_tel2').value;
      var tel3CheckValue = document.getElementById('p_tel3').value;
      var telText = document.getElementById('telText');

      var tel1Regex = /^[0-9]{3}$/;
      var tel2Regex = /^[0-9]{4}$/;
      var tel3Regex = /^[0-9]{4}$/;

      // 모든 필드를 검사하는 조건 수정
       if (tel1Regex.test(tel1CheckValue) && tel2Regex.test(tel2CheckValue) && tel3Regex.test(tel3CheckValue)) {
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
   function addrCheck(){
      var addr1CheckValue = document.getElementById('p_addr1').value;
      var addr2CheckValue = document.getElementById('p_addr2').value;
      var addrText = document.getElementById('addrText');

       var addr1Regex = /^[a-zA-Z가-힣0-9\s\-]{3,25}$/;
       var addr2Regex = /^[a-zA-Z가-힣0-9\s\-]{3,25}$/;

      if(addr1Regex.test(addr1CheckValue)){
         if(addr2CheckValue === ''){
            addrText.innerHTML = '상세주소를 구체적으로 입력해주세요.(특수문자 - 가능)';
            addrText.style.color = 'red';
            return false;
         } else if(addr2Regex.test(addr2CheckValue)){
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
   function juminCheck(){
      var jumin1CheckValue = document.getElementById('p_jumin1').value;
      var jumin2CheckValue = document.getElementById('p_jumin2').value;
      var juminText = document.getElementById('juminText');

       var jumin1Regex = /^[0-9]{6}$/;
       var jumin2Regex = /^[0-9]{7}$/;

      if(jumin1Regex.test(jumin1CheckValue)){
         if(jumin2CheckValue === ''){
            juminText.innerHTML = '주민번호 뒷자리를 입력해주세요.(특수문자 입력불가)';
            juminText.style.color = 'red';
            return false;
         } else if(jumin2Regex.test(jumin2CheckValue)){
            juminText.innerHTML = '유효한 주민번호 입니다.';
            juminText.style.color = 'green';
            return true;
         } else {
            juminText.innerHTML = '숫자만 입력할 수 있습니다.(특수문자 입력불가)';
               juminText.style.color = 'red';
               return false;
           }
         
      } else {
         juminText.innerHTML = '주민번호 앞자리를 입력해주세요.';
         juminText.style.color = 'red';
           return false;
       }
   }
   
   // 계좌번호 유효성 검사
   function banknumCheck() {
       var banknumCheckValue = document.getElementById('p_bank_num').value;
       var banknumText = document.getElementById('banknumText');
   
       // 숫자와 -를 허용하는 정규식 (최소 하나의 숫자가 포함된 15~20자리의 문자열)
       var banknum1Regex = /^[0-9-]{15,20}$/;
   
       // 정규식 테스트
       if (banknum1Regex.test(banknumCheckValue)) {
           // 모든 검증이 통과되면 폼 제출 또는 다른 로직을 진행
           banknumText.innerHTML = '유효한 계좌번호 입니다.'; // 오류 메시지 초기화
           banknumText.style.color = 'green';
           return true;
       } else {
           banknumText.innerHTML = '유효한 계좌번호를 입력해주세요. (숫자와 하이픈만 입력가능)';
           banknumText.style.color = 'red';
           return false;
       }
   }

   
   // 반려경험 유효성 검사
   function pexmyCheck(){
      var pexmyCheckValue = document.getElementById('p_ex_my').value;
      var pexmyText = document.getElementById('pexmyText');

      var pexmyRegex = /^[a-zA-Z가-힣\s]{2,20}$/;

      if (pexmyRegex.test(pexmyCheckValue)) {
         pexmyText.innerHTML = '';
         return true;
      } else{
         pexmyText.innerHTML = '자택종류를 입력해주세요.(특수문자 사용불가)';
         pexmyText.style.color = 'red';
         return false;
      }
   }
   
   
   // 동구경험 유효성 검사
   function pexotherCheck(){
      var pexotherCheckValue = document.getElementById('p_ex_other').value;
      var pexotherText = document.getElementById('pexotherText');

      var pexotherRegex = /^[a-zA-Z가-힣\s]{2,20}$/;

      if (pexotherRegex.test(pexotherCheckValue)) {
         pexotherText.innerHTML = '';
         return true;
      } else{
         pexotherText.innerHTML = '자택종류를 입력해주세요.(특수문자 사용불가)';
         pexotherText.style.color = 'red';
         return false;
      }
   }
   
   
   // 기타경험 유효성 검사
   function pexetcCheck(){
      var pexetcCheckValue = document.getElementById('p_ex_etc').value;
      var pexetcText = document.getElementById('pexetcText');

      var pexetcRegex = /^[a-zA-Z가-힣\s]{2,20}$/;

      if (pexetcRegex.test(pexetcCheckValue)) {
         pexetcText.innerHTML = '';
         return true;
      } else{
         pexetcText.innerHTML = '자택종류를 입력해주세요.(특수문자 사용불가)';
         pexetcText.style.color = 'red';
         return false;
      }
   }
   
   // 폼 제출 전 유효성 검사
   function checkForm() {
       var checkValid = true;
       

       // 각 유효성 검사 함수 호출 및 결과 저장
       var idCheckResult = idCheck();
       
       var pwCheckResult = pwCheck();
       
       var panswerCheckResult = panswerCheck();
       
       var nameCheckResult = nameCheck();
      
       var nicknameCheckResult = nicknameCheck();
       
       var imageCheckResult = imageCheck();
       var telCheckResult = telCheck();
       var addrCheckResult = addrCheck();
       var juminCheckResult = juminCheck();
       var banknumCheckResult = banknumCheck();
       var pexmyCheckResult = pexmyCheck();
       var pexotherCheckResult = pexotherCheck();
       var pexetcCheckResult = pexetcCheck();
      

       // 각 유효성 검사 결과에 따라 폼 제출 여부 결정
       if (!idCheckResult) checkValid = false;
       if (!pwCheckResult) checkValid = false;
       if (!panswerCheckResult) checkValid = false;
       if (!nameCheckResult) checkValid = false;
       if (!nicknameCheckResult) checkValid = false;
       if (!imageCheckResult) checkValid = false;
       if (!telCheckResult) checkValid = false;
       if (!addrCheckResult) checkValid = false;
       if (!juminCheckResult) checkValid = false;
       if (!banknumCheckResult) checkValid = false;
       if (!pexmyCheckResult) checkValid = false;
       if (!pexotherCheckResult) checkValid = false;
       if (!pexetcCheckResult) checkValid = false;

       console.log("유효성 검사 결과:", checkValid);
       return checkValid; // false일 경우 폼이 제출되지 않음
   }


</script>
</body>
</html>