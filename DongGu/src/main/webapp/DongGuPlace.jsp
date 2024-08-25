<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@page import="com.DongGu.cafe.CafeDTO" %>
<jsp:useBean id="cdao" class="com.DongGu.cafe.CafeDAO" scope="session"></jsp:useBean>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/DongGu.css">
<style>
.place {
    width: 100%;
    height: auto;
    display: flex;
    position: relative;
    align-items: center;
    flex-direction: column;
    justify-content: center;
    padding: 200px 0 100px 0;
    max-width: 1400px;
    margin: 0 auto;
}
.place ul {display: flex; flex-direction: column; gap: 80px;}






.topBox {width:90%;}
.topBox p.title {margin-bottom:30px; text-align: left; font-size: 23px; font-weight: 600;}
.topBox div {float:right; margin-top:-50px;} 
.topBox div input {
	width: 100px;
	height: 30px;
	border: 2px solid #fdcb08;
	border-radius :10px;
	background-color: #fdcb08;
	color: white;
	font-size: 16px;
	cursor: pointer;
}

/*
p.title {margin-bottom:50px; text-align: left; font-size: 23px; font-weight: 600;}
*/






.place .place_box {display: flex; gap: 30px; padding-bottom: 30px; flex-wrap: wrap; justify-content: center;}
.place .box {width: 400px;
    height: 381px;
    cursor: pointer;
    overflow: hidden;
    position: relative;
    border-radius: 10px;
    box-shadow: 1px 1px 12px rgba(0, 0, 0, .07);}
.place .box .txt_box {padding: 20px 30px;}
.place .box .txt_box .big_txt {font-size: 20px; margin-bottom: 15px; font-weight:600;}
.place .box .txt_box .small_txt {font-size: 15px; margin-bottom: 20px;  color: #777; font-weight: 600;
    letter-spacing: 1px;}
.place .box .txt_box .tag {height: 26px;
    display: flex;
    width: -moz-fit-content;
    width: fit-content;
    border-radius: 5px;
    padding-left: 10px;
    padding-right: 10px;
    flex-direction: column;
    justify-content: center;
    background-color: #f8f8f8;
    font-size: 13px;}
