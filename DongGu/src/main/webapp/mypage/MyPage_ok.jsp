<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.io.File" %>
<%@ page import="com.DongGu.mypage.MyPageDAO" %>    
<%@ page import="com.DongGu.mypage.MyPageDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
  String action = request.getParameter("action");
  int actionValue = Integer.parseInt(action);
  String i_num = request.getParameter("i_num");
  String ap_num = request.getParameter("ap_num");
  MyPageDAO dao = new MyPageDAO();
  MyPageDTO dto = new MyPageDTO();

  int result = 0;
  int result2 = 0;
  
  switch (actionValue) {
    case 11:
%>
    <script>
   	 console.log(i_num, actionValue);
      var i_num = '<%= i_num %>';
      var ap_num = '<%= ap_num %>';
      location.href = '/DongGu/saveForm/DoFriendWrite.jsp?i_num='+encodeURIComponent(i_num)+'&ap_num=' + encodeURIComponent(ap_num);
    </script>
<%
      break;
    case 12:
%>
<% 
result = dao.mypage_Ap_delete(ap_num);
if(result==1){
%>
		<script>
		window.alert('지원이 성공으로 취소되었습니다!');
		location.href='/DongGu/mypage/MyPage.jsp';
		</script>
    	<%
}else{
    	%>
    	<script>
		window.alert('지원 취소에 실패하였습니다!');
		location.href='/DongGu/mypage/MyPage.jsp';
		</script>
<%   	
} 
%>
<%
      break; 
    case 1: // 고용자가 지원현황 버튼 눌렀을때, 지원자 리스트 보여지는 페이지로 이동 -> 여기에는 선택하기 버튼 있어서 나머지 지원자들은 삭제됨 
%>
	<script>
	  console.log(i_num, actionValue);
      var i_num = '<%= i_num %>';
      var ap_num = '<%= ap_num %>';
      var actionValue = '<%= actionValue %>';
      location.href = '/DongGu/mypage/MyPage_InviteLIst.jsp?i_num='+encodeURIComponent(i_num);

    </script>
<%
      break; 
    case 2: // 고용자가 초대수정 버튼 눌렀을때, 초대수정 페이지 : 파라미터 i_num  
%>
<%
      break; 
    case 3: // 고용자가 초대취소 버튼 눌렀을때, 초대장이랑 지원자 등록폼 삭제 
%>


<%
      break;
    case 13:
%>
<% 
result = dao.mypage_Ap_update(ap_num);
result2 = dao.mypage_Iv_update(i_num);
if(result ==1 && result2 ==1){
%>
		<script>
		window.alert('매칭 수락 하셨습니다!');
		location.href='/DongGu/mypage/MyPage.jsp';
		</script>
    	<%
}else{
    	%>
    	<script>
		window.alert('매칭 수락에 실패하였습니다!');
		location.href='/DongGu/mypage/MyPage.jsp';
		</script>
<%   	
} 
%>
<%
      break;
    case 14:
%>
<% 
result = dao.mypage_Ap_delete(ap_num);

if( result ==1 ){
%>
		<script>
		window.alert('매칭을 성공적으로 거절하셨습니다!');
		location.href='/DongGu/mypage/MyPage.jsp';
		</script>
    	<%
}else{
    	%>
    	<script>
		window.alert('매칭 거절에 실패하였습니다!');
		location.href='/DongGu/mypage/MyPage.jsp';
		</script>
<%   	
} 
%>
<%
     	break;
     case 15:
%>
<% 
result = dao.mypage_Ap_delete(ap_num);
result2 = dao.mypage_Iv_delete(i_num);
if(result==1 && result2==1){
%>
		<script>
		window.alert('매칭을 성공적으로 포기하셨습니다!\n단, 매칭포기에 대한 패널티가 적용됩니다.' );
		location.href='/DongGu/mypage/MyPage.jsp';
		</script>
    	<%
}else{
    	%>
    	<script>
		window.alert('매칭 포기에 실패하였습니다!');
		location.href='/DongGu/mypage/MyPage.jsp';
		</script>
<%   	
	} 
  }
%>