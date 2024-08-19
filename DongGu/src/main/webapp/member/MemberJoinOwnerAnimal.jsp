<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="adao" class="com.DongGu.animal.animalDAO" scope="page"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">

<!-- JavaScript 함수 정의 -->
<script>
window.onload = function() { 
    filterAnimalTypes(); // 페이지가 로드될 때 기본 필터링 수행
};

// 선택한 대분류에 따라 소분류 옵션을 필터링하는 함수
function filterAnimalTypes() {
    var BigAnimalOptions = document.getElementById("a_name").value;
    var smallAnimalOptions = document.getElementById("at_num").options;

    // 모든 소분류 옵션에 대해 반복
    for (var i = 0; i < smallAnimalOptions.length; i++) {
        var option = smallAnimalOptions[i];
        if (option.getAttribute('data-parent') === BigAnimalOptions) {
            option.style.display = ''; // 조건에 맞는 옵션을 표시
        } else {
            option.style.display = 'none'; // 조건에 맞지 않는 옵션을 숨김
        }
    }
    
    // 현재 대분류에 맞는 첫 번째 소분류 옵션을 자동 선택
    for (var i = 0; i < smallAnimalOptions.length; i++) {
        var option = smallAnimalOptions[i];
        if (option.style.display === '') {  // 현재 보이는 옵션 중 첫 번째 것을 찾음
            document.getElementById("at_num").value = option.value; // 그 옵션을 선택함
            break; // 첫 번째 옵션을 찾았으므로 반복을 멈춤
        }
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
<%@include file="/SubHeader.jsp" %>

<!-- JSP를 사용해 Java 객체를 페이지에 주입 -->
<%
List<String[]> BigAnimalList = adao.animalList(); // 대분류 동물종류 목록 가져오기
List<String[]> SmallAnimalList = adao.animalTypeList(); // 소분류 동물종류 목록 가져오기
List<String> natureList = adao.animalNature(); // 동물성격 목록 가져오기
%>

<%
//세션에서 오너ID/사용자ID 가져오기
String ownerId = (String) session.getAttribute("o_id"); // 세션에서 o_id 가져오기
String userId = (String) session.getAttribute("sid"); // 세션에서 sid 가져오기

if (ownerId == null || userId == null) {
    response.sendRedirect("login.jsp"); // 세션이 만료되어 오너 ID가 없다면 로그인 페이지로 이동
    return;
}

// 파일 업로드

if (request.getMethod().equalsIgnoreCase("POST")) {
    // 파일 업로드 설정 및 저장 경로 생성
    String savepath = application.getRealPath("/") + "uploaded_files"; // 저장할 경로 설정
    File saveDir = new File(savepath);

    // 경로가 존재하지 않으면 폴더 생성
    if (!saveDir.exists()) {
        saveDir.mkdirs();
    }

    // MultipartRequest 객체 생성하여 파일 업로드 처리
    MultipartRequest mr = new MultipartRequest(request, savepath, 10 * 1024 * 1024, "utf-8"); // 최대 10MB 파일 업로드 설정

    // 업로드된 파일 이름 가져오기
    String uploadedFileName = mr.getFilesystemName("ai_img"); // "ai_img"는 form의 input name

    // 폼 데이터 처리
    String a_name = mr.getParameter("a_name");
    String at_name = mr.getParameter("at_name");
    String ai_name = mr.getParameter("ai_name");
    String ai_gender = mr.getParameter("ai_gender");
    String ai_birth = mr.getParameter("ai_birth");
    String ai_alergy = mr.getParameter("ai_alergy");
    String ai_disease = mr.getParameter("ai_disease");
    String ai_caution = mr.getParameter("ai_caution");

    // 성격 정보 연결 처리
    String[] checkNature = mr.getParameterValues("an_num_link");
    String natureString = "";
    if (checkNature != null) {
        natureString = String.join(" | ", checkNature);
    }

    // DB에 데이터 저장 메서드 호출 (생략)
    // adao.saveAnimalInfo(ownerId, a_name, at_name, ai_name, ai_gender, ai_birth, ai_alergy, ai_disease, ai_caution, uploadedFileName, natureString);
}
%>

<!-- 폼 시작 -->
<form name="MemberJoinOwnerAnimal" action="MemberJoinOwnerAnimal_ok.jsp" method="post" enctype="multipart/form-data">
    <div class="saveTableOne">
        <h3>내 반려동물 정보를 입력해주세요!</h3>
        <table>
            <tr>
                <th>종류</th>
                <td>
                    <!-- 대분류 선택 필드 -->
                    <select name="a_name" id="a_name" class="saveWS260" onchange="filterAnimalTypes()">
                        <!-- 대분류 목록을 JSP 스크립트로 동적 생성 -->
                        <%
                            for (String[] arr : BigAnimalList) {
                                // "강아지"가 기본 선택되도록 설정
                                String selected = arr[1].equals("강아지") ? "selected" : "";
                        %>
                        <!-- 각 옵션의 값과 텍스트 설정, "강아지"는 selected 속성 추가 -->
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
                     <!-- 소분류 선택 필드 -->
                     <select name="at_num" id="at_num" class="saveWS260">
                        <!-- 소분류 목록을 JSP 스크립트로 동적 생성 -->
                        <%
                            for (String[] arr : SmallAnimalList) {
                                // 각 소분류 옵션에 'data-parent' 속성을 추가하여 어떤 대분류에 속하는지 표시
                                String parent = arr[1];
                        %>
                        <!-- data-parent 속성은 소분류가 어느 대분류에 속하는지 나타냄 -->
                        <option value="<%=arr[0] %>" data-parent="<%=parent %>"><%=arr[2] %></option>
                        <%
                            }
                        %>

                    </select>
                </td>
            </tr>
            <!-- 나머지 폼 필드들 -->
            <tr>
                <th>이름</th>
                <td>
                    <input type="text" name="ai_name" id="ai_name" value="" class="saveWS250">
                </td>
            </tr>
            <tr>
                <th>성별</th>
                <td>
                    <input type="radio" name="ai_gender" id="ai_gender1" value="1" class=""><label for="ai_gender1">남자</label>
                    <input type="radio" name="ai_gender" id="ai_gender2" value="2" class=""><label for="ai_gender2">여자</label>
                </td>
            </tr>
            <tr>
                <th>사진</th>
                <td style="display: flex; align-items: baseline; gap: 10px;">
                <div>
                    <input type="file" name="ai_img"  id="ai_img" accept=".jpg,.jpeg,.png,.gif" class="saveWS250">
                    <p style="color: #b2b2b2; font-size: 14px; margin-top: 5px;">사진첨부는 jpg,png,gif 파일만 가능합니다.</p>
                </div>
                    <button type="button" onclick="deleteFile()">삭제</button>
                </td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td>
                    <input type="date" name="ai_birth" id="ai_birth" value="" class="saveWS250">
                </td>
            </tr>
            <tr>
                <th>성격</th>
                <td>
                	<% 
                	for(int i=0;i<natureList.size();i++){
                		String anWord = natureList.get(i); // 성격 설명
                        int anNum  = i + 1; // 성격 번호 (예를 들어 순서대로 1, 2, 3 등)

                	%>
						<input type="checkbox" name="an_num_link"  id="an_num_link" value="<%=anNum  %>"><%=anWord %>
                    <%
	                    if ((i + 1) % 5 == 0){
	                    	out.print("<br/>");
	                    }
                	}
                    %>
                    
                </td>
            </tr>
            <tr>
                <th>알레르기</th>
                <td>
                    <input type="text" name="ai_alergy" id="ai_alergy" value="" class="saveWS250">
                </td>
            </tr>
            <tr>
                <th>병력사항</th>
                <td>
                    <input type="text" name="ai_disease" id="ai_disease" value="" class="saveWS250">
                </td>
            </tr>
            <tr>
                <th>주의사항</th>
                <td>
                    <textarea name="ai_caution" id="ai_caution" class="saveWS100p saveHS100" placeholder="동구가 주의해야 할 점을 적어주세요. (안는 걸 싫어합니다, 손을 내밀면 할퀼 수 있으니 조심해주세요.)"></textarea>
                </td>
            </tr>
            <input type="hidden" name="o_id"  id="o_id" value="<%= ownerId %>">
        </table>
        <!-- 폼 제출 버튼 -->
        <input type="submit" name="" id="" value="동물친구정보 입력완료!" class="saveBtnOne" onclick="checkValue();">
    </div>
	
</form>    
<script>
function checkValue(){
	   var bda = document.MemberJoinOwnerAnimal.o_id.value;
	   window.alert(bda);
	}
</script>
<%@include file="/Footer.jsp" %>

</body>
</html>
