<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DongGu.member.memberDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
</head>
<body>
<%@include file="/SubHeader.jsp"%>

<%
    // 한글 인코딩 설정
    request.setCharacterEncoding("UTF-8");

    String resultMessage = null;

    // 사용자가 입력한 폼 데이터를 가져옴
    String id = request.getParameter("search_id");
    String question = request.getParameter("question");
    String answer = request.getParameter("answer");

    if (id != null && question != null && answer != null) {
        // DAO 객체 생성 및 비밀번호 검색 수행
        memberDAO dao = new memberDAO();
        String foundPw = dao.PwSearch(id, answer); // 적절한 메서드 호출
        
        if (foundPw != null) {
            resultMessage = id + "님의 비밀번호는 " + foundPw + "입니다.";
        } else {
            resultMessage = "일치하는 정보가 없습니다.";
        }
    }
%>

<%-- 비밀번호 찾기 폼 --%>
<form name="findPwForm" method="post">
    <div class="saveTableTwo m180_auto_80" id="find_box" style="<%= (resultMessage != null) ? "display:none;" : "" %>">
        <h3 class="saveTitle">비밀번호 찾기</h3>
        <div class="stt_box">
            <table>
                <tr>
                    <th>아이디</th>
                    <td>
                        <input type="text" name="search_id" value="" class="saveWS300" required>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 찾기 질문</th>
                    <td>
                        <select name="question" class="saveWS260" required>
                            <option value="1">내가 가장 좋아하는 간식은?</option>
                            <option value="2">제일 기억에 남는 영화는?</option>
                            <option value="3">부모님의 결혼기념일은?</option>
                            <option value="4">어릴적(혹은 현재) 제일 친한친구 이름은?</option>
                            <option value="5">제일 기억에 남는 생일선물은?</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>비밀번호 찾기 답</th>
                    <td>
                        <input type="text" name="answer" value="" class="saveWS300" required>
                    </td>
                </tr>
            </table>
            <div class="saveWS100p tac mt20 ">
                <input type="submit" value="비밀번호 찾기" class="saveBtnOne">
            </div>
        </div>
    </div>
</form>

<%-- 결과를 보여주는 부분 --%>
<div class="saveTableTwo m180_auto_80" id="findActBox" style="<%= (resultMessage == null) ? "display:none;" : "" %>">
    <h3 class="saveTitle">비밀번호 찾기 결과</h3>
    <div class="stt_box tac" id="findTextBox">
        <p><%= resultMessage %></p>
    </div>
    <div class="saveWS100p tac stt_box2">
        <input type="button" value="로그인" class="saveBtnOne" onclick="location.href='login.jsp'">
    </div>
</div>

<%@include file="/Footer.jsp"%>
</body>
</html>
