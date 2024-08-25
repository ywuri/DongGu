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
	
	//누구한테 쓰는지 파라미터로 받음 //일단 string형식의 send_id변수로 설정해줌
	String send_id = request.getParameter("send_id");
	if(send_id==null || send_id.equals("")){

%>
		<script>
			window.alert('잘못된 경로로 접속하셨습니다. 관리자에게 문의하세요');
			history.back(); // 이전 페이지로 돌아가기
		</script>
<%		
	}
	
	//Integer m_usertype = (Integer)session.getAttribute("usertype"); 
	//추가됨 
	//로그인한 사람이 이용후기 작성완료시
	//고용자 (usertype 세션값이 0)인경우 초대장(invitation > i_num에 num으로 받은값 )에 매칭상태를 5(이용후기작성완료)로 업데이트
	//구직자 (usertype 세션값이 1)인경우 지원할래요(application > ap_num에 num으로 받은값)에 매칭상태를 5(이용후기작성완료)로 업데이트
	
	String num = request.getParameter("num");
	
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
	
	//저장전 데이터 존재여부파악
	function datacheck(){
		if(document.getElementById('r_img').value.trim() === ""){
			alert("사진을 선택해주세요.");
			document.getElementById('r_img').focus();
			return false; // 폼 제출을 막습니다.
			
		}else if(document.getElementById('r_star').value.trim() === "0"){
			alert("별점을 선택해주세요.");
			document.getElementById('r_star').focus();
			return false;
			
		}else if(document.getElementById('r_content').value.trim() === ""){
			alert("후기내용을 입력해주세요.");
			document.getElementById('r_content').focus();
			return false;
		}
	}
	
	//파일 탐색기 실행시
    window.onload = function() {
        // 파일 탐색기 실행 시 파일 이름 표시
        document.getElementById('r_img').addEventListener('change', function() {
            if (this.files.length > 0) {
                const fileName = this.files[0].name;
                //alert('선택한 파일: ' + fileName);
                document.getElementById('fileName').textContent = fileName;
            } else {
                document.getElementById('fileName').textContent = 'Choose File';
            }
        });
    };
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

	<form name="afterWrite" method="post" enctype="multipart/form-data" action="afterWrite_ok.jsp" onsubmit="return datacheck();">
	

		<% 
			if(s_id != null && !s_id.equals("")){
		%>
		<input type="hidden" name="r_id" id="" value="<%=s_id %>" class="saveWS250" placeholder="로그인아이디">
		
		<%
			}
		%>
		<input type="hidden" name="r_id_check" id="" value=<%=usertype %> class="saveWS250"><!-- 세션값(구직자>1 고용자>0) -->
		<input type="hidden" name="" id="" value=<%=ut_text %> class="saveWS250"><!-- 고용자인지 구직자인지 확인하기 위한 용도로 만들어둠 -->
		<input type="hidden" name="r_receive_id" id="" value="<%=send_id %>" class="saveWS250"><!-- 누구한테 쓰는지 파라미터로 받아온 값 담아줌 -->
		
		<input type="hidden" name="session_update_num" id="" value=<%=num %> class="saveWS250"><!-- 고용자로그인(초대장 i_num / 구직자로그인(지원할래요 ap_num  -->


		<div class="saveTableTwo m180_auto_80">
			<h3 class="saveTitle"><%=site_title %></h3>
			<div class="stt_box">
				<table>
					<tr>
						<th>사진</th>
						<td>
							<input type="file" name="r_img" id="r_img" value="" class="saveWS250">
		                    <span id="fileName" onclick="document.getElementById('r_img').click();" style="cursor:pointer;">사진을 선택해주세요.</span>
		                </td>
					</tr>
					<tr>
						<th>평점</th>
						<td>
							<%
								for(int i=1; i<=5; i++){
							%>
								<span id="star_<%=i%>" onclick="star_click('<%=i%>')" style="cursor:pointer; font-size:25px;">☆</span>
							<%	
								}
							%>
							<input type="hidden" name="r_star" id="r_star" class="saveWS250" value="0">
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
							<textarea class="saveWS80p saveHS100 write_ta" placeholder="후기내용을 적어주세요." name="r_content" id="r_content"></textarea>
						</td>
					</tr>
				</table>
				<div class="saveWS100p tac mt20 ">
					<input type="submit" name="" id="" value="<%=site_title %> 올리기" class="saveBtnTwo">
				</div>
			</div>
		</div>
		
	</form>	
	
<%@include file="../Footer.jsp" %>

</body>
</html>