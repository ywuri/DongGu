<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="java.io.File" %>
<%@ page import="com.DongGu.mypage.MyPageDAO" %>    
<%@ page import="com.DongGu.mypage.MyPageDTO" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
  String m_sid = (String)session.getAttribute("sid");
  String m_sname = (String)session.getAttribute("sname");
  Integer m_usertype = (Integer)session.getAttribute("usertype"); 
  String action = request.getParameter("action");
  int actionValue = Integer.parseInt(action);
  String i_num = request.getParameter("i_num");
  String ap_num = request.getParameter("ap_num");
  MyPageDAO dao = new MyPageDAO();
  MyPageDTO dto = new MyPageDTO();

  int result = 0;
  int result2 = 0;
  int result3 = 0;

  
  switch (actionValue) {
    case 11: // 구직자가 지원수정을 눌렸을때, 지원수정 페이지로 이동 : 파라미터 i_num , ap_num
%>
    <script>
   	  console.log(i_num, actionValue);
      var i_num = '<%= i_num %>';
      var ap_num = '<%= ap_num %>';
      var actionValue = '<%= actionValue %>';
      location.href = '/DongGu/saveForm/DoFriendWrite.jsp?i_num='+encodeURIComponent(i_num)+'&ap_num=' + encodeURIComponent(ap_num);
    </script>
<%
      break;
    case 12: // 구직자가 지원취소를 눌렸을때, application 테이블의 해당 구직자의 ap_num 행 삭제
%>
<% 
result = dao.mypage_p_Ap_delete(ap_num);
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
    case 1: // 고용자가 마이페이지 메인 지원현황 버튼 눌렀을때, 해당 초대장에 지원한 지원자 리스트 보여지는 페이지로 이동 : 파라미터 i_num, btn 
%>
	<script>
	  console.log(i_num, actionValue);
      var i_num = '<%= i_num %>';
      var ap_num = '<%= ap_num %>';
      var actionValue = '<%= actionValue %>';
      location.href = '/DongGu/mypage/MyPage_InviteList.jsp?i_num=' + encodeURIComponent(i_num) + '&btn=1&type=0';
    </script>
<%
      break; 
    case 111: // 고용자가 초대내역에서 지원현황 버튼 눌렀을때, 해당 초대장에 지원한 지원자 리스트 보여지는 페이지로 이동 : 파라미터 i_num, btn 
%>
	<script>
	  console.log(i_num, actionValue);
      var i_num = '<%= i_num %>';
      var ap_num = '<%= ap_num %>';
      var actionValue = '<%= actionValue %>';
      location.href = '/DongGu/mypage/MyPage_InviteList.jsp?i_num=' + encodeURIComponent(i_num) + '&btn=1&type=3';
    </script>
<%
      break; 
    case 2: // 고용자가 초대수정 버튼 눌렀을때, 초대수정 페이지로 이동 : 파라미터 i_num  
%>
	<script>
	console.log(i_num, actionValue);
      var i_num = '<%= i_num %>';
      var ap_num = '<%= ap_num %>';
      var actionValue = '<%= actionValue %>';
      location.href = '/DongGu/saveForm/GetFriendWrite.jsp?i_num='+encodeURIComponent(i_num);
    </script>
<%
      break; 
    case 3: // 고용자가 초대취소 버튼 눌렀을때, 해당 초대장에 지원한 application 테이블의 해당 구직자의 ap_num 행 모두 삭제 및 invitation 테이블의 해당 초대장 삭제 
%>
<% 
result = dao.mypage_o_Ap_delete1(i_num);
result2 = dao.mypage_o_Ap_delete2(i_num);

if(result>=1 && result2>=1){
%>
		<script>
		window.alert('초대가 성공으로 취소되었습니다!');
		location.href='/DongGu/mypage/MyPage.jsp';
		</script>
    	<%
}else{
    	%>
    	<script>
		window.alert('초대 취소에 실패하였습니다!');
		location.href='/DongGu/mypage/MyPage.jsp';
		</script>
<%   	
} 
%>
<%
      break; 
    case 4: // 고용자가 선택하기 버튼 눌렀을때, 선택한 ap_num에 존재하는 m_num을 2로 업데이트 및 해당 고용자의 i_num에 존재하는 m_num을 2로 업데이트
%>
<% 
result = dao.mypage_o_Ap_update2(ap_num);
result2 = dao.mypage_o_Iv_update2(i_num);

if(result>=1 && result2>=1){
%>
		<script>
		window.alert('매칭을 성공적으로 요청하였습니다!\n매칭을 수락하기 전까지 기다려주세요!');
		location.href='/DongGu/mypage/MyPage.jsp';
		</script>
    	<%
}else{
    	%>
    	<script>
		window.alert('매칭요청에 실패하였습니다!');
		location.href='/DongGu/mypage/MyPage_InviteList.jsp?i_num='+encodeURIComponent(i_num)+'&btn=1';
		</script>
<%   	
} 
%>
<%
      break; 
    case 13: // 구직자가 매칭 수락를 눌렸을때, application 테이블에 존재하는 m_num을 3로 업데이트 및 invitation 테이블에 존재하는 m_num을 3으로 업데이트
    // 또한, 매칭을 수락한 초대장에 대한 본인을 제외한 나머지 구직자의 ap_num을 삭제
%>
<% 
result = dao.mypage_Ap_update3(ap_num);
result2 = dao.mypage_Iv_update3(i_num);
result3 = dao.mypage_p_Ap_delete2(i_num);
if(result>=1 && result2>=1 &&(result3>=1 || result3>-1)){
%>
		<script>
		window.alert('매칭을 수락 하셨습니다!');
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
    case 14: // 구직자가 매칭 거절를 눌렸을때, 본인의 ap_num을 삭제 및 해당 초대장의 m_num을 1로 업데이트
%>
<% 
result = dao.mypage_Ap_delete(ap_num);
result2 = dao.mypage_Iv_update1(i_num);
if(result>=1 && result2>=1){
%>
		<script>
		window.alert('매칭을 거절하셨습니다!\n해당 초대에 대한 지원이 삭제됩니다.');
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
    case 5: // 고용자가 지원내역을 눌렸을 때, 지원내역(초대장 관리의 상세페이지)  페이지로 이동 : 파라미터 i_num , btn
%> 
<script>
console.log(i_num, actionValue);
var i_num = '<%= i_num %>';
var ap_num = '<%= ap_num %>';
var actionValue = '<%= actionValue %>';
location.href = '/DongGu/mypage/MyPage_InviteList.jsp?i_num='+encodeURIComponent(i_num)+'&btn=0';
</script>
<%
      break;
    case 6: // 고용자가 매칭취소를 눌렸을 때, 본인의 i_num을 삭제 및 해당 초대장의 ap_num도 삭제 (페널티 공지)
%>
<% 
result = dao.mypage_o_Ap_delete1(i_num);
result2 = dao.mypage_o_Ap_delete2(i_num);
if(result>=1 && result2>=1){
%>
		<script>
		window.alert('구직자에게 매칭이 요청되었기에 \n매칭취소 시, 패널티가 부과됩니다.');
		location.href='/DongGu/mypage/MyPage.jsp';
		</script>
    	<%
}else{
    	%>
    	<script>
		window.alert('매칭 취소에 실패하였습니다!');
		location.href='/DongGu/mypage/MyPage.jsp';
		</script>
<%   	
} 
%>
<%
     	break;
     case 15: // 구직자가 케어완료를 눌렸을 때, 본인 application의 m_num을 4로 업데이트 및 해당 초대장의 m_num을 4로 업데이트
%>
<% 
result = dao.mypage_Ap_update4(ap_num);
result2 = dao.mypage_Iv_update4(i_num);
if(result>=1 && result2>=1){
%>
		<script>
		window.alert('케어를 완료하셨습니다!');
		location.href='/DongGu/mypage/MyPage.jsp';
		</script>
    	<%
}else{
    	%>
    	<script>
		window.alert('케어완료에 실패하였습니다!');
		location.href='/DongGu/mypage/MyPage.jsp';
		</script>
<%   	
	} 
%>
<%
break;
case 7: // 매칭성공의 상태에서 고용자가 지원내역을 눌렸을 때, 지원내역(초대장 관리의 상세페이지)  페이지로 이동 : 파라미터 i_num , btn 
// 단, 이때는 지원자가 한명으로 선택되어있기에 한개의 지원내역만 보여짐 
%> 
<script>
console.log(i_num, actionValue);
var i_num = '<%= i_num %>';
var ap_num = '<%= ap_num %>';
var actionValue = '<%= actionValue %>';
location.href = '/DongGu/mypage/MyPage_InviteList.jsp?i_num='+encodeURIComponent(i_num)+'&btn=0&type=0';
</script>
<%
break;
case 777: // 매칭성공의 상태에서 고용자가 초대 내역 페이지에서 지원내역을 눌렸을 때, 지원내역(초대장 관리의 상세페이지)  페이지로 이동 : 파라미터 i_num , btn 
// 단, 이때는 지원자가 한명으로 선택되어있기에 한개의 지원내역만 보여짐 
%> 
<script>
console.log(i_num, actionValue);
var i_num = '<%= i_num %>';
var ap_num = '<%= ap_num %>';
var actionValue = '<%= actionValue %>';
location.href = '/DongGu/mypage/MyPage_InviteList.jsp?i_num='+encodeURIComponent(i_num)+'&btn=0&type=3';
</script>
<%
break;
case 16: // 구직자가 후기작성 버튼을 눌렸을 때, 후기 작성 페이지로 이동 : 파라미터 send_id
String send_id = dao.mypage_p_review (i_num);
%> 
<script>
console.log(i_num, actionValue);
var i_num = '<%= i_num %>';
var ap_num = '<%= ap_num %>';
var actionValue = '<%= actionValue %>';
var send_id = '<%= send_id %>';
location.href = '/DongGu/afterForm/AfterWrite.jsp?send_id='+ encodeURIComponent(send_id);
</script>
<%
break;
case 17: // 구직자가 내 지원서 버튼을 눌렸을 때, MyPage_ApplyManage_Look.jsp 페이지로 이동 : 파라미터 p_id, i_num, btn
String p_id= dao.mypage_p_LookApply(ap_num);
%> 
<script>
console.log(i_num, actionValue);
var i_num = '<%= i_num %>';
var ap_num = '<%= ap_num %>';
var actionValue = '<%= actionValue %>';
var p_id = '<%= p_id %>';
location.href = '/DongGu/mypage/MyPage_ApplyLook.jsp?p_id='+encodeURIComponent(p_id)+'&i_num='+encodeURIComponent(i_num)+'&btn=0&type=1';
</script>
<%
break;
case 1717: // 구직자가 내 지원서 버튼을 눌렸을 때, MyPage_ApplyManage_Look.jsp 페이지로 이동 : 파라미터 p_id, i_num, btn
String p_id2= dao.mypage_p_LookApply(ap_num);
%> 
<script>
console.log(i_num, actionValue);
var i_num = '<%= i_num %>';
var ap_num = '<%= ap_num %>';
var actionValue = '<%= actionValue %>';
var p_id2 = '<%= p_id2 %>';
location.href = '/DongGu/mypage/MyPage_ApplyLook.jsp?p_id='+encodeURIComponent(p_id2)+'&i_num='+encodeURIComponent(i_num)+'&btn=0&type=3';
</script>
<%
break;
case 9: // 고용자가 후기작성 버튼을 눌렸을 때, 후기 작성 페이지로 이동 : 파라미터 send_id
String send_id2 = dao.mypage_o_review(i_num);
%> 
<script>
console.log(i_num, actionValue);
var i_num = '<%= i_num %>';
var ap_num = '<%= ap_num %>';
var actionValue = '<%= actionValue %>';
var send_id2 = '<%= send_id2 %>';
location.href = '/DongGu/afterForm/AfterWrite.jsp?send_id=' + encodeURIComponent(send_id2);
</script>
<%
break;
case 10: // 고용자가 후기보기 버튼을 눌렸을 때, 후기 상세 페이지로 이동 : 파라미터 r_num
String r_num = dao.mypage_o_Lookreview(m_sid,ap_num);
%> 
<script>
console.log(i_num, actionValue);
var i_num = '<%= i_num %>';
var ap_num = '<%= ap_num %>';
var actionValue = '<%= actionValue %>';
var r_num = '<%= r_num %>';
location.href = '/DongGu/afterForm/AfterView.jsp?r_num=' + encodeURIComponent(r_num);
</script>
<%
break;
case 18: // 구직자가 후기보기 버튼을 눌렸을 때, 후기 상세 페이지로 이동 : 파라미터 r_num
String r_num2 = dao.mypage_p_Lookreview(m_sid,i_num);
%> 
<script>
console.log(i_num, actionValue);
var i_num = '<%= i_num %>';
var ap_num = '<%= ap_num %>';
var actionValue = '<%= actionValue %>';
var r_num2 = '<%= r_num2 %>';
location.href = '/DongGu/afterForm/NoDongguAfterView.jsp?r_num=' + encodeURIComponent(r_num2);
</script>
<%
}
%>