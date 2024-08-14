<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.*" %>
<%@page import="com.DongGu.friend.AfterDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">

<%
	String s_id =(String)session.getAttribute("sid");
	if(s_id==null || s_id.equals("")){
%>
		<script>
		window.alert('로그인 후 접속가능합니다.');
		window.location.href="/DongGu/member/login.jsp";
		</script>
<%
	}
%>

</head>
<body>
<%@include file="../Header.jsp" %>

	<form name="afterWrite" method="post" enctype="multipart/form-data" action="afterWrite_ok.jsp">
	

		<% 
			if(s_id != null && !s_id.equals("")){
		%>
		<input type="text" name="r_id" id="" value="<%=s_id %>" class="saveWS250" placeholder="로그인아이디">
		
		<%
			}
		%>
		<input type="text" name="r_id_check" id="" value="0" class="saveWS250"><!-- 세션값(구직자>1 고용자>0) -->


		<div class="saveTableOne">
			<h3>동구이용/체험후기</h3>
			<table>
				<tr>
					<th>사진</th>
					<td>
						<input type="file" name="r_img" id="" value="" class="saveWS250">
					</td>
				</tr>
				<tr>
					<th>평점</th>
					<td>
						<select name="r_star" class="saveWS260">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea class="saveWS100p saveHS100" placeholder="후기내용을 적어주세요." name="r_content"></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" name="" id="" value="이용/체험후기올리기" class="saveBtnOne">
		</div>
		
	</form>	
	
<%@include file="../Footer.jsp" %>

</body>
</html>