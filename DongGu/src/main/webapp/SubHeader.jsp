<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/DongGu.css">
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css'>
<link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.9/dist/web/variable/pretendardvariable.min.css" />
<style>
header.dg_hd {
    background: #fffae5 !important;
}
</style>
</head>
<body>
<%
String sname = (String)session.getAttribute("sname");
String snickname = (String)session.getAttribute("snickname");
Integer usertype = (Integer)session.getAttribute("usertype");
%>
<div class="wrapper"> <!-- wrapper 시작 -->
<header class="dg_hd">
	<h1>
		<a href="/DongGu/Index.jsp"><img src="/DongGu/img/logo.png" alt="logo"></a>
	</h1>
	<nav>
		<ul>
			<li>
				<% 	
					if(usertype != null){
						if(usertype == 1){	//구직자(동구)는 초대장 클릭시 초대장 리스트로
					%>
						<a href="/DongGu/saveForm/FindDongGu.jsp"><span>초대장</span></a>
					<%
						}else {	//고용자는 초대장 클릭시 초대장 입력폼으로
					%>
						<a href="/DongGu/saveForm/GetFriendWrite.jsp"><span>초대장</span></a>
					<%
						}
					}else {
					%>
						<a href="/DongGu/saveForm/GetFriendWrite.jsp"><span>초대장</span></a>
					<%						
					}
				%>
			</li>
			<li>
				<a id="board" href="/DongGu/free/FreeBoard.jsp"><span>게시판  <i style="margin-left: 5px;" class="fa fa-caret-down" aria-hidden="true"></i></span></a>
				<div id="s-d" class="dropdown">
					<p><a href="/DongGu/notice/Notice.jsp">공지사항</a><img src="/DongGu/img/icon_dog.png"></p>
					<p><a href="/DongGu/free/FreeBoard.jsp">자유게시판</a><img src="/DongGu/img/icon_dog.png"></p>
					<p><a href="/DongGu/qna/QnABoard.jsp">QnA</a><img src="/DongGu/img/icon_dog.png"></p>
				</div>
			</li>
			<li>
				<a href="/DongGu/DongGuPlace.jsp"><span>동구의 추천</span></a>
			</li>
			</li>
			<li>
				<a href="/DongGu/AfterList.jsp"><span>이용후기</span></a>
			</li>
			<li>
				<a href=/DongGu/notice/Notice.jsp"><span>고객센터</span></a>
			</li>
		</ul>
	</nav>
	<div class="util">
	<%if(sname == null){
	%>
	<a href="/DongGu/member/login.jsp">
		<button type="button" class="login"></button>
	</a>
	<%
	}else{
		%>
		<div>
		 <span style="color:blue;"><%= snickname %></span>님 로그인중 | <a href="/DongGu/member/logout.jsp">&nbsp;로그아웃</a><a href="/DongGu/mypage/MyPage.jsp"><img src="/DongGu/img/icon_mypage.png"></a>
		</div>
		<%
	} %>
		
	</div>
</header>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js'></script>
<script>
$(" #board ").click(function () {
	$(" #s-d ").toggleClass('show');
})
</script>
</body>
</html>
