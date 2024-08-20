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

<script>
	function star_click(star_num){
		//alert(star_num);
		
		//클릭시 초기화 먼저 시켜주고
		for(var jj=1; jj<=5; jj++){
	        var star_null = document.getElementById('star_'+jj);
	        star_null.innerHTML = "☆";
		}
		
		//클릭한 별의 숫자만큼 블랙별로 바꿔주기
		for(var j=1; j<=star_num; j++){
	        var star_change = document.getElementById('star_'+j);
	        star_change.innerHTML = "★";
		}
		
		document.getElementById('r_star').value = star_num;
	}
</script>

</head>
<body>
<%@ include file="../Header.jsp" %>

<%
	String ut_text = "";
	String site_title = "";
	if(usertype == 0){
		ut_text = "고용자";
		site_title = "동구이용후기";
	}else {
		ut_text = "구직자";
		site_title = "동구체험후기";
	}
%>

	<form name="afterWrite" method="post" enctype="multipart/form-data" action="afterWrite_ok.jsp">
	

		<% 
			if(s_id != null && !s_id.equals("")){
		%>
		<input type="hidden" name="r_id" id="" value="<%=s_id %>" class="saveWS250" placeholder="로그인아이디">
		
		<%
			}
		%>
		<input type="hidden" name="r_id_check" id="" value=<%=usertype %> class="saveWS250"><!-- 세션값(구직자>0 고용자>1) -->
		<input type="hidden" name="" id="" value=<%=ut_text %> class="saveWS250"><!--  -->


		<div class="saveTableOne">
			<h3><%=site_title %></h3>
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
						<%
							for(int i=1; i<=5; i++){
						%>
							<span id="star_<%=i%>" onclick="star_click('<%=i%>')" style="cursor:pointer;">☆</span>
						<%	
							}
						%>
						<input type="hidden" name="r_star" id="r_star" class="saveWS250">
						<!-- 
						<select name="r_star" class="saveWS260">
							<option value="0">0</option>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
						 -->

					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea class="saveWS100p saveHS100" placeholder="후기내용을 적어주세요." name="r_content"></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" name="" id="" value="<%=site_title %> 올리기" class="saveBtnOne">
		</div>
		
	</form>	
	
<%@include file="../Footer.jsp" %>

</body>
</html>