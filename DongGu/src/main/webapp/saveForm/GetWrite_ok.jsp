<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="fdto" class="com.DongGu.friend.FriendDTO"></jsp:useBean>
<jsp:setProperty property="*" name="fdto"/>
<jsp:useBean id="fdao" class="com.DongGu.friend.FriendDAO" scope="session"></jsp:useBean>

<%


	
	int result = 0;
	//String result = fdao.FriendOwnerWrite(fdto);
	String msg = "";
	//String msg = result;
	
	
	//System.out.println(request.getParameter("update_yn"));	//0이면 초대하기, 1이면 수정하기
	//String update_yn = request.getParameter("update_yn");
	
	int update_yn_val = Integer.parseInt(request.getParameter("update_yn"));
	
	//등록모드
	if(update_yn_val == 0){

		result = fdao.FriendOwnerWrite(fdto);
		msg = result>0?"초대장이 등록되었습니다!":"초대장 등록이 되지 않았습니다. 관리자에게 문의하세요.";
		
	//수정모드
	}else {
		int i_num_value = Integer.parseInt(request.getParameter("i_nums"));
		result = fdao.FriendOwnerUpdate(i_num_value, fdto);
		msg = result>0?"초대장이 수정되었습니다!":"초대장 수정이 되지 않았습니다. 관리자에게 문의하세요.";
		
	}


	/*	
	// 폼 데이터 읽기
	int updateAiNum = Integer.parseInt(request.getParameter("update_ai_num"));
	String iTitle = request.getParameter("i_title");
	
	// FriendDTO에 값 설정
	fdto.setAi_num(updateAiNum);
	fdto.setI_title(iTitle);
	*/


%>
<script>
	window.alert('<%=msg%>');
	location.href='/DongGu/saveForm/FindDongGu.jsp';
</script>