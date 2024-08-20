<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.io.File" %>
<%@ page import="com.DongGu.mypage.MyPageDAO" %>    
<%@ page import="com.DongGu.mypage.MyPageDTO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
    String uploadDir = getServletContext().getRealPath("/") + "img/petsitter_profile/";
    MultipartRequest mr = new MultipartRequest(request, uploadDir, 10485760, "utf-8", new DefaultFileRenamePolicy());

    String pwd2 = mr.getParameter("pwd");
    String pwdcheck2 = mr.getParameter("pwdcheck");
    String p_smoke2 = mr.getParameter("p_smoke");
    String p_nickname2 = mr.getParameter("p_nickname");
    String p_tel2 = mr.getParameter("p_tel");
    String p_addr2 = mr.getParameter("p_addr");

    MyPageDAO dao = new MyPageDAO();
    MyPageDTO dto = new MyPageDTO();

    String m_sid = (String) session.getAttribute("sid");
    Integer m_usertype = (Integer) session.getAttribute("usertype");

    String pwd = mr.getParameter("pwd");
    String pwdcheck = mr.getParameter("pwdcheck");

    boolean isPasswordValid = pwd.equals(pwdcheck);

    if (m_usertype == 0) { // 고용자
        if (isPasswordValid) {
            String nickname = mr.getParameter("nickname");
            String tel = mr.getParameter("tel");
            String addr = mr.getParameter("addr");

            dto.setO_nickname(nickname);
            dto.setO_tel(tel);
            dto.setO_addr(addr);

            boolean check = dao.mypage_InfoUpdate2(m_sid, m_usertype, pwd);
            if (check) {
                int result = dao.mypage_InfoUpdate3(dto, m_sid, m_usertype);
                if (result == 1) {
%>
                    <script>
                        window.alert('정보가 성공적으로 수정되었습니다!');
                        location.href='/DongGu/mypage/MyPage_InfoUpdate.jsp';
                    </script>
<%
                } else {
%>
                    <script>
                        window.alert('정보 수정에 실패하였습니다!');
                        location.href='/DongGu/mypage/MyPage_InfoUpdate.jsp';
                    </script>
<%
                }
            } else {
%>
                <script>
                    window.alert('비밀번호를 제대로 입력하세요!');
                    location.href='/DongGu/mypage/MyPage_InfoUpdate.jsp';
                </script>
<%
            }
        } else {
%>
            <script>
                window.alert('비밀번호와 비밀번호 확인이 일치하지 않습니다!');
                location.href='/DongGu/mypage/MyPage_InfoUpdate.jsp';
            </script>
<%
        }
    } else if (m_usertype == 1) { // 구직자
        if (isPasswordValid) {
            // 이미지 업로드 처리
            File file = mr.getFile("profileImage"); // "profileImage"는 form의 input name 속성과 일치
            if (file != null && file.length() > 0) {
                String fileName = file.getName();
                String fileExtension = getFileExtension(fileName);

                // 파일명 생성 로직
                String newFileName = generateUniqueFileName(uploadDir, "profile", fileExtension); // 확장자를 포함하여 파일명 생성
                File newFile = new File(uploadDir + newFileName);

                // 파일 이름 변경
                file.renameTo(newFile);

                // DTO에 이미지 경로 설정         
                dto.setP_img(newFileName);
            }

            int smoking = Integer.parseInt(p_smoke2);
            dto.setP_smoke(smoking);
            dto.setP_nickname(p_nickname2);
            dto.setP_tel(p_tel2);
            dto.setP_addr(p_addr2);

            boolean check = dao.mypage_InfoUpdate2(m_sid, m_usertype, pwd2);
            if (check) {
                int result = dao.mypage_InfoUpdate3(dto, m_sid, m_usertype);
                if (result == 1) {
%>
                    <script>
                        window.alert('정보가 성공적으로 수정되었습니다!');
                        location.href='/DongGu/mypage/MyPage_InfoUpdate.jsp';
                    </script>
<%
                } else {
%>
                    <script>
                        window.alert('정보 수정에 실패하였습니다!');
                        location.href='/DongGu/mypage/MyPage_InfoUpdate.jsp';
                    </script>
<%
                }
            } else {
%>
                <script>
                    window.alert('비밀번호를 제대로 입력하세요!');
                    location.href='/DongGu/mypage/MyPage_InfoUpdate.jsp';
                </script>
<%
            }
        } else {
%>
            <script>
                window.alert('비밀번호와 비밀번호 확인이 일치하지 않습니다!');
                location.href='/DongGu/mypage/MyPage_InfoUpdate.jsp';
            </script>
<%
        }
    } else {
%>
    <script>
        window.alert('잘못된 사용자 유형입니다!');
        location.href='/DongGu/mypage/MyPage_InfoUpdate.jsp';
    </script>
<%
    }
%>

<%!
    // 파일명 생성 메소드
    String generateUniqueFileName(String dirPath, String prefix, String extension) {
        File dir = new File(dirPath);
        File[] files = dir.listFiles();
        int maxNumber = 0;

        if (files != null) {
            for (File file : files) {
                if (file.isFile() && file.getName().startsWith(prefix) && file.getName().endsWith("." + extension)) {
                    String fileName = file.getName();
                    String numberPart = fileName.substring(prefix.length(), fileName.length() - extension.length() - 1); // 파일명에서 숫자 부분 추출
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
        int newNumber = maxNumber + 1;
        return prefix + newNumber + "." + extension;
    }

    // 파일 확장자 추출 메소드
    String getFileExtension(String fileName) {
        int dotIndex = fileName.lastIndexOf(".");
        return dotIndex == -1 ? "" : fileName.substring(dotIndex + 1);
    }
%>
