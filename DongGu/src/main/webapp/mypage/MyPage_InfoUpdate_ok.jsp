<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<%@ page import="com.DongGu.mypage.MyPageDAO" %>    
<%@ page import="com.DongGu.mypage.MyPageDTO" %>
<jsp:useBean id="dto" class="com.DongGu.mypage.MyPageDTO"></jsp:useBean>  
<jsp:setProperty property="*" name="dto"/>  
<jsp:useBean id="dao" class="com.DongGu.mypage.MyPageDAO"></jsp:useBean>
<%
    String m_sid = (String)session.getAttribute("sid");
    String m_sname = (String)session.getAttribute("sname");
    Integer m_usertype = (Integer)session.getAttribute("usertype");  
 
    String pwd = request.getParameter("pwd");
    String pwdcheck = request.getParameter("pwdcheck");

    if (pwd.equals(pwdcheck)) {
        // 공통 파라미터
        String nickname = request.getParameter("nickname");
        String tel = request.getParameter("tel");
        String addr = request.getParameter("addr");

        // DTO에 값 설정 (구직자, 고용자 구분)
        if (m_usertype == 0) { // 고용자
            dto.setO_nickname(nickname);
            dto.setO_tel(tel);
            dto.setO_addr(addr);
        } else if (m_usertype == 1) { // 구직자
            int smoking = Integer.parseInt(request.getParameter("smoking"));
            dto.setP_smoke(smoking);
            dto.setP_nickname(nickname);
            dto.setP_tel(tel);
            dto.setP_addr(addr);
        }

        // 비밀번호 체크 및 정보 업데이트
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
%>