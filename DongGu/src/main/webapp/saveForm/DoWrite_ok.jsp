<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="fdto2" class="com.DongGu.friend.FriendDTO2"></jsp:useBean>
<jsp:setProperty property="*" name="fdto2"/>
<jsp:useBean id="fdao" class="com.DongGu.friend.FriendDAO" scope="session"></jsp:useBean>

<%
	//String result = fdao.FriendSitterWrite(fdto2);
	//String msg = result;
	
	//int result = fdao.FriendSitterWrite(fdto2);
	//String msg = result>0?"초대에 응하셨습니다!":"초대에 응하지 못했습니다. 관리자에게 문의하세요.";

	int result = 0;
	String msg = "";

	int update_yn_val = Integer.parseInt(request.getParameter("update_yn"));
	System.out.println(update_yn_val);
	
	//등록모드
	if(update_yn_val == 0){

		result = fdao.FriendSitterWrite(fdto2);
		msg = result>0?"초대에 응하셨습니다!":"초대에 응하지 못했습니다. 관리자에게 문의하세요.";
		
	//수정모드
	}else {
		int ap_num_value = Integer.parseInt(request.getParameter("ap_nums"));
		result = fdao.FriendSitterUpdate(ap_num_value, fdto2);
		msg = result>0?"초대장이 수정되었습니다!":"초대장 수정이 되지 않았습니다. 관리자에게 문의하세요.";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
%>
<script>
	//alert('1234');
	window.alert('<%=msg%>');
	location.href='/DongGu/Index.jsp';
</script>