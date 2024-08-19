<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.sql.*" %>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="adto" class="com.DongGu.animal.animalDTO" scope="request"></jsp:useBean>
<jsp:setProperty property="*" name="adto"/>
<jsp:useBean id="adao" class="com.DongGu.animal.animalDAO" scope="request"></jsp:useBean>

<%
try {
    // 파일 업로드 처리
    String savePath = application.getRealPath("/") + "uploaded_files";
    MultipartRequest mr = new MultipartRequest(request, savePath, 10 * 1024 * 1024, "utf-8");
    
    /** 
    1. application.getRealPath("/")는 현재 디렉토리의 실제 경로를 가져옴 
    2. uploaded_files 문자열은 파일이 저잘될 디렉토리 이름, 실제로 파일이 저장되는 경로는 > C:/Tomcat/webapps/yourApp/uploaded_files
    3. MultipartRequest은 com.oreilly.servlet 패키지에서 제공되는 클래스, 파일 업로드를 쉽게 처리할 수 있도록 도와줌
    4. request 매개변수는 HttpServletRequest객체를 나타내는데, 사용자가 웹브라우저에서 서버로 제출한 모든 데이터를 담고있음
    5. MultipartRequest은 request객체를 사용하여 업로드된 파일과 폼 데이터 처리를 함
    6. savaPath는 업로드된 파일이 서버의 어느경로에 저장될지 나타냄
    7. 1024 : 1KB / 1024 * 1024 : 1MB / 10 * 1024 * 1024 : 10MB / 10MB 초과하면 예외 발생
    */
    
 	// 업로드된 파일 이름을 DTO에 설정
    String uploadedFileName = mr.getFilesystemName("ai_img"); // 업로드 된 실제 파일명 가져오기
    adto.setAi_img(uploadedFileName); // 가져온 파일명을 adto객체의 ai_img 속성에 설정

    // o_id 설정
    String o_id = (String) session.getAttribute("o_id");
    adto.setO_id(o_id);
    
    // 동물 품종번호 설정
    String at_numStr = mr.getParameter("at_num");
    int at_num = Integer.parseInt(at_numStr);
    adto.setAt_num(at_num);

    // 성별 설정
    String genderStr = mr.getParameter("ai_gender"); // 전송된 성별 값 가져오기
    if (genderStr != null && !genderStr.isEmpty()) { // 성별 값이 null이 아니고 비어있지 않은지 확인
        int ai_gender = Integer.parseInt(genderStr); // 성별값을 정수로 변환
        adto.setAi_gender(ai_gender);
    }

    // 이름 설정
    String ai_name = mr.getParameter("ai_name");
    if (ai_name != null && !ai_name.isEmpty()) {
        adto.setAi_name(ai_name);
    } else {
        throw new Exception("AI_NAME cannot be null or empty"); // 이름값이 비어있으면 예외 발생(필수항목)
    }

    // 생년월일 설정
    String ai_birth = mr.getParameter("ai_birth");
    if (ai_birth != null && !ai_birth.isEmpty()) {
        adto.setAi_birth(ai_birth);  // animalDTO의 ai_birth는 String이므로 그대로 설정
    } else {
        throw new Exception("AI_BIRTH cannot be null or empty");
    }

    // 성격 설정
    String[] natureArray = mr.getParameterValues("an_num_link");
    if (natureArray != null) {
        String natureString = String.join(" | ", natureArray);
        adto.setAn_num_link(natureString);
    } else {
        throw new Exception("AN_NUM_LINK cannot be null or empty");
    }

    // 알레르기 설정
    String ai_alergy = mr.getParameter("ai_alergy");
    if (ai_alergy != null && !ai_alergy.isEmpty()) {
        adto.setAi_alergy(ai_alergy);
    } else {
        adto.setAi_alergy("");  // 빈 문자열로 설정하여 NULL 방지
    }

    // 병력사항 설정
    String ai_disease = mr.getParameter("ai_disease");
    if (ai_disease != null && !ai_disease.isEmpty()) {
        adto.setAi_disease(ai_disease);
    } else {
        adto.setAi_disease("");  // 빈 문자열로 설정하여 NULL 방지
    }

    // 주의사항 설정
    String ai_caution = mr.getParameter("ai_caution");
    if (ai_caution != null && !ai_caution.isEmpty()) {
        adto.setAi_caution(ai_caution);
    } else {
        adto.setAi_caution("");  // 빈 문자열로 설정하여 NULL 방지
    }

    // 데이터베이스 작업 수행
    int result = adao.MemberJoinOwnerAnimal(adto);
    String msg = result > 0 ? "동물정보 입력완료!" : "동물정보 입력실패!";

    // 결과 메시지를 클라이언트에게 알림
%>
    <script>
    window.alert('<%=msg%>');
    location.href='MemberJoinOwnerAnimal.jsp';
    </script>
<%
} catch (NumberFormatException e) {
    e.printStackTrace();
%>
    <script>
    window.alert('잘못된 입력입니다. 다시 시도해주세요.');
    location.href='MemberJoinOwnerAnimal.jsp';
    </script>
<%
} catch (Exception e) {
    e.printStackTrace();
%>
    <script>
    window.alert('오류가 발생했습니다. 다시 시도해주세요.');
    location.href='MemberJoinOwnerAnimal.jsp';
    </script>
<%
}
%>
