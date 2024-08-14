<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="com.DongGu.member.memberDAO" scope="page"></jsp:useBean>
<%
String userid = request.getParameter("userid");
String userpwd = request.getParameter("userpwd");

int result = mdao.loginCheck(userid, userpwd);

if(result == mdao.LOGIN_OK){
    String username = mdao.getUserInfo(userid, session);
    String nickname = (String) session.getAttribute("snickname");
    Integer usertype = (Integer) session.getAttribute("usertype"); // usertype을 세션에서 가져옴
    
    session.setAttribute("sid", userid);
    session.setAttribute("o_id", "owner_" + userid); // 오너 ID (예시로 owner_ 접두사를 추가, 실제 로직에 맞게 수정 필요)
    session.setAttribute("sname", username);
    session.setAttribute("snickname", nickname);
    session.setAttribute("usertype", usertype); // usertype 값을 세션에 저장
    session.setMaxInactiveInterval(60 * 60); // 세션 유효 시간을 1시간으로 설정

    %>
    <script>
        window.alert('<%=nickname%>님 환영합니다!');
        //opener.window.location.reload();
        window.self.close();
        location.href="../Index.jsp";
    </script>
    <%
} else if(result == mdao.NOT_ID || result == mdao.NOT_PWD){
    %>
    <script>
    window.alert('아이디 또는 비밀번호가 잘못되었습니다.');
    location.href="login.jsp";
    </script>
    <% 
} else {
    %>
    <h1>고객센터 연락바람!</h1>
    <%
}
%>