.place .box .img_box {width: 100%; height: 230px; background: #000; position: relative; overflow: hidden;}
.place .box .img_box img {width: 100%; transform: translate(0%, -15%); position: absolute;}








</style>
</head>

<%


	String s_area = request.getParameter("area");	//서울, 경기, 인천 검색
	
	if(s_area == null || s_area.equals("")){
		s_area="0";
	}

	int i_area = Integer.parseInt(s_area);
	
	int totalCnt = 0;	//게시글 수
	ArrayList<CafeDTO> arr = null;
	
	
	
	
	
	

	int listSize = 6;	//한 개 페이지에 몇 개 보여줄지
	int pageSize = 5;	//한 개 페이지에 보여줄 페이징 개수 (5개 숫자만 보여짐)
	String cp_s = request.getParameter("cp");	//현재 페이지
	
	if(cp_s == null || cp_s.equals("")){
		cp_s="1";
	}
	
	int cp = Integer.parseInt(cp_s);
	
	
	
	
	
	
	//0이 아닌경우 서울, 경기, 인천 검색중
	if(i_area != 0){
		
		totalCnt = cdao.cafeTotalCntArea(i_area);	//총 게시물 수
		arr = cdao.cafeListArea(cp, listSize, i_area);
		
		System.out.println(totalCnt);
		

		//String arr_s = "";
		//arr_s = cdao.cafeListArea(cp, listSize, i_area);
		//System.out.println(arr_s);
		
		
	//0인경우 지역검색 아님, 전체 가져오기
	}else {

		totalCnt = cdao.cafeTotalCnt();	//총 게시물 수
		arr = cdao.cafeList(cp, listSize);
		
	}

	//int totalCnt = cdao.cafeTotalCnt();	//총 게시물 수
	
	
	int totalPage = (totalCnt/listSize)+1;
	if(totalCnt % listSize == 0) totalPage--;
	
	//사용자 현재 위치 그룹번호
	int userGroup = cp / pageSize;
	if(cp % pageSize == 0) userGroup--;
	
%>

<body>
<%@include file="SubHeader.jsp" %>
<section class="place">
	<div class="topBox">
		<p class="title">동구의 추천</p>

			<div>
				<input type="button" value="전체" onclick="location.href='DongGuPlace.jsp?cp=1&area=0'">
				<input type="button" value="서울" onclick="location.href='DongGuPlace.jsp?cp=1&area=1'">
				<input type="button" value="경기" onclick="location.href='DongGuPlace.jsp?cp=1&area=2'">
				<input type="button" value="인천" onclick="location.href='DongGuPlace.jsp?cp=1&area=3'">
			</div>
	</div>
	
	<ul>
		<li>
			<div class="place_box">
					
				<%
	
					if(arr==null||arr.size()==0){
				%>
				<div class="box">
					<div class="txt_box">
						<p class="big_txt">등록된 게시글이 없습니다.</p>
					</div>
				</div>
				<%
					}else {
						//System.out.println(arr.size());
						for(int i=0; i<arr.size(); i++){
				%>
					<div class="box">
						<a href="DongGuPlaceView.jsp?idx=<%=arr.get(i).getC_num() %>">
							<div class="img_box"> 
								<img src="/DongGu/img/cafe/<%=arr.get(i).getC_img() %>" >
							</div>
							<div class="txt_box">
								<p class="big_txt"><%=arr.get(i).getC_name() %></p>
								<p class="small_txt"><%=arr.get(i).getC_addr() %></p>
								<p class="tag"><%=arr.get(i).getC_ltag() %></p>
							</div>
						</a>
					</div>
				<%
					}
				}
				%>

				<!-- 
				<div class="box">
					<a href="DongGuPlaceView.jsp">
						<div class="img_box"> 
							<img src="img/place01.jpg" >
						</div>
						<div class="txt_box">
							<p class="big_txt">헬로우마루네</p>
							<p class="small_txt">서울 구로구 오류동</p>
							<p class="tag">평화로운 분위기 · 햇살뷰 · 회원권</p>
						</div>
					</a>
				</div>
				<div class="box">
					<div class="img_box"> 
						<img src="img/place02.jpg" >
					</div>
					<div class="txt_box">
						<p class="big_txt">어반펫츠</p>
						<p class="small_txt">서울 용산구 한강대로</p>
						<p class="tag">좋은 잔디 · 캡슐커피 무한 · 주차공간 </p>
					</div>
				</div>
				<div class="box">
					<div class="img_box"> 
						<img src="img/place03.jpg">
					</div>
					<div class="txt_box">
						<p class="big_txt">카페 루</p>
						<p class="small_txt">서울 송파구 오금동</p>
						<p class="tag">다양한 음식 · 루프탑 · 도심위치 </p>
					</div>
				</div>
				<div class="box">
					<div class="img_box"> 
						<img src="img/place04.png" >
					</div>
					<div class="txt_box">
						<p class="big_txt">바잇미 신사점</p>
						<p class="small_txt">서울 강남구 신사동</p>
						<p class="tag">강아지브랜드 · 용품구매 · 테라스 · 퍼푸치노</p>
					</div>
				</div>
				<div class="box">
					<div class="img_box"> 
						<img src="img/place05_1.jpg">
					</div>
					<div class="txt_box">
						<p class="big_txt">누뗀</p>
						<p class="small_txt">서울 서초구 신원동</p>
						<p class="tag">초록뷰 · 햇살 · 멍푸치노 · 뜨개클래스</p>
					</div>
				</div>
				<div class="box">
					<div class="img_box"> 
						<img src="img/place06.jpg">
					</div>
					<div class="txt_box">
						<p class="big_txt">낮도깨비 밤도깨비</p>
						<p class="small_txt">서울 마포구 망원동</p>
						<p class="tag">낮카페밤와인바 · 멍푸치노 · 테라스 </p>
					</div>
				</div>
				 -->
			</div>
		</li>
	</ul>
	<div align="center">
						<!-- ------------------------------------------------------------------- -->
	<%
		if(userGroup != 0){
			%>
			&nbsp;&nbsp;<a href="DongGuPlace.jsp?cp=<%=(userGroup-1)*pageSize+pageSize%>&area=<%=s_area%>">&lt;&lt;</a>&nbsp;&nbsp;
			<%
		}
	%>
	
	<%
		for(int i = userGroup*pageSize+1; i <= userGroup*pageSize+pageSize; i++){
			%>
			&nbsp;&nbsp;<a href="DongGuPlace.jsp?cp=<%=i%>&area=<%=s_area%>" <% if(cp==i){%>style="font-weight:600; color:#ffbf00;"<%}else {%><%} %>><%=i %></a>&nbsp;&nbsp;
			<%
			
			if(i == totalPage){
				break;
				
			}
		}
	%>
	<%
		if(userGroup!=(totalPage/pageSize-(totalPage % pageSize == 0?1:0))){

			%><a href="DongGuPlace.jsp?cp=<%=(userGroup+1)*pageSize+pageSize%>&area=<%=s_area%>">&gt;&gt;</a><%
		}
	%>
	<!-- ------------------------------------------------------------------- -->
	</div>
						
						
</section>
<%@include file="Footer.jsp" %>
</body>
</html>