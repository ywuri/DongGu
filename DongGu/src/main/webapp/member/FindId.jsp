<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DongGu.member.memberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
</head>
<body>
<%@include file="/SubHeader.jsp"%>

<%
	// 한글 인코딩
	request.setCharacterEncoding("UTF-8");

    String resultMessage = null;

    // 사용자가 입력한 폼 데이터를 가져옴
    String name = request.getParameter("search_name");
    String tel1 = request.getParameter("tel1");
    String tel2 = request.getParameter("tel2");
    String tel3 = request.getParameter("tel3");

    if (name != null && tel1 != null && tel2 != null && tel3 != null) {
        // 전화번호를 하나의 문자열로 합침
        String tel = tel1 + "-" + tel2 + "-" + tel3;

        memberDAO dao = new memberDAO();
        String foundId = dao.IdSearch(name, tel); 
		//qSystem.out.println(name+tel);

        if (foundId != null) {
            resultMessage = name + "님의 아이디는 " + foundId + "입니다.";
        } else {
            resultMessage = "일치하는 아이디가 없습니다.";
        }
    }
%>

<%-- 아이디 찾기 폼 --%>
<div class="saveTableTwo m180_auto_80" id="find_box" style="<%= (resultMessage != null) ? "display:none;" : "" %>">
    <h3 class="saveTitle">아이디 찾기</h3>
    <div class="stt_box">
        <form name="FidId" method="post">
            <table>
                <tr>
                    <th>이름</th>
                    <td>
                        <input type="text" name="search_name" value="" class="saveWS250" required="required">
                    </td>
                </tr>
                <tr>
                    <th>연락처</th>
                    <td>
                        <input type="text" name="tel1" maxlength="3" class="saveWS100">							
                         - <input type="text" name="tel2" maxlength="4" class="saveWS100">							
                         - <input type="text" name="tel3" maxlength="4" class="saveWS100"> 
                    </td>
                </tr>
            </table>
            <div class="saveWS100p tac mt20">
                <input type="submit" value="아이디 찾기" class="saveBtnOne">
            </div>
        </form>
    </div>
</div>

<%-- 결과를 보여주는 부분 --%>
<div class="saveTableTwo m180_auto_80" id="findActBox" style="<%= (resultMessage == null) ? "display:none;" : "" %>">
    <h3 class="saveTitle">아이디 찾기 결과</h3>
    <div class="stt_box tac" id="findTextBox">
        <p><%= resultMessage %></p>
    </div>
    <div class="saveWS100p tac stt_box2">
        <input type="button" value="로그인" class="saveBtnOne" onclick="location.href='login.jsp'">
        <input type="button" value="비밀번호 찾기" class="saveBtnOne ml20" onclick="location.href='FindPw.jsp'">
    </div>
</div>

<%@include file="/Footer.jsp"%>
</body>
</html>
