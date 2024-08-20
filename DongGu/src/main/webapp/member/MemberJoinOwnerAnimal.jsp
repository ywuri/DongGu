<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
<!-- JavaScript 함수 정의 -->

</head>
<body>
<%@include file="/SubHeader.jsp" %>

<!-- JSP를 사용해 Java 객체를 페이지에 주입 -->
<jsp:useBean id="adao" class="com.DongGu.animal.animalDAO" scope="page"></jsp:useBean>
<%
List<String[]> BigAnimalList = adao.animalList(); // 대분류 동물종류 목록 가져오기
List<String[]> SmallAnimalList = adao.animalTypeList(); // 소분류 동물종류 목록 가져오기
List<String> natureList = adao.animalNature(); // 동물성격 목록 가져오기
%>

<%
// 세션에서 오너ID/사용자ID 가져오기
String ownerId = (String) session.getAttribute("o_id"); // 세션에서 o_id 가져오기
String userId = (String) session.getAttribute("sid"); // 세션에서 sid 가져오기

if (ownerId == null) {
    response.sendRedirect("login.jsp"); // 세션이 만료되어 오너 ID가 없다면 로그인 페이지로 이동
    return;
}

//파일 업로드
if (request.getMethod().equalsIgnoreCase("POST")) {
 // 파일 업로드 설정 및 저장 경로 생성
 /**String savepath = application.getRealPath("/") + "uploaded_files"; // 저장할 경로 설정
 File saveDir = new File(savepath);*/
	//사진이 있다면 사진 처리
 String uploadPath = request.getRealPath("/") + "img/Animal/temp"; // 임시 저장 경로
 String savepath = request.getRealPath("/")+"img/Animal/";
 File saveDir = new File(savepath);

 // 경로가 존재하지 않으면 폴더 생성
 if (!saveDir.exists()) {
     saveDir.mkdirs();
 }

 // MultipartRequest 객체 생성하여 파일 업로드 처리
 MultipartRequest mr = new MultipartRequest(request, savepath, 10 * 1024 * 1024, "utf-8"); // 최대 10MB 파일 업로드 설정

 // 업로드된 파일 이름 가져오기
 String uploadedFileName = mr.getFilesystemName("ai_img"); // "ai_img"는 form의 input name
 
}

%>


