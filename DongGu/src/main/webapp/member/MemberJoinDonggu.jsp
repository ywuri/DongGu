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
	function id_duplicateCheck(){
		window.open('DidCheck.jsp','DidCheck','width=450,height=300');
	}
	
	function nick_duplicateCheck(){
		window.open('DnickName.jsp','DnickName','width=450,height=300');
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
	
// 이미지 첨부 삭제 함수
function deleteFile() {
		var fileInput = document.getElementById('ai_img');
		fileInput.value = '';
	}
	
</script>

</head>
<body>
<%@include file="/Header.jsp" %>
<%

// 파일 업로드
if (request.getMethod().equalsIgnoreCase("POST")) {
    // 파일 업로드 설정 및 저장 경로 생성
    /**String savepath = application.getRealPath("/") + "uploaded_files"; // 저장할 경로 설정
    File saveDir = new File(savepath);*/
  	//사진이 있다면 사진 처리
    String uploadPath = request.getRealPath("/") + "img/Donggu/temp"; // 임시 저장 경로
    String savepath = request.getRealPath("/")+"img/Donggu/";
    File saveDir = new File(savepath);

    // 경로가 존재하지 않으면 폴더 생성
    if (!saveDir.exists()) {
        saveDir.mkdirs();
    }

    // MultipartRequest 객체 생성하여 파일 업로드 처리
    MultipartRequest mr = new MultipartRequest(request, savepath, 10 * 1024 * 1024, "utf-8"); // 최대 10MB 파일 업로드 설정

    // 업로드된 파일 이름 가져오기
    String uploadedFileName = mr.getFilesystemName("p_img"); // "p_img"는 form의 input name
    
}
%> 
	<form name="MemberJoinDonggu" action="MemberJoinDonggu_ok.jsp" method="post" enctype="multipart/form-data">
	
		<div class="saveTableOne">
			<h3>구직자 가입하기</h3>
			<table>
				<tr>
					<th>아이디</th>
					<td>
						<input type="text" name="p_id" id="" value="" class="saveWS250" readonly>
						<input type="button" name="" id="" value="아이디 중복검사" class="btnType1" onclick="id_duplicateCheck()">
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
							<option value="">질문1</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>비밀번호 찾기 답</th>
					<td>
						<input type="text" name="p_answer" id="" value="" class="saveWS250">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="p_name" id="" value="" class="saveWS250">
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="p_gender" id="p_gender1" value="1" class=""><label for="p_gender1">남자</label>
						<input type="radio" name="p_gender" id="p_gender2" value="2" class=""><label for="p_gender2">여자</label>
					</td>
				</tr>
				<tr>
					<th>흡연여부</th>
					<td>
						<input type="radio" name="p_smoke" id="p_smoke1" value="1" class=""><label for="p_smoke1">흡연</label>
						<input type="radio" name="p_smoke" id="p_smoke2" value="0" class=""><label for="p_smoke2">비흡연</label>
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" name="p_nickname" id="" value="" class="saveWS250">
						<input type="button" name="" id="" value="닉네임 중복검사" class="btnType1" onclick="nick_duplicateCheck()">
					</td>
				</tr>
				<tr>
                <th>사진</th>
                <td style="display: flex; align-items: baseline; gap: 10px;">
                <div>
                    <input type="file" name="p_img"  id="ai_img" accept=".jpg,.jpeg,.png,.gif" class="saveWS250">
                    <p style="color: #b2b2b2; font-size: 14px; margin-top: 5px;">사진첨부는 jpg,png,gif 파일만 가능합니다.</p>
                </div>
                    <button type="button" onclick="deleteFile()">삭제</button>
                </td>
            </tr>
				<tr>
					<th>연락처</th>
					<td>
						<input type="text" name="p_tel1" id="" value="" class="saveWS40"> - 
						<input type="text" name="p_tel2" id="" value="" class="saveWS60"> - 
						<input type="text" name="p_tel3" id="" value="" class="saveWS60">
					</td>
				</tr>
				<tr>
					<th>거주지</th>
					<td>
						<input type="text" name="p_addr1" id="p_addr1" value="" class="saveWS250" placeholder="기본주소">
						<input type="text" name="p_addr2" id="p_addr2" value="" class="saveWS250" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td>
						<input type="text" name="p_jumin1" id="" value="" class="saveWS60"> - 
						<input type="text" name="p_jumin2" id="" value="" class="saveWS60">
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
						<input type="text" name="p_bank_num" id="" value="" class="saveWS250" placeholder="-를 포함해서 입력해주세요.">
					</td>
				</tr>
				<tr>
					<th>반려경험</th>
					<td>
						<textarea name="p_ex_my" class="saveWS100p saveHS100" placeholder="본인의 반려경험을 적어주세요."></textarea>
					</td>
				</tr>
				<tr>
					<th>동구경험</th>
					<td>
						<textarea name="p_ex_other" class="saveWS100p saveHS100" placeholder="타인의 반려동물을 돌봐본 경험을 적어주세요."></textarea>
					</td>
				</tr>
				<tr>
					<th>기타경험</th>
					<td>
						<textarea name="p_ex_etc" class="saveWS100p saveHS100" placeholder="기타 경험을 적어주세요."></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" name="" id="" value="동구할래요! 구직자 가입하기" class="saveBtnOne">
		</div>
		
	</form>	
	
<%@include file="/Footer.jsp" %>

</body>
</html>