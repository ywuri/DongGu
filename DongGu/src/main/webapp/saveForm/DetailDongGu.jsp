<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.Date" %>   
<%@ page import="com.DongGu.friend.InviteDTO" %>     
<%@ page import="com.DongGu.friend.InviteDAO" %>     
<%@ page import="java.util.*" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">

<style>

</style>

</head>
<body>

<jsp:useBean id="dao" class="com.DongGu.friend.InviteDAO"></jsp:useBean>
<jsp:useBean id="dto" class="com.DongGu.friend.InviteDTO"></jsp:useBean>
<%

int i_num = Integer.parseInt(request.getParameter("i_num")) ;
InviteDTO idto = dao.getDongGuDetail(i_num);
//게시글 상세 내용 가져오기


int cp;
if(request.getParameter("cp")==null){
	cp=1;
}
else{
	cp = Integer.parseInt( request.getParameter("cp"));
}

String o_id = request.getParameter("o_id");
String sid = (String)session.getAttribute("sid");

Integer usertype2 = (Integer)session.getAttribute("usertype");

int isWishList =-2;
if(sid!=null ){
	//sid와 글번호로 해당 게시글 위시리스트에 있는지 확인
	isWishList = dao.isWishList(i_num,sid);
}

%>

<%@include file="../SubHeader.jsp" %>

<div id="FreeBoardDivTitle"> 초 대 장 </div>
<div class="DeTailDongGuMainDiv">
	
	<div id="DetailDongGuTitleDiv" style="display:flex; justify-content: space-between;" >
		<div style="margin-left: 50px;">
			<%=idto.getI_title() %>
		</div>
		<div>
			<form name="wishListForm" action="DongGuWishList.jsp"  id="wishListForm">
			<input type="hidden" name="o_id" value="<%=o_id %>">
			<input type="hidden" name="i_num" value="<%=i_num %>">
			<input type="hidden" name="cp" value="<%=cp %>">
			
			<%
			if(isWishList==1){
				%>
				<input type="image" id="wishHeart" class="heartIconSize" src="/DongGu/img/heart_full.svg" style="width:30px;">
				<%
			}else if(isWishList==0){
				%>
				<input type="image" id="wishHeart" class="heartIconSize" src="/DongGu/img/heart_empty.svg" style="width:30px;">
				<%
			}else{
				
			}
			%>
			</form>
		</div>
		
	</div>
	<div id="DetailDongGuInfoDiv2">
		<div>
			<img class="DetailDongGuImg" src="/DongGu/img/<%=idto.getAi_img() %>" >
		</div>
		<ul id="DetailDongGuContentDiv" >
			<li><a href="/DongGu/member/MemberDetail.jsp?usertype=0&o_id=<%=idto.getO_id() %>" class="linkDeco"><%=idto.getO_nickname() %></a> 이/가</li>
			<li><%=idto.getI_start() %>부터 <%=idto.getI_end() %>까지</li>
			<li><%=idto.getA_num() %> <%=idto.getAt_name()%> <%=idto.getAi_name() %>(<span class="spanColor"><%=idto.getAge() %></span>)와</li>
			<li>행복한 시간에 초대합니다~</li>
			<li>우리 <%=idto.getAi_name() %>는 <span class="spanColor"><%=idto.getNature() %></span>입니다.</li>
			<li><%=idto.getAi_name() %>의 알러지는 <span class="spanColor"><%=idto.getAi_alergy() %></span>,</li>
			<li>아픈 곳은 <span class="spanColor"><%=idto.getAi_disease() %></span></li> 
			<li>기타 주의사항은 <span class="spanColor"><%=idto.getAi_caution() %></span></li> 
			<li><%=idto.getI_content() %></li>
			<li>대략적인 위치는 <span class="spanColor"><%=idto.getO_addr() %></span>입니다 </li>
			
			<li id="DetailDongGuButton">
				<span id="spanSizeDe">초대에 응하시겠습니까? </span>
				<input type="button" class="DetailDongGuJoinButton" value="수락하기" onclick="location.href='/DongGu/saveForm/DoFriendWrite.jsp?i_num=<%=i_num%>'">
			</li>
			
			<li>
				<span>현재 참가자는 </span><span id="DetailDongGuCountNum"><%=idto.getDoCnt() %></span><span>명 입니다.</span>
			</li>
		</ul>
		
	</div>
</div>


<%@include file="../Footer.jsp" %>

<script>
//위시리스트 되면 색깔 바꾸기
document.getElementById('wishHeart').addEventListener('click', function(event) {
    event.preventDefault(); // 폼 자동 제출 방지

    var heartIcon = document.getElementById('wishHeart');
    
    if (heartIcon.src.includes('heart_empty.svg')) {
        heartIcon.src = '/DongGu/img/heart_full.svg'; // 색이 채워진 하트 이미지로 변경
    } else {
        heartIcon.src = '/DongGu/img/heart_empty.svg'; // 빈 하트 이미지로 변경
    }


    document.getElementById('wishListForm').submit(); // 폼 제출
});
</script>
</body>
</html>