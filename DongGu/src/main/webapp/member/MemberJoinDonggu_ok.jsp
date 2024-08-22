<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.sql.Date"%> 
<%@ page import="java.io.StringWriter"%>
<%@ page import="java.io.PrintWriter"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import ="java.io.*"%>

<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="mdto" class="com.DongGu.member.memberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.DongGu.member.memberDAO"></jsp:useBean>

<%

// 파일 업로드 처리
String uploadPath = request.getRealPath("/") + "img/petsitter_profile/temp"; // 임시 저장 경로
String savepath = request.getRealPath("/")+"img/petsitter_profile/";
MultipartRequest mr = new MultipartRequest(request, uploadPath, 10 * 1024 * 1024, "utf-8");
String originalFileName = mr.getFilesystemName("p_img");
String newFileName="";
//사진이 첨부됐으면
if (originalFileName != null) {
   String jpgType = "";//확장자 추출
   int lastDotIndex = originalFileName.lastIndexOf(".");
   if (lastDotIndex > 0) {
      jpgType = originalFileName.substring(lastDotIndex); // 예: ".jpg"
   }

   //새 파일 이름 생성 (확장자 유지)
   newFileName = generateUniqueFileName( savepath, "profile", jpgType); // 예: "free1.jpg"

   // 파일 경로 객체 생성
   File tempFile = new File(uploadPath, originalFileName);
   File finalFile = new File(savepath, newFileName);

   // 파일이 존재하면 삭제
  if (finalFile.exists()) {
      if (!finalFile.delete()) {
          throw new IOException("기존 파일 삭제에 실패했습니다: " + finalFile.getName());
      }
      //System.out.println("기존 파일 삭제 완료: " + finalFile.getName());
  }

   
   
  // 파일 이름 변경 (이동)
  if (tempFile.renameTo(finalFile)) {
      //System.out.println("파일이 성공적으로 이동되었습니다: " + newFileName);
  } else {
      //System.out.println("파일 이동에 실패했습니다: " + originalFileName);
  }
}

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
String p_jumin = mr.getParameter("p_jumin1") + "-" + mr.getParameter("p_jumin2");

String p_ex_my = mr.getParameter("p_ex_my");
String p_ex_other = mr.getParameter("p_ex_other");
String p_ex_etc = mr.getParameter("p_ex_etc");
String q_num = mr.getParameter("q_num");
String p_answer = mr.getParameter("p_answer");
String p_bank_name = mr.getParameter("p_bank_name");
String p_bank_num = mr.getParameter("p_bank_num");

// DTO에 값 설정
mdto.setP_img(newFileName);
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
mdto.setP_bank_num(p_bank_num);

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

<%!
    // 파일명 생성 메소드
    String generateUniqueFileName(String dirPath, String prefix, String extension) {
       //C:\student_java\semiTeam2\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\DongGu\img\petsitter_profile    
      File dir = new File(dirPath); // 위의 경로를 사용해 파일 객체 생성 
        File[] files = dir.listFiles(); // 디렉토리 내의 모든 파일과 디렉토리 목록을 배열로 가져옴
        int maxNumber = 0; // 최대 번호 초기화

        if (files != null) { // 디렉토리가 존재하고 파일이 있는 경우
            for (File file : files) {
               // 파일이 실제 파일인지(file.isFile()), 접두사(profile)로 시작하는지, 지정된 확장자로 끝나는지 확인
                if (file.isFile() && file.getName().startsWith(prefix) && file.getName().endsWith("." + extension)) {
                    String fileName = file.getName();
                    String numberPart = fileName.substring(prefix.length(), fileName.length() - extension.length() - 1); // 파일명에서 숫자 부분 추출
                    // prefix.length() - profile(7), fileName.length() - profile5.png(12), extension.length() - png(3) 
                    // fileName.substring(7, 8) - (숫자부분)
                    try {
                        int number = Integer.parseInt(numberPart);
                        if (number > maxNumber) {
                            maxNumber = number;
                        }
                    } catch (NumberFormatException e) {
                        // 파일명에서 숫자 부분이 없을 경우
                    }
                }
            }
        }

        // 새로운 파일명 생성
        int newNumber = maxNumber + 1; // 5 + 1 = 6
        return prefix + newNumber + "." + extension;
}
%>

