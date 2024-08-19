<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mdao" class="com.DongGu.member.memberDAO"></jsp:useBean>
<jsp:useBean id="mdto" class="com.DongGu.member.memberDTO"></jsp:useBean>
<jsp:useBean id="odto" class="com.DongGu.member.ownermemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:setProperty property="*" name="odto"/>

<%
String msg = "";
boolean result = false;
try {
    result = mdao.NickNameCheck(mdto, odto);
    msg = result ? "사용할 수 있는 닉네임 입니다!" : "사용하고 있는 닉네임 입니다!";
} catch (Exception e) {
    e.printStackTrace(); // 예외를 콘솔에 출력하여 문제를 진단
    throw new ServletException("닉네임 중복 검사 중 오류 발생", e);
}
%>

<script>
    // JSP에서 설정한 msg와 result 변수를 JavaScript로 전달
    window.alert('<%= msg %>');
    var result = <%= result %>;

    if(result){
        var txt = '<%= odto.getO_nickname() %>';
        opener.document.MemberJoinOwner.o_nickname.value = txt;
    }
    window.self.close();
</script>
