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
    
    session.setAttribute("sid", userid);
    session.setAttribute("sname", username);
    session.setAttribute("snickname", nickname);
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
