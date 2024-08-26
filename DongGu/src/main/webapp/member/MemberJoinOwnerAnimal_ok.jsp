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
    String savePath = application.getRealPath("/") + "img/animal/";
    MultipartRequest mr = new MultipartRequest(request, savePath, 10 * 1024 * 1024, "utf-8");

    // 업로드된 파일 이름을 DTO에 설정
    String uploadedFileName = mr.getFilesystemName("ai_img");
    adto.setAi_img(uploadedFileName);

    // o_id 설정
    String o_id = (String) session.getAttribute("o_id");
    adto.setO_id(o_id);
    
    // 동물 품종번호 설정
    String at_numStr = mr.getParameter("at_num");
		if (at_numStr != null && !at_numStr.trim().isEmpty()) {
		    int at_num = Integer.parseInt(at_numStr);
		    adto.setAt_num(at_num);
		} else {
		    throw new Exception("AT_NUM cannot be null or empty");
		}

    System.out.println("Received at_numStr: " + at_numStr);

    // 성별 설정
    String genderStr = mr.getParameter("ai_gender");
    if (genderStr != null && !genderStr.isEmpty()) {
        try {
            int ai_gender = Integer.parseInt(genderStr);
            adto.setAi_gender(ai_gender);
        } catch (NumberFormatException e) {
            throw new Exception("Invalid gender value: " + genderStr);
        }
    }
    
    // 이름 설정
    String ai_name = mr.getParameter("ai_name");
    if (ai_name != null && !ai_name.isEmpty()) {
        adto.setAi_name(ai_name);
    } else {
        throw new Exception("AI_NAME cannot be null or empty");
    }

    // 생년월일 설정
    String ai_birth = mr.getParameter("ai_birth");
    if (ai_birth != null && !ai_birth.isEmpty()) {
        adto.setAi_birth(ai_birth);
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
        adto.setAi_alergy(""); // 빈 문자열로 설정하여 NULL 방지
    }

    // 병력사항 설정
    String ai_disease = mr.getParameter("ai_disease");
    if (ai_disease != null && !ai_disease.isEmpty()) {
        adto.setAi_disease(ai_disease);
    } else {
        adto.setAi_disease(""); // 빈 문자열로 설정하여 NULL 방지
    }

    // 주의사항 설정
    String ai_caution = mr.getParameter("ai_caution");
    if (ai_caution != null && !ai_caution.isEmpty()) {
        adto.setAi_caution(ai_caution);
    } else {
        adto.setAi_caution(""); // 빈 문자열로 설정하여 NULL 방지
    }

    // 데이터베이스 작업 수행
    int result = adao.MemberJoinOwnerAnimal(adto);
    String msg = result > 0 ? "동물정보 입력완료!" : "동물정보 입력실패!";

    // 결과 메시지를 클라이언트에게 알림
%>
    <script>
    window.alert('<%=msg%>');
    location.href='/DongGu/Index.jsp';
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
