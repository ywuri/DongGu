<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.*" %>
<%@page import="com.DongGu.friend.FriendDTO2" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
<jsp:useBean id="fdao" class="com.DongGu.friend.FriendDAO"></jsp:useBean>


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
	
	
	
	//어떤 초대장인지 파라미터로 받음 //string형식의 send_id변수로 설정해줌
	String i_num_value = request.getParameter("i_num");
	if(i_num_value==null || i_num_value.equals("")){
%>
		<script>
			window.alert('잘못된 경로로 접속하셨습니다. 관리자에게 문의하세요');
			history.back(); // 이전 페이지로 돌아가기
		</script>
<%		
	}
%>

<script>
	//저장전 데이터 존재여부파악
	function datacheck(){
		if(document.getElementById('ap_title').value.trim() === ""){
			alert("지원제목을 입력해주세요.");
			document.getElementById('ap_title').focus();
			return false; // 폼 제출을 막습니다.
			
		}else if(document.getElementById('ap_content').value.trim() === ""){
			alert("추가내용을 입력해주세요.");
			document.getElementById('ap_content').focus();
			return false;
		}
	}
</script>
</head>
<body>
<%@ include file="../Header.jsp" %>
<%

	if(usertype == 0){
	%>
		<script>
			window.alert('고용자는 접근하실 수 없습니다.');
			history.back(); // 이전 페이지로 돌아가기
		</script>
	<%		
	//}else {
	%>
		<script>
			//window.alert(<%=usertype%>);
		</script>
	<%		
		
	}
%>

	<form name="DoWrite" action="DoWrite_ok.jsp" onsubmit="return datacheck();">
	
		<input type="hidden" name="i_num" id="" value="<%=i_num_value %>" class="saveWS250" placeholder="초대장번호">
		<% 
			if(s_id != null && !s_id.equals("") && usertype == 1){
		%>
		<input type="hidden" name="p_id" id="" value="<%=s_id %>" class="saveWS250" placeholder="구직자아이디">
		
		<%
			}
		%>
		
		<div class="saveTableOne">
			<h3>지 원 할 래 요!</h3>
			<table>
				<tr>
					<th>지원제목</th>
					<td>
						<input type="text" name="ap_title" id="ap_title" value="" class="saveWS250">
					</td>
				</tr>
				
				<% 
					if(s_id != null && !s_id.equals("") && usertype == 1){
						String sData = fdao.sitterData(s_id);
						
						String[] sdata_arr = sData.split("//");

						//int sGender = Integer.parseInt(sdata_arr[0]);
						//int sSmoke = Integer.parseInt(sdata_arr[1]);

						String sGender = sdata_arr[0];
						String sSmoke = sdata_arr[1];
						String sImg = sdata_arr[2];
						String sAddr = sdata_arr[3];
						String sMy = sdata_arr[4];
						String sOther = sdata_arr[5];
						String sEtc = sdata_arr[6];
						
						String sGenderVal = (sGender == "1") ? "남자" : "여자";
						String sSmokeVal = (sSmoke == "1") ? "흡연" : "비흡연";
						
				%>
				<tr>
					<th>성별</th>
					<td>
						<%=sGenderVal %>
					</td>
				</tr>
				<tr>
					<th>흡연여부</th>
					<td>
						<%=sSmokeVal %>
					</td>
				</tr>
				<tr>
					<th>사진</th>
					<td>
						<img src='/DongGu/img/petsitter_profile/<%=sImg %>' class='writeImgSize'>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<%=sAddr %>
					</td>
				</tr>
				<tr>
					<th>반려경험</th>
					<td>
						<textarea class="saveWS100p saveHS100" disabled><%=sMy %></textarea>
					</td>
				</tr>
				<tr>
					<th>동구경험</th>
					<td>
						<textarea class="saveWS100p saveHS100" disabled><%=sOther %></textarea>
					</td>
				</tr>
				<tr>
					<th>기타경험</th>
					<td>
						<textarea class="saveWS100p saveHS100" disabled><%=sEtc %></textarea>
					</td>
				</tr>
				<%
				    }
				%>
				<tr>
					<th>추가내용</th>
					<td>
						<textarea class="saveWS100p saveHS100" name="ap_content" id="ap_content" placeholder="추가할 내용을 적어주세요."></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" name="" id="" value="지원하기" class="saveBtnOne">
		</div>
		
	</form>	
	
<%@ include file="../Footer.jsp" %>

</body>
</html>