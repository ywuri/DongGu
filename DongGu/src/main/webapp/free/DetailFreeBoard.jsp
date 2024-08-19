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

//댓글을 계층에 맞게 만들기
HashMap<Integer, FreeCommentDTO> commentMap = new HashMap<>();
for (FreeCommentDTO comment : commentArray) {
  commentMap.put(comment.getFc_num(), comment);
}
//
List<FreeCommentDTO> commentList = new ArrayList<>();

for (FreeCommentDTO comment : commentArray) {
  if (comment.getFc_renum() == 0) {
      // 해당 댓글에 대한 대댓글을 찾습니다.
      for (FreeCommentDTO commentDTO : commentArray) {
          if (commentDTO.getFc_ref() == comment.getFc_num()) {
          	commentList.add(commentDTO);
          }
      }
  }
}

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

//다음,전글 가져오기
ArrayList<FreeBoardDTO> array = null;
array = dao.getNextFreeBoard(f_num);


//이게 댓글수정이라면
String update_fc_num = request.getParameter("update_fc_num");
int update_fc_num_int=0;
if(update_fc_num!=null && update_fc_num.length()!=0){
	update_fc_num_int = Integer.parseInt(update_fc_num) ;
}


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
				    boolean hasComments = (commentList != null && commentList.size() > 0);
				    boolean isLoggedIn = (sid != null && !sid.equals(""));
    
				    //댓글이 있고 없고 --> 있을떄 반복문 돌아감
				    //로그인을 했고 안했고-->했을때 댓글창생김
				    
				    //댓글이 있으면
				    if(hasComments){
				    	
				    	//댓글보여주기 반복문
				    	for(int i =0;i<commentList.size();i++){
				    	%>
			
						<!-- 댓글보여주는 형식 만들기 -->
						<hr style="border:1px solid #f2f2f2; ">
						
						<% 
						//만약수정중인 글이라면
						if(update_fc_num_int==commentList.get(i).getFc_num()){
							%>
							<div class="commentTopDiv" id="" >
								<span id="commentTitleSpan"><%=snickname %></span>
									<form action="/DongGu/free/UpdateFreeComment.jsp"  name="updateCommentForm" style="display: flex; flex-direction: column;" method="post" enctype="multipart/form-data">
										<input type="hidden" name="fc_num" value="<%=update_fc_num_int%>">
										<textarea name="fc_content"  id="commentAddStyle" required><%=commentList.get(i).getFc_content() %></textarea>
										
										<div   class="showFreeBoardImg" id="showFreeBoardImgDivUp" >
										
											<%
												if(commentList.get(i).getFc_img()!=null && !("").equals(commentList.get(i).getFc_img().trim())){	
												%>
													<img src="/DongGu/img/free/<%=commentList.get(i).getFc_img() %>">
												<%
											}  %>
										</div>
										
										<div id="commentBachiDiv">
											<label for="commentImg" id="commentLabel" >
									            <img src="/DongGu/img/icon_camera.svg" style="width: 22px;">
									        </label>
									        <input name="fc_img" type="file" accept="image/*" style="display: none;" id="commentImg" onchange="showFreeBoardImg(event,'Up');">
											
											<input type="submit" class="FreeBoardButton" value="수정" id="commetAddButton" >
										</div>
								</form>
							</div>
							<%
						}
						//수정중인 글이 아니면
						else{
							%>
							
							<div id="commentDiv<%=commentList.get(i).getFc_num() %>"style="margin:30px; margin-left:<%= commentList.get(i).getFc_renum()==0?30:60 %>px;">
								<div style="font-size: 14pt; font-weight: 600;"><img src="/DongGu/img/icon_dove.svg" style="width:25px; margin-right:5px;">
								
								<%
								//삭제된 댓글이면 닉네임 없게
								if(commentList.get(i).getFc_id()==null||("").equals(commentList.get(i).getFc_id().trim())){
									%><%=commentList.get(i).getFc_content() %><%
								}
								//삭제된 댓글이 아니면
								else{
									%>
									<%= commentList.get(i).getFc_nickname()%>
									<%
									if(commentList.get(i).getFc_nickname().equals(qdto.getF_nickname())){
										%>
											<span style="background-color: #fffae5; color: #ffa500">작성자</span>
										<%
									}
								
								}//삭제된 댓글이 아니면
								%>
							</div>
							
							<!-- 대댓글인 경우 누구한테 보내는지 -->
							<%
							if(commentList.get(i).getFc_renum_nick()!=null && !commentList.get(i).getFc_renum_nick().equals(commentList.get(i).getFc_nickname())){
								%>
								<div style="padding-left: 30px; padding-top: 10px; font-size: 13pt;">
									<span style="font-weight: 700;  color: orange;"><%=commentList.get(i).getFc_renum_nick() %></span>
									
									<%
									if(!(commentList.get(i).getFc_id()==null||("").equals(commentList.get(i).getFc_id().trim()))){
										%>
										<%=commentList.get(i).getFc_content() %>
										<%
									}%>
									
									</div>
								<%
							}
							else{
								%>
								<div style="padding-left: 30px; padding-top: 10px; font-size: 13pt;">
									<%
									if(!(commentList.get(i).getFc_id()==null||("").equals(commentList.get(i).getFc_id().trim()))){
										%>
										<%=commentList.get(i).getFc_content() %>
										<%
									}%>
									</div>
								<%
							}
							
							if(commentList.get(i).getFc_img()!=null && !commentList.get(i).getFc_img().trim().equals("")) { 
							%>
								<div style=" width: 300px; height: 300px; padding-left: 30px; padding-top: 10px;">
									<img src="/DongGu/img/free/<%=commentList.get(i).getFc_img() %>" style="border-radius:6px; width:300px; height:300px;">
								</div>
							<%
							}
							%>
							<div style="color:#979797; padding-left:30px;padding-top:10px;">
							<%=commentList.get(i).getFc_date() %>&nbsp;&nbsp;&nbsp;
							
							<% 
							//로그인했으면
							if(isLoggedIn){
								//답글쓰기
							
								if(!(commentList.get(i).getFc_id()==null||("").equals(commentList.get(i).getFc_id().trim()))){
									%>
									<a href="javascript:void(0)" onclick="openReCommentAdd(<%=i%>)">답글쓰기</a>
									<%
								}
								%>
								
							
								<%
								//댓글 작성자와 로그인한사람이 같으면 수정,삭제버튼
								if( commentList.get(i).getFc_id().equals(sid)){
									%>
										&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="updateComment(<%=commentList.get(i).getFc_num()%>)">수정</a>
										&nbsp;<a href="javascript:void(0)" onclick="deleteComment(<%=commentList.get(i).getFc_num()%>)">삭제</a>
								
								<%
								} 
								
								//로그인을 했으나 작성자가 아니라면
								else{
									%>
										
									<%
									}
								
								}//로그인했으면
							%></div><% 
						//댓글이 o 로그인o
			    		if(isLoggedIn){
							%>
							<!-- 대댓글쓰고싶으면 -->
							<div class="commentTopDiv" id="reCommentAdd<%=i %>" style="display:none; margin-left:30px;">
								<span id="commentTitleSpan"><%=snickname %></span>
									<form action="/DongGu/free/ReWriteFreeBoard.jsp"  name="freeReCommentForm" style="display: flex; flex-direction: column;" method="post" enctype="multipart/form-data">
										
										<input type="hidden" name="fc_renum" value="<%=commentList.get(i).getFc_num()  %>">
										<input type="hidden" name="f_num" value="<%=qdto.getF_num()%>">
										
										<textarea name="fc_content" placeholder="대댓글을 남겨보세요" id="commentAddStyle" required></textarea>
										
										<div  class="showFreeBoardImg" id="showFreeBoardImgDiv<%=commentList.get(i).getFc_num() %>" >
										</div>
										
										<div id="commentBachiDiv">
											<label for="commentImg<%=commentList.get(i).getFc_num() %>" id="commentLabel" >
									            <img src="/DongGu/img/icon_camera.svg" style="width: 22px;">
									        </label>
									        <input name="fc_img" type="file" accept="image/*" style="display: none;" id="commentImg<%=commentList.get(i).getFc_num() %>" onchange="showFreeBoardImg(event,<%=commentList.get(i).getFc_num() %>);">
											
											<input type="submit" class="FreeBoardButton" value="등록" id="commetAddButton" >
										</div>
								</form>
							</div>
							<%
			    		}//댓글이 o 로그인o
			    		
			    		
			    		//댓글이 o 로그인x
			    		else{
			    			
			    		}//댓글이 o 로그인x
						%>		
							
				</div>
		
				<%
	    		
	    				}//수정중인 글이 아니면
					}//댓글보여주기 반복문	

				    	
				    	 //로그인이 됐으면 댓글입력폼 보여지게
				    	if(isLoggedIn){
				    		%>
				    		<!-- 댓글 폼 -->
							<div class="commentTopDiv" id="" >
								<span id="commentTitleSpan"><%=snickname %></span>
									<form action="/DongGu/free/ReWriteFreeBoard.jsp"  name="freeCommentFormMain" style="display: flex; flex-direction: column;" method="post" enctype="multipart/form-data">
										<input type="hidden" name="f_num" value="<%=qdto.getF_num()%>">
										<textarea name="fc_content" placeholder="댓글을 남겨보세요" id="commentAddStyle" required></textarea>
										
										<div id="showFreeBoardImgDivMain" class="showFreeBoardImg" >
										</div>
										
										<div id="commentBachiDiv">
											<label for="commentImg" id="commentLabel" >
									            <img src="/DongGu/img/icon_camera.svg" style="width: 22px;">
									        </label>
									        <input name="fc_img" type="file" accept="image/*" style="display: none;" id="commentImg" onchange="showFreeBoardImg(event,'Main');">
											
											<input type="submit" class="FreeBoardButton" value="등록" id="commetAddButton" >
										</div>
								</form>
							</div>
						<% 
    				} //로그인이 됐으면 댓글폼 보여지게
				    	
				    }//댓글이있으면
				    
				    
				    
				    //댓글이 없으면
				    else{
				    	//댓글이 x 로그인o
						if(isLoggedIn){
							%>
							<!-- 댓글 폼 -->
							<div class="commentTopDiv" id="" >
								<span id="commentTitleSpan"><%=snickname %></span>
									<form action="/DongGu/free/ReWriteFreeBoard.jsp"  name="freeCommentForm" style="display: flex; flex-direction: column;" method="post" enctype="multipart/form-data">				
										<input type="hidden" name="f_num" value="<%=qdto.getF_num()%>">
										<textarea name="fc_content" placeholder="댓글을 남겨보세요" id="commentAddStyle" required></textarea>
										
										<div id="showFreeBoardImgDiv" >
										</div>
										
										<div id="commentBachiDiv">
											<label for="commentImg" id="commentLabel" >
									            <img src="/DongGu/img/icon_camera.svg" style="width: 22px;">
									        </label>
									        <input name="fc_img" type="file" accept="image/*" style="display: none;" id="commentImg" onchange="showFreeBoardImg(event,'');">
											
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
					

			
				<!-- 댓글창 끝-->
				</div><!-- WriteFreeBoardContentDiv 끝-->
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
				
				<div style="martin-top:20px;" class="QnABoardNextBeforeSizeDiv QnABoardTopMarginDivText">
					<span>다음 글</span>
				</div>
			
				<div class="QnABoardNextBeforeSizeDiv QnABoardMarginDiv">
					<p><span class="QnABoardNextBeforeSpan">다음</span> <a href="/DongGu/free/DetailFreeBoard.jsp?f_id=<%=f_id%>&f_num=<%=array.get(0).getF_num()%>&cp=<%=cp%>"><%=array.get(0).getF_title() %> </a></p>
				</div>
				<%
			}
			//전글
			else if(array.get(0).getF_num()<f_num){
				%>
				<div style="martin-top:20px;" class="QnABoardNextBeforeSizeDiv QnABoardTopMarginDivText">
					<span>이전 글</span>
				</div>
				
				<div class="QnABoardNextBeforeSizeDiv QnABoardMarginDiv">
					<p><span class="QnABoardNextBeforeSpan">이전</span>  <a href="/DongGu/free/DetailFreeBoard.jsp?f_id=<%=f_id%>&f_num=<%=array.get(0).getF_num()%>&cp=<%=cp%>"><%=array.get(0).getF_title() %> </a></p>
				</div>
				<%
			}
		}
		else if(array.size()==2){
			
			%>
			<div style="martin-top:20px;" class="QnABoardNextBeforeSizeDiv QnABoardTopMarginDivText">
				<span>이전 글 | 다음 글</span>
			</div>
			<%
			
			
			if(array.get(0).getF_num() >array.get(1).getF_num() ){
			%>
			
			<div class="QnABoardNextBeforeSizeDiv QnABoardTopMarginDiv">
				<p style="margin-bottom: 10px;"><span class="QnABoardNextBeforeSpan">다음</span>  <a href="/DongGu/free/DetailFreeBoard.jsp?q_id=<%=f_id%>&f_num=<%=array.get(0).getF_num()%>&cp=<%=cp%>"><%=array.get(0).getF_title() %></a></p> 
			<hr style="border:1px solid #f2f2f2; margin:5px;">
			</div>
			
			<div class=" QnABoardNextBeforeSizeDiv QnABoardBottomMarginDiv">
				<p><span class="QnABoardNextBeforeSpan">이전</span>  <a href="/DongGu/free/DetailFreeBoard.jsp?q_id=<%=f_id%>&f_num=<%=array.get(1).getF_num()%>&cp=<%=cp%>"><%=array.get(1).getF_title() %> </a></p>
			</div>
			<%
			}
			else{
				%>
				<div class="QnABoardNextBeforeSizeDiv QnABoardTopMarginDiv">
					<p style="margin-bottom: 10px;"><span class="QnABoardNextBeforeSpan">다음</span>  <a href="/DongGu/free/DetailFreeBoard.jsp?f_id=<%=f_id%>&f_num=<%=array.get(1).getF_num()%>&cp=<%=cp%>"><%=array.get(1).getF_title() %> </a></p>
				<hr style="border:1px solid #f2f2f2; ">
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
function showFreeBoardImg(event,index){
	const input = event.target;
    const previewContainer = document.getElementById('showFreeBoardImgDiv' + index);
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
	//window.location.href현재주소
	
	//location.href = '/DongGu/free/DeleteFreeComment.jsp?fc_num='+num
	location.href =window.location.href+ "&update_fc_num="+num;
}

//삭제
function deleteComment(num){
	if (window.confirm("정말 삭제하시겠습니까?")) {
		 location.href = '/DongGu/free/DeleteFreeComment.jsp?fc_num='+num
				 ; // 이동할 URL을 입력
	} else {
	    
	}
}


</script>

</html>