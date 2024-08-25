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
	
	
	//지원할래요 수정
	String btnValue = "지원하기";
	int btnValue_int = 0;
	
	//마이페이지에서 지원서 수정하기 모드인 경우 ap_num 존재
	String s_ap_num = request.getParameter("ap_num");
	
	//숫자형변환
	int i_ap_num = 0;
	if(s_ap_num == null || s_ap_num.equals("")){
		s_ap_num="";
		
	}else {

		i_ap_num = Integer.parseInt(s_ap_num);
	}

	

	int i_num = 0;
	int ap_num = 0;
	int m_num = 0;
	
	String ap_title = "";
	String p_id = "";
	String ap_content = "";
	
	if(i_ap_num != 0){
		

		btnValue = "지원서 수정하기";
		btnValue_int = 1;
		
		ArrayList<FriendDTO2> arr = fdao.doFriendData(i_ap_num);
		//System.out.println(arr.size());
		for (int i = 0; i < arr.size(); i++) {

			i_num = arr.get(i).getI_num();
			ap_num = arr.get(i).getAp_num();
			m_num = arr.get(i).getM_num();

			ap_title = arr.get(i).getAp_title();
			p_id = arr.get(i).getP_id();
			ap_content = arr.get(i).getAp_content();
		}
		
	//}else {
		%>
		<script>
			//window.alert('데이터가 존재하지 않습니다. 관리자에게 문의하세요.');
	        //history.back(); // 이전 페이지로 돌아가기
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
			
			<!-- ok파일에서 필요 -->
			<input type="hidden" name="update_yn" id="update_yn"
				value="<%=btnValue_int%>">
			<!-- 수정모드인지 등록모드인지 파악하기 위함 -->
			<input type="hidden" name="ap_nums" id="ap_nums" value="<%=i_ap_num%>">
			<!-- 초대장의 기본키값 -->
			
			<table>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td colspan="2" class="tac">
						<input type="text" name="ap_title" id="ap_title" value="<%=ap_title %>" class="saveWS50p tac f16 fw500"
						placeholder="지원 제목을 입력해주세요.">
					</td>
				</tr>
			</table>
			<table class="animalBox">
				
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
					<td></td>
				</tr>
				<tr>
					<td colspan="2" class="tac">
						제 성별은 <%=sGenderVal %>이며 <%=sSmokeVal %>자 입니다.
						<br>
						저는 "<%=sAddr %>"에서 지내고 있습니다.
					</td>
				</tr>
				<tr>
					<td>
						<textarea class="saveWS100p saveHS100 read_ta" disabled>
							< 반려경험입니다. >
							<%=sMy %>
						</textarea>
					</td>
					<td rowspan="3">
						<img src='/DongGu/img/petsitter_profile/<%=sImg %>' class='writeImgSize'>
					</td>
				</tr>
				<tr>
					<td>
						
						<textarea class="saveWS100p saveHS100 read_ta" disabled>
						< 동구경험입니다. >
						<%=sOther %>
						</textarea>
					</td>
				</tr>
				<tr>
					<td>
						<textarea class="saveWS100p saveHS100 read_ta" disabled>
						< 기타경험입니다. >
						<%=sEtc %>
						</textarea>
					</td>
				</tr>
				<%
				    }
				%>
			</table>
			<table class="">
				<tr>
					<td colspan="2">
						<textarea class="saveWS95p saveHS100 write_ta" name="ap_content" id="ap_content" placeholder="추가할 내용을 적어주세요."><%=ap_content %></textarea>
					</td>
				</tr>
			</table>
			<div class="saveWS100p tac">
				<input type="submit" name="" id="" value="<%=btnValue %>" class="saveBtnOne">
			</div>
		</div>
		
	</form>	
	
<%@ include file="../Footer.jsp" %>

</body>
</html>