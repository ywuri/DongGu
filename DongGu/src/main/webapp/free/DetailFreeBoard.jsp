<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Date" %>  
<%@ page import="com.DongGu.board.FreeBoardDAO" %>    
<%@ page import="com.DongGu.board.FreeBoardDTO" %>     
<%@ page import="com.DongGu.board.FreeCommentDTO" %>     
<%@ page import="java.util.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>  
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">

</head>
<body>
<jsp:useBean id="dao" class="com.DongGu.board.FreeBoardDAO"></jsp:useBean>
<jsp:useBean id="dto" class="com.DongGu.board.FreeBoardDTO"></jsp:useBean>
<jsp:useBean id="cdto" class="com.DongGu.board.FreeCommentDTO"></jsp:useBean>
<%
int f_num = Integer.parseInt(request.getParameter("f_num")) ;
FreeBoardDTO qdto = dao.getFreeBoardDetail(f_num);
//게시글 상세 내용 가져오기

//해당글의 댓글 가져오기
ArrayList<FreeCommentDTO> commentArray = null;
commentArray = dao.getCommentList(qdto.getF_num() );


int cp;
if(request.getParameter("cp")==null){
	cp=1;
}
else{
	cp = Integer.parseInt( request.getParameter("cp"));
}

String f_id = request.getParameter("f_id");
String sid = (String)session.getAttribute("sid");

int isWishList =-2;
if(sid!=null ){
	//sid와 글번호로 해당 게시글 위시리스트에 있는지 확인
	isWishList = dao.isWishList(f_num,sid);
}

ArrayList<FreeBoardDTO> array = null;
array = dao.getNextFreeBoard(f_num);



%>


