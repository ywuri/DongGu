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

    // 공통 입력값 읽기
    String pwd = mr.getParameter("pwd");
    String pwdcheck = mr.getParameter("pwdcheck");
 	
    // 고용자 입력값 읽기    
    String o_nickname = mr.getParameter("o_nickname");
    String o_tel = mr.getParameter("o_tel");
    String o_addr = mr.getParameter("o_addr");
    
    // 구직자 입력값 읽기
    String p_smoke = mr.getParameter("p_smoke");
    String p_nickname = mr.getParameter("p_nickname");
    String p_tel = mr.getParameter("p_tel");
    String p_addr = mr.getParameter("p_addr");
    String p_img = mr.getParameter("p_img");

    MyPageDAO dao = new MyPageDAO();
    MyPageDTO dto = new MyPageDTO();

    String m_sid = (String) session.getAttribute("sid");
    Integer m_usertype = (Integer) session.getAttribute("usertype");

    boolean isPasswordValid = pwd.equals(pwdcheck);

    if (m_usertype == 0) { // 고용자
        if (isPasswordValid) {
            dto.setO_nickname(o_nickname);
            dto.setO_tel(o_tel);
            dto.setO_addr(o_addr);

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
            } else {
                // 이미지 파일이 없으면 기존 이미지 경로를 유지
                dto.setP_img(p_img);
            }

            int smoking = Integer.parseInt(p_smoke);
            dto.setP_smoke(smoking);
            dto.setP_nickname(p_nickname);
            dto.setP_tel(p_tel);
            dto.setP_addr(p_addr);

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

    // 파일 확장자 추출 메소드
    String getFileExtension(String fileName) {
        int dotIndex = fileName.lastIndexOf("."); // 파일명에서 마지막 점(.)의 위치 찾음
        return dotIndex == -1 ? "" : fileName.substring(dotIndex + 1);
        // 점(.)이 없는 경우(dotIndex == -1), 빈 문자열을 반환
        // 점(.)이 있는 경우, 점 다음부터 끝까지의 문자열을 반환하여 확장자를 추출
    }
%>