<!-- 폼 시작 -->
<form name="" action="MemberJoinOwnerAnimal_ok.jsp" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
    <div class="saveTableOne">
        <h3>내 반려동물 정보를 입력해주세요!</h3>
        <table>
            <tr>
                <th>종류</th>
                <td>
                    <!-- 대분류 선택 필드 -->
                    <select name="a_name" id="a_name" class="saveWS260" onchange="filterAnimalTypes()">
                        <%
                            for (String[] arr : BigAnimalList) {
                                String selected = arr[1].equals("강아지") ? "selected" : "";
                        %>
                        <option value="<%=arr[0] %>" <%=selected %>><%=arr[1] %></option>
                        <%
                            }
                        %>
                    </select>
                </td>
            </tr>
            <tr>
                <th>품종</th>
                <td>
                     <select name="at_name" id="at_name" class="saveWS260">
                        <%
                            for (String[] arr : SmallAnimalList) {
                                String parent = arr[1];
                        %>
                        <option value="<%=arr[0] %>" data-parent="<%=parent %>"><%=arr[2] %></option>
                       
                        <%
                            }
                        %>
                         
                    </select>
                    <!-- 숨겨진 필드 (at_num을 전송하기 위한) -->
                    <input type="hidden" name="at_num" id="at_num" value="">
                    
                </td>
            </tr>
            <tr>
                <th>이름</th>
                <td>
                    <input type="text" name="ai_name" id="ai_name" value="" class="saveWS250" onkeyup="nameCheck()">
                    <span id="nameText" class="dpib"></span>
                </td>
            </tr>
            <tr>
                <th>성별</th>
                <td>
                    <input type="radio" name="ai_gender" id="ai_gender1" value="1" checked><label for="ai_gender1">남자</label>
                    <input type="radio" name="ai_gender" id="ai_gender2" value="2"><label for="ai_gender2">여자</label>
                </td>
            </tr>
            <tr>
                <th>사진</th>
                <td style="display: flex; align-items: baseline; gap: 10px;">
                <div>
                    <input type="file" name="ai_img" accept="image/*" id="ai_img" class="saveWS250">
                    <p style="color: #b2b2b2; font-size: 14px; margin-top: 5px;">사진첨부는 jpg,png,gif 파일만 가능합니다.</p>
                     <span id="imageText" class="dpib"></span>
                </div>
                    <button type="button" onclick="deleteFile()">삭제</button>
                </td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td>
                    <input type="date" name="ai_birth" id="ai_birth" value="" class="saveWS250" onkeyup="birthCheck()" oninput="birthCheck()">
                    <span id="birthText" class="dpib"></span>
                </td>
            </tr>
            <tr>
                <th>성격</th>
                <td>
                	<% 
                	for(int i=0;i<natureList.size();i++){
                		String anWord = natureList.get(i);
                        int anNum  = i + 1;

                	%>
						<input type="checkbox" name="an_num_link" value="<%=anNum  %>" onclick="natureCheck()"><%=anWord %>
                    <%
	                    if ((i + 1) % 5 == 0){
	                    	out.print("<br/>");
	                    }
                	}
                	
                    %>
                    <span id="natureText" class="dpib"></span>
                </td>
            </tr>
            <tr>
                <th>알레르기</th>
                <td>
                    <input type="text" name="ai_alergy" id="ai_alergy" value="" class="saveWS250" placeholder="알레르기가 없다면 '없음'이라고 입력해주세요." onblur="alergyCheck()">
                    <span id="alergyText" class="dpib"></span>
                </td>
            </tr>
            <tr>
                <th>병력사항</th>
                <td>
                    <input type="text" name="ai_disease" id="ai_disease" value="" class="saveWS250" placeholder="병력사항이 없다면 '없음'이라고 입력해주세요." onblur="diseaseCheck()">
                    <span id="diseaseText" class="dpib"></span>
                </td>
            </tr>
            <tr>
                <th>주의사항</th>
                <td>
                    <textarea name="ai_caution" id="ai_caution" class="saveWS100p saveHS100" placeholder="동구가 주의해야 할 점을 적어주세요. (안는 걸 싫어합니다, 손을 내밀면 할퀼 수 있으니 조심해주세요.)" onblur="cautionCheck()"></textarea>
                    <span id="cautionText" class="dpib"></span>
                </td>
            </tr>
        </table>
        <input type="submit" name="submit" id="submit" value="동물친구정보 입력완료!" class="saveBtnOne">
    </div>

</form>    

<%@include file="/Footer.jsp" %>

<script>
//선택한 소분류에 해당하는 at_num 값을 숨겨진 필드에 설정하는 함수
function updateAtNum() {
    var atNameSelect = document.getElementById("at_name");
    var selectedOption = atNameSelect.options[atNameSelect.selectedIndex];
    var atNumValue = selectedOption.value;  // at_num 값은 선택된 옵션의 value로 간주

    document.getElementById("at_num").value = atNumValue;  // 숨겨진 필드에 at_num 값 설정
}

// 소분류 선택 시마다 at_num 값을 갱신
document.getElementById("at_name").addEventListener("change", updateAtNum);

// 페이지 로드 시 기본적으로 설정
window.onload = function() {
    filterAnimalTypes();
    updateAtNum(); // 초기 로드 시 at_num 값을 설정
};

// 선택한 대분류에 따라 소분류 옵션을 필터링하는 함수
function filterAnimalTypes() {
    var BigAnimalOptions = document.getElementById("a_name").value;
    var smallAnimalOptions = document.getElementById("at_name").options;

    for (var i = 0; i < smallAnimalOptions.length; i++) {
        var option = smallAnimalOptions[i];
        if (option.getAttribute('data-parent') === BigAnimalOptions) {
            option.style.display = '';
        } else {
            option.style.display = 'none';
        }
    }
    
    for (var i = 0; i < smallAnimalOptions.length; i++) {
        var option = smallAnimalOptions[i];
        if (option.style.display === '') { 
            document.getElementById("at_name").value = option.value;
            break;
        }
    }
}

// 이미지 첨부 삭제 함수
function deleteFile() {
    var fileInput = document.getElementById('ai_img');
    var newFileInput = document.createElement('input');

    newFileInput.type = 'file';
    newFileInput.name = fileInput.name;
    newFileInput.id = fileInput.id;
    newFileInput.className = fileInput.className;
    newFileInput.style = fileInput.style;

    fileInput.parentNode.replaceChild(newFileInput, fileInput);

    var imageText = document.getElementById('imageText');
    imageText.innerHTML = '사진이 삭제되었습니다.';
    imageText.style.color = 'red';
}