<%@include file="../SubHeader.jsp" %>
<div id="BoardMargin">
	<div>
		<div id="WriteFreeBoardMainDiv">
			<div id="DetailBoardSubject" >
				<a href="/DongGu/free/FreeBoard.jsp" class="DetailBoardSubject">자유 게시판 ></a>
			</div>
			<%
				if(f_id.equals(" ")){
					%>
					<div id="DetailBoardTitle" style="color:#808080;">
						<img style="width:28px; padding-right:10px;" src="/DongGu/img/icon_trash.svg"><%=qdto.getF_title()%>
					</div>
					<%
				}
				else{
					%>
					<div id="DetailBoardTitle" ><%=qdto.getF_title()%></div>
					<%
				}
			%>
			<div id="DetailBoardInfo" style="display:flex;">
				<div style="width:700px;">
					작성자 : <%=qdto.getF_nickname()%>(<%=qdto.getF_id()%>)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					작성날짜 : <%=qdto.getF_date().substring(0, 16)%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					조회:<%=qdto.getF_vcnt()%>
				</div>
				<div >
					<form name="wishListForm" action="FreeWishList.jsp"  id="wishListForm">
						<input type="hidden" name="f_id" value="<%=f_id %>">
						<input type="hidden" name="f_num" value="<%=f_num %>">
						<input type="hidden" name="cp" value="<%=cp %>">
							<%
								if(isWishList==1){
									%>
									<input type="image" id="wishHeart" class="heartIconSize" src="/DongGu/img/heart_full.svg">
									<%
								}else if(isWishList==0){
									%>
									<input type="image" id="wishHeart" class="heartIconSize" src="/DongGu/img/heart_empty.svg" >
									<%
								}else{
									
								}
							%>
					</form>
				</div>
			</div>
			
			<div id="WriteFreeBoardContentDiv">
				<%
					if(qdto.getF_img()!=null||"".equals(qdto.getF_img())){
				%>
					<img src="/DongGu/img/free/<%=qdto.getF_img() %>" id="DetailBoardImg">
				<%
					}
				%>
				<div id="DetailQnABoardContentDiv" ><%=qdto.getF_content().replaceAll("\n", "<br>") %></div>
				
				
				<!-- 댓글창 -->
				
				<%
				    boolean hasComments = (commentArray != null && commentArray.size() > 0);
				    boolean isLoggedIn = (sid != null && !sid.equals(""));
    
				    //댓글이 있고 없고 --> 있을떄 반복문 돌아감
				    //로그인을 했고 안했고-->했을때 댓글창생김
				    
				    //댓글이 있으면
				    if(hasComments){
				    	
				    	//댓글보여주기 반복문
				    	for(int i =0;i<commentArray.size();i++){
				    	%>
			
						<!-- 댓글보여주는 형식 만들기 -->
						<hr style="border:1px solid #f2f2f2; ">
						<div id="commentDiv<%=commentArray.get(i).getFc_num() %>"style="margin:30px; margin-left:<%=30*(commentArray.get(i).getFc_lev()+1) %>px;">
							<div style="font-size: 14pt; font-weight: 600;"><img src="/DongGu/img/icon_dove.svg" style="width:30px; margin-right:5px;">
								<%=commentArray.get(i).getFc_nickname() %>
								<%
									if(commentArray.get(i).getFc_nickname().equals(qdto.getF_nickname())){
								%>
									<span style="background-color: #fffae5; color: #ffa500">작성자</span>
								<%
									}
								%>
							</div>
							<div style="padding-left: 30px; padding-top: 10px; font-size: 13pt;"><%=commentArray.get(i).getFc_content() %></div>
								<%
									if(commentArray.get(i).getFc_img()!=null && !commentArray.get(i).getFc_img().equals("")) { 
									%>
										<div style=" width: 300px; height: 300px; padding-left: 30px; padding-top: 10px;">
											<img src="/DongGu/img/free/<%=commentArray.get(i).getFc_img() %>" style="border-radius:6px; width:300px; height:300px;">
										</div>
									<%
									}
									if(isLoggedIn){
										//답글쓰기
									%>
				
									<div style="color:#979797; padding-left:30px;padding-top:10px;">
										<%=commentArray.get(i).getFc_date() %>&nbsp;&nbsp;&nbsp;
										<a href="javascript:void(0)" onclick="openReCommentAdd(<%=i%>)">답글쓰기</a>
									<%
									}
									//댓글 작성자와 로그인한사람이 같으면 수정,삭제버튼
									if(commentArray.get(i).getFc_id().equals(sid)){
										%>
											&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="updateComment(<%=commentArray.get(i).getFc_num()%>)">수정</a>
											&nbsp;<a href="javascript:void(0)" onclick="deleteComment(<%=commentArray.get(i).getFc_num()%>)">삭제</a>
										<%
										}
									%>
									</div>
						</div>
						<%
    		
			    		//댓글이 o 로그인o
			    		if(isLoggedIn){
							%>
							<!-- 대댓글쓰고싶으면 -->
							<div class="commentTopDiv" id="reCommentAdd<%=i %>" style="display:none; margin-left:<%=30*(commentArray.get(i).getFc_lev()+2) %>px;">
								<span id="commentTitleSpan"><%=snickname %></span>
									<form action="ReWriteFreeBoard.jsp"  name="freeCommentForm" style="display: flex; flex-direction: column;" method="post" enctype="multipart/form-data">
										<input type="hidden" name="fc_ref" value="<%=commentArray.get(i).getFc_ref()%>">
										<input type="hidden" name="fc_lev" value="<%=commentArray.get(i).getFc_lev()%>">
										<input type="hidden" name="fc_sunbun" value="<%=commentArray.get(i).getFc_sunbun()%>">
										<input type="hidden" name="f_num" value="<%=qdto.getF_num()%>">
										
										<textarea name="f_content" placeholder="대댓글을 남겨보세요" id="commentAddStyle" required></textarea>
										
										<div id="showFreeBoardImgDiv2<%=i %>" >
										</div>
										
										<div id="commentBachiDiv">
											<label for="commentImg" id="commentLabel" >
									            <img src="/DongGu/img/icon_camera.svg" style="width: 22px;">
									        </label>
									        <input name="f_img" type="file" accept="image/*" style="display: none;" id="commentImg" onchange="showFreeBoardImg(event);">
											
											<input type="submit" class="FreeBoardButton" value="등록" id="commetAddButton" >
										</div>
								</form>
							</div>
							<%
			    		}//댓글이 o 로그인o
    		
			    		//댓글이 o 로그인x
			    		else{
			    			
			    		}//댓글이 o 로그인x
    		
    				}//댓글보여주기 반복문
    	
				    //로그인이 됐으면 댓글입력폼 보여지게
			    	if(isLoggedIn){
			    		%>
			    		<!-- 댓글 폼 -->
						<div class="commentTopDiv" id="" >
							<span id="commentTitleSpan"><%=snickname %></span>
								<form action="ReWriteFreeBoard.jsp"  name="freeCommentForm" style="display: flex; flex-direction: column;" method="post" enctype="multipart/form-data">
									<input type="hidden" name="f_num" value="<%=qdto.getF_num()%>">
									<textarea name="f_content" placeholder="댓글을 남겨보세요" id="commentAddStyle" required></textarea>
									
									<div id="showFreeBoardImgDiv2" >
									</div>
									
									<div id="commentBachiDiv">
										<label for="commentImg" id="commentLabel" >
								            <img src="/DongGu/img/icon_camera.svg" style="width: 22px;">
								        </label>
								        <input name="f_img" type="file" accept="image/*" style="display: none;" id="commentImg" onchange="showFreeBoardImg(event);">
										
										<input type="submit" class="FreeBoardButton" value="등록" id="commetAddButton" >
									</div>
							</form>
						</div>
						<% 
    				} //로그인이 됐으면 댓글폼 보여지게
    			}//댓글이 있으면
    
				    
			    //댓글이 없으면
			    else{
			    	//댓글이 x 로그인o
					if(isLoggedIn){
						%>
						<!-- 댓글 폼 -->
						<div class="commentTopDiv" id="" >
							<span id="commentTitleSpan"><%=snickname %></span>
								<form action="ReWriteFreeBoard.jsp"  name="freeCommentForm" style="display: flex; flex-direction: column;" method="post" enctype="multipart/form-data">				
									<input type="hidden" name="f_num" value="<%=qdto.getF_num()%>">
									<textarea name="f_content" placeholder="댓글을 남겨보세요" id="commentAddStyle" required></textarea>
									
									<div id="showFreeBoardImgDiv2" >
									</div>
									
									<div id="commentBachiDiv">
										<label for="commentImg" id="commentLabel" >
								            <img src="/DongGu/img/icon_camera.svg" style="width: 22px;">
								        </label>
								        <input name="f_img" type="file" accept="image/*" style="display: none;" id="commentImg" onchange="showFreeBoardImg(event);">
										
										<input type="submit" class="FreeBoardButton" value="등록" id="commetAddButton" >
									</div>
							</form>
						</div>
						<%
					}//댓글이 x 로그인o
		
					//댓글이 x 로그인x
					else{
						
					}//댓글이 x 로그인x
			    }//댓글이없으면
			%>
			</div>

			<%
				if(f_id.equals(sid)){
					%>
					<input class="FreeBoardButton" id="ReWriteButton" type="button" value="수정하기"  onclick="location.href='/DongGu/free/UpdateFreeBoard.jsp?f_num=<%=f_num %>';">
					<input class="FreeBoardButton" id="ReWriteButton" type="button" value="삭제하기"  onclick="location.href='/DongGu/free/DeleteFreeBoard.jsp?f_num=<%=f_num %>';">
					<%
				}
			%>
			
			<input class="FreeBoardButton" id="FreeBoardTableButton" type="button" value="뒤로가기"  onclick="location.href='/DongGu/free/FreeBoard.jsp?cp=<%=cp %>';">
			<%-- QnABoard.jsp?cp=<%=cp %> --%>
		
		</div>

	<div>
		<% 
		// 이 게시물이 유일한거라면 아무것도 안함
		if(array==null||array.size()==0){
			
		}
		//한 게시글만 있어서 다음 또는 이전글만 있다면
		else if(array.size()==1){
			
			//만약 갖고온글이 다음 글이라면?
			if(array.get(0).getF_num()>f_num){
				%>
				<div class="QnABoardNextBeforeSizeDiv QnABoardMarginDiv">
					<p><span class="QnABoardNextBeforeSpan">다음</span> <a href="/DongGu/free/DetailFreeBoard.jsp?f_id=<%=f_id%>&f_num=<%=array.get(0).getF_num()%>&cp=<%=cp%>"><%=array.get(0).getF_title() %> </a></p>
				</div>
				<%
			}
			//전글
			else if(array.get(0).getF_num()<f_num){
				%>
				<div class="QnABoardNextBeforeSizeDiv QnABoardMarginDiv">
					<p><span class="QnABoardNextBeforeSpan">이전</span>  <a href="/DongGu/free/DetailFreeBoard.jsp?f_id=<%=f_id%>&f_num=<%=array.get(0).getF_num()%>&cp=<%=cp%>"><%=array.get(0).getF_title() %> </a></p>
				</div>
				<%
			}
		}
		else if(array.size()==2){
			
			if(array.get(0).getF_num() >array.get(1).getF_num() ){
			%>
			<div class="QnABoardNextBeforeSizeDiv QnABoardTopMarginDiv">
				<p><span class="QnABoardNextBeforeSpan">다음</span>  <a href="/DongGu/free/DetailFreeBoard.jsp?q_id=<%=f_id%>&f_num=<%=array.get(0).getF_num()%>&cp=<%=cp%>"><%=array.get(0).getF_title() %></a></p> 
			</div>
			<div class="QnABoardBottomMarginDiv">
				<p><span class="QnABoardNextBeforeSpan">이전</span>  <a href="/DongGu/free/DetailFreeBoard.jsp?q_id=<%=f_id%>&f_num=<%=array.get(1).getF_num()%>&cp=<%=cp%>"><%=array.get(1).getF_title() %> </a></p>
			</div>
			<%
			}
			else{
				%>
				<div class="QnABoardNextBeforeSizeDiv QnABoardTopMarginDiv">
					<p><span class="QnABoardNextBeforeSpan">다음</span>  <a href="/DongGu/free/DetailFreeBoard.jsp?f_id=<%=f_id%>&f_num=<%=array.get(1).getF_num()%>&cp=<%=cp%>"><%=array.get(1).getF_title() %> </a></p>
				</div>
				<div class="QnABoardNextBeforeSizeDiv QnABoardBottomMarginDiv ">
					<p><span class="QnABoardNextBeforeSpan">이전</span>  <a href="/DongGu/free/DetailFreeBoard.jsp?f_id=<%=f_id%>&f_num=<%=array.get(0).getF_num()%>&cp=<%=cp%>"><%=array.get(0).getF_title() %> </a></p>
				</div>
				<%
			}
		}
		%>
		
	</div>
	</div>
	</div>
<%@include file="../Footer.jsp" %>

</body>
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

//사진첨부시 미리보기
function showFreeBoardImg(event){
	const input = event.target;
    const previewContainer = document.getElementById('showFreeBoardImgDiv2');
    const file = input.files[0];
    const reader = new FileReader();

    // 기존 이미지나 텍스트 제거
    previewContainer.innerHTML = '';

    reader.onload = function(e) {
      const img = document.createElement('img');
      img.src = e.target.result;
      previewContainer.appendChild(img);
    };

    if (file) {
      reader.readAsDataURL(file);
    } 
}


//답글쓰기 누르면 생김
function openReCommentAdd(index){
	
	var element = document.getElementById('reCommentAdd' + index);
	    
	    if (element.style.display === 'block') {
	        element.style.display = 'none';
	    } else {
	        element.style.display = 'block';
	    }
}

//수정
function updateComment(num){
	window.alert("수정"+num);
}

//삭제
function deleteComment(num){
	window.alert("삭제" +num);
}

</script>

</html>