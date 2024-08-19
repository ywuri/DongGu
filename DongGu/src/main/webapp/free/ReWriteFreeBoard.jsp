<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import ="java.io.*"%>
<jsp:useBean id="fdto" class="com.DongGu.board.FreeBoardDTO"></jsp:useBean>
<jsp:useBean id="fdao" class="com.DongGu.board.FreeBoardDAO"></jsp:useBean>
<jsp:useBean id="cdto" class="com.DongGu.board.FreeCommentDTO"></jsp:useBean>

<%
request.setCharacterEncoding("utf-8");

//사진이 있다면 사진 처리
String uploadPath = request.getRealPath("/") + "img/free/temp"; // 임시 저장 경로
String savepath = request.getRealPath("/")+"img/free/";

//System.out.println("Temp 경로: " + uploadPath);
//System.out.println("저장 경로: " + savepath);

//System.out.println(savepath);
MultipartRequest mr = new MultipartRequest(request,uploadPath,10*1024*1024,"utf-8");
String originalFileName = mr.getFilesystemName("f_img");
String newFileName="";

//사진이 첨부됐으면
if (originalFileName != null) {
	String jpgType = "";//확장자 추출
	int lastDotIndex = originalFileName.lastIndexOf(".");
	if (lastDotIndex > 0) {
		jpgType = originalFileName.substring(lastDotIndex); // 예: ".jpg"
	}


	//새 파일 이름 생성 (확장자 유지)
	newFileName = "freeC"+fdao.getSequnceNumForImgComment() + jpgType; // 예: "free1.jpg"
	
	// 파일 경로 객체 생성
	File tempFile = new File(uploadPath, originalFileName);
	File finalFile = new File(savepath, newFileName);

	// 파일이 존재하면 삭제
    if (finalFile.exists()) {
        if (!finalFile.delete()) {
            throw new IOException("기존 파일 삭제에 실패했습니다: " + finalFile.getName());
        }
        //System.out.println("기존 파일 삭제 완료: " + finalFile.getName());
    }

    // 파일 이름 변경 (이동)
    if (tempFile.renameTo(finalFile)) {
        //System.out.println("파일이 성공적으로 이동되었습니다: " + newFileName);
    } else {
        //System.out.println("파일 이동에 실패했습니다: " + originalFileName);
    }
}


cdto.setFc_content(mr.getParameter("f_content"));

String ref = mr.getParameter("fc_ref");
String lev = mr.getParameter("fc_lev");
String sunbun = mr.getParameter("fc_sunbun");

if(ref!=null && ref.length()!=0){
	cdto.setFc_ref(Integer.parseInt(ref) );
}
if(lev!=null &&  lev.length()!=0){
	cdto.setFc_lev(Integer.parseInt(lev) );
}
if(sunbun!=null &&  sunbun.length()!=0){
	cdto.setFc_sunbun(Integer.parseInt(sunbun) );
}

cdto.setFc_img(newFileName);
System.out.println();
cdto.setF_num(Integer.parseInt(mr.getParameter("f_num")));


cdto.setFc_id((String)session.getAttribute("sid"));
cdto.setFc_nickname((String)session.getAttribute("snickname"));

int result=0;
if(ref==null || ref.length()==0){
	result=	fdao.ReWriteFreeBoard(cdto);
}
else{
	result =fdao.ReReWriteFreeBoard(cdto);
}

//오류
if(result==0){
	%>
	<script>
	window.alert('[오류] 댓글 작성실패');
	window.location.href="/DongGu/free/FreeBoard.jsp";
	</script>
<%
}else if(result>=1){
	%>
	<script>
	window.alert('댓글 작성완료!');
	window.location.href="/DongGu/free/FreeBoard.jsp";
	</script>
<%
}
%>