//이름 유효성 검사
function nameCheck() {
    var nameCheckValue = document.getElementById('ai_name').value;
    var nameText = document.getElementById('nameText');

    var nameRegex = /^[가-힣]{2,10}$/;

    if (nameRegex.test(nameCheckValue)) {
        nameText.innerHTML = '';
        nameText.style.color = 'green';
        return true;
    } else {
        nameText.innerHTML = '이름을 입력해주세요.(특수문자 사용불가)';
        nameText.style.color = 'red';
        return false;
    }
}

// 사진 유효성 검사 함수
 var imageInput = document.getElementById('ai_img');
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
    }

// 생년월일 유효성 검사 함수
 function birthCheck() {
        var birthInput = document.getElementById('ai_birth').value;
        var birthText = document.getElementById('birthText');
        
        if (birthInput) {
            birthText.innerHTML = '';
            return true;
        } else {
            birthText.innerHTML = '생년월일을 입력해주세요.';
            birthText.style.color = 'red';
            return false;
        }
    }

// 성격 유효성 검사 함수
function natureCheck() {
        var natureCheckboxes = document.getElementsByName('an_num_link');
        var natureText = document.getElementById('natureText');
        var isChecked = false;

        for (var i = 0; i < natureCheckboxes.length; i++) {
            if (natureCheckboxes[i].checked) {
                isChecked = true;
                break;
            }
        }

        if (isChecked) {
            natureText.innerHTML = '';
            natureText.style.color = 'green';
            return true;
        } else {
            natureText.innerHTML = '성격을 하나 이상 선택해주세요.';
            natureText.style.color = 'red';
            return false;
        }
    }

// 알레르기 유효성 검사 함수
function alergyCheck() {
    var alergyCheckValue = document.getElementById('ai_alergy').value;
    var alergyText = document.getElementById('alergyText');
    var alergyRegex = /^[가-힣\s]{2,50}$/;

    if (alergyRegex.test(alergyCheckValue)) {
        alergyText.innerHTML = '';
        alergyText.style.color = 'green';
        return true;
    } else {
        alergyText.innerHTML = '알레르기를 입력해주세요.(특수문자 사용불가)';
        alergyText.style.color = 'red';
        return false;
    }
}

// 병력사항 유효성 검사 함수
function diseaseCheck() {
    var diseaseCheckValue = document.getElementById('ai_disease').value;
    var diseaseText = document.getElementById('diseaseText');
    var diseaseRegex = /^[가-힣\s]{2,50}$/;

    if (diseaseRegex.test(diseaseCheckValue)) {
        diseaseText.innerHTML = '';
        diseaseText.style.color = 'green';
        return true;
    } else {
        diseaseText.innerHTML = '병력사항을 입력해주세요.(특수문자 사용불가)';
        diseaseText.style.color = 'red';
        return false;
    }
}

// 주의사항 유효성 검사 함수
function cautionCheck() {
    var cautionCheckValue = document.getElementById('ai_caution').value;
    var cautionText = document.getElementById('cautionText');
    var cautionRegex = /^[가-힣\s]{2,200}$/;

    if (cautionRegex.test(cautionCheckValue)) {
        cautionText.innerHTML = '';
        cautionText.style.color = 'green';
        return true;
    } else {
        cautionText.innerHTML = '주의사항을 입력해주세요.(특수문자 사용불가)';
        cautionText.style.color = 'red';
        return false;
    }
}

// 폼 유효성 검사 함수
function validateForm() {
    var checkValid = true;

    if (!nameCheck()) checkValid = false;
    if (!imageCheck()) checkValid = false;
    if (!birthCheck()) checkValid = false;
    if (!natureCheck()) checkValid = false;
    if (!alergyCheck()) checkValid = false;
    if (!diseaseCheck()) checkValid = false;
    if (!cautionCheck()) checkValid = false;

    console.log("유효성 검사 결과:", checkValid);
    return checkValid;
}

document.querySelector('form').onsubmit = function(event) {
    if (!validateForm()) {
        event.preventDefault();
    }
};
</script>
</body>
</html>