<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.sql.Date"%> 
<%@ page import="java.io.StringWriter"%>
<%@ page import="java.io.PrintWriter"%>

<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mdto" class="com.DongGu.member.memberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.DongGu.member.memberDAO"></jsp:useBean>

<%

// 파일 업로드 처리
String savePath = application.getRealPath("/") + "uploaded_files";
MultipartRequest mr = new MultipartRequest(request, savePath, 10 * 1024 * 1024, "utf-8");
String uploadedFileName = mr.getFilesystemName("p_img");

// 현재 날짜로 p_date 설정
java.sql.Date p_date = new java.sql.Date(System.currentTimeMillis());  // java.sql.Date를 명시적으로 사용

// 폼 데이터 처리
String p_id = mr.getParameter("p_id");
String p_pwd = mr.getParameter("p_pwd");
String p_name = mr.getParameter("p_name");
String p_gender = mr.getParameter("p_gender");
String p_smoke = mr.getParameter("p_smoke");
String p_nickname = mr.getParameter("p_nickname");

String p_tel = mr.getParameter("p_tel1") + "-" + mr.getParameter("p_tel2") + "-" + mr.getParameter("p_tel3");
String p_addr = mr.getParameter("p_addr1") + " " + mr.getParameter("p_addr2");
String p_jumin = mr.getParameter("p_jumin1") + "-" + mr.getParameter("p_jumin");

String p_ex_my = mr.getParameter("p_ex_my");
String p_ex_other = mr.getParameter("p_ex_other");
String p_ex_etc = mr.getParameter("p_ex_etc");
String q_num = mr.getParameter("q_num");
String p_answer = mr.getParameter("p_answer");
String p_bank_name = mr.getParameter("p_bank_name");
String p_bank_num = mr.getParameter("p_bank_num");

// DTO에 값 설정
mdto.setP_img(uploadedFileName);
mdto.setP_id(p_id);
mdto.setP_pwd(p_pwd);
mdto.setP_name(p_name);
mdto.setP_gender(p_gender != null && !p_gender.trim().isEmpty() ? Integer.parseInt(p_gender) : 0);
mdto.setP_smoke(p_smoke != null && !p_smoke.trim().isEmpty() ? Integer.parseInt(p_smoke) : 0);
mdto.setP_nickname(p_nickname);
mdto.setP_tel(p_tel);
mdto.setP_addr(p_addr);
mdto.setP_jumin(p_jumin);
mdto.setP_ex_my(p_ex_my);
mdto.setP_ex_other(p_ex_other);
mdto.setP_ex_etc(p_ex_etc);
mdto.setQ_num(q_num != null && !q_num.trim().isEmpty() ? Integer.parseInt(q_num) : 0);
mdto.setP_answer(p_answer);
mdto.setP_date(p_date);  // java.sql.Date를 명시적으로 사용
mdto.setP_bank_name(p_bank_name);
mdto.setP_bank_num(p_bank_name);

// 여기에 L_NUM을 5으로 설정
mdto.setG_num(5);  // 등급번호를 5으로 설정

System.out.println("p_date: " + p_date); // p_date 값 확인

// 데이터베이스에 저장 등 필요한 처리 수행
int result = 0;
try {
    System.out.println("Before calling MemberJoinDonggu");
    result = mdao.MemberJoinDonggu(mdto);
    System.out.println("After calling MemberJoinDonggu");
} catch (Exception e) {
    System.out.println("Exception caught!");
    e.printStackTrace(); // 구체적인 오류 메시지 확인
    
    // 예외 내용을 JSP 페이지에 출력
    StringWriter sw = new StringWriter();
    PrintWriter pw = new PrintWriter(sw);
    e.printStackTrace(pw);
    
    out.println("<p>Exception occurred: " + e.getMessage() + "</p>");
    out.println("<pre>" + sw.toString() + "</pre>");
}

String msg = result > 0 ? "회원가입 성공!" : "회원가입 실패!";
%>

<script>
window.alert('<%=msg%>');
location.href='MemberJoinDonggu.jsp';
</script>
