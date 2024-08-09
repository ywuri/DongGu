<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="fdto" class="com.DongGu.friend.FriendDTO"></jsp:useBean>
<jsp:setProperty property="*" name="fdto"/>
<jsp:useBean id="fdao" class="com.DongGu.friend.FriendDAO" scope="session"></jsp:useBean>

<%
	//24-08-09 필요없는 파일
	//24-08-14 사용안하면 삭제예정
	int my_animal_key = Integer.parseInt(request.getParameter("my_animal_key"));


	String result = fdao.animalInfo(my_animal_key);
	//String msg = result>0?"글쓰기 성공!":"글쓰기 실패!";
	//String msg = result+"//"+animal_key;
	
	String[] result_arr = result.split("//");
	
	String a_num = result_arr[0];
	String a_name = result_arr[1];
	String at_num = result_arr[2];
	String at_name = result_arr[3];



	String w_title = request.getParameter("write_title");
	String w_start = request.getParameter("write_start");
	String w_end = request.getParameter("write_end");
	String w_content = request.getParameter("write_content");
	
	
					
%>
<script>
	//alert('animal_key::::<%=my_animal_key%>');
	location.href='GetFriendWrite.jsp?myani_num=<%=my_animal_key %>&a_num=<%=a_num %>&a_name=<%=a_name %>&at_num=<%=at_num %>&at_name=<%=at_name %>&w_title=<%=w_title %>&w_start=<%=w_start %>&w_end=<%=w_end %>&w_content=<%=w_content %>';
</script>