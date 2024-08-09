<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@page import="java.util.*" %>
<%@page import="com.DongGu.friend.FriendDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
<jsp:useBean id="fdao" class="com.DongGu.friend.FriendDAO"></jsp:useBean>

<%
	String s_id =(String)session.getAttribute("sid");
	if(s_id==null || s_id.equals("")){
%>
		<script>
		window.alert('로그인 후 접속가능합니다.');
		window.location.href="/DongGu/member/login.jsp";
		</script>
<%
	}
	
	String a_num = "";
	String w_title = "";
	String w_start = "";
	String w_end = "";
	String w_content = "";
%>
<script>
	function animalChange(myani_num){

        var selectElement = document.getElementById('ai_num');
        var options = selectElement.options;
        var ai_num, val_img, val_birth, val_link, val_aler, val_dise, val_caut;

        //select box option수만큼 돌리기
        for (var i = 0; i < options.length; i++) {

        	//option의 value가 myani_num와 동일 한 것 찾기
            if (options[i].value === myani_num) {

            	//option의 각 설정해준 값을 변수에 담기
            	ai_num = options[i].getAttribute('value');		//animalinfo테이블의 기본키
            	val_name = options[i].getAttribute('val_name');	//animalinfo테이블의 동물이름
            	val_img = options[i].getAttribute('val_img');
                val_birth = options[i].getAttribute('val_birth');
                val_link = options[i].getAttribute('val_link');
                val_aler = options[i].getAttribute('val_aler');
                val_dise = options[i].getAttribute('val_dise');
                val_caut = options[i].getAttribute('val_caut');
                
                val_anitype_num = options[i].getAttribute('val_anitype_num');	//animalinfo테이블, animaltype테이블의 at_num
                val_anitype_name = options[i].getAttribute('val_anitype_name');	//animaltype테이블의 at_name	(시츄, 푸들등)
                val_ani_num = options[i].getAttribute('val_ani_num');	//animaltype테이블, animal테이블의 a_num
                val_ani_name = options[i].getAttribute('val_ani_name');	//animal테이블의 a_name (강아지, 고양이 등)
            }
        }

        //해당 페이지의 td id 값 변수로 설정해주기
        var data_ani_name = document.getElementById('data_ani_name');
        var data_anitype_name = document.getElementById('data_anitype_name');
        
        var data_ani_img = document.getElementById('data_ani_img');
        var data_ani_birth = document.getElementById('data_ani_birth');
        var data_ani_alerg = document.getElementById('data_ani_alerg');
        var data_ani_disea = document.getElementById('data_ani_disea');
        var data_ani_caut = document.getElementById('data_ani_caut');

        //변수로 설정한 td id의 textContent를 
        //select box option을 통해 넘어온 값으로 바꿔주기
        data_ani_name.textContent = val_ani_name;
        data_anitype_name.textContent = val_anitype_name;

        data_ani_img.textContent = val_img;
        data_ani_birth.textContent = val_birth;
        data_ani_alerg.textContent = val_aler;
        data_ani_disea.textContent = val_dise;
        data_ani_caut.textContent = val_caut;
        
		//성격
        //val_link = options[i].getAttribute('val_link');
	}
</script>
</head>
<body>
<%@include file="Header.jsp" %>
    
	<form name="getWrite" action="GetWrite_ok.jsp">
	
		<div class="saveTableOne">
			<h3>초 대 장</h3>
			<table>
				<tr>
					<th>초대제목</th>
					<td>
						<input type="text" name="i_title" id="i_title" value="<%=w_title%>" class="saveWS250">
					</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>
						<input type="date" name="i_start" id="i_start" value="<%=w_start%>" class="saveWS100"> ~ 
						<input type="date" name="i_end" id="i_end" value="<%=w_end%>" class="saveWS100">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<% 
							if(s_id != null && !s_id.equals("")){
								String animalName = fdao.animalName(s_id);
						%>
							<select name="ai_num" id="ai_num" class="saveWS250" onchange="animalChange(this.value);">
								<option value="">동물이름을 선택해주세요.</option>
								<%=animalName%>
							</select>
						<%
						    }
						%>
					</td>
				</tr>
				<tr>
					<th>동물</th>
					<td id="data_ani_name">
						**동물이름을 선택해주세요.
					</td>
				</tr>
				<tr>
					<th>품종</th>
					<td id="data_anitype_name">
						**동물이름을 선택해주세요.
					</td>
				</tr>
				<tr>
					<th>사진</th>
					<td id="data_ani_img">
						**동물이름을 선택해주세요.
					</td>
				</tr>
				
				<% 
					if(s_id != null && !s_id.equals("")){
						
						String ownerData2 = fdao.ownerData(s_id);
						String[] owner_arr = ownerData2.split("//");

						String ownerAddr = owner_arr[0];
						String ownerHouse = owner_arr[1];
				%>
				<tr>
					<th>주소</th>
					<td><%=ownerAddr %></td>
				</tr>
				<tr>
					<th>자택종류</th>
					<td><%=ownerHouse %></td>
				</tr>
				<%
				    }
				%>
				<tr>
					<th>생년월일</th>
					<td id="data_ani_birth">
						**동물이름을 선택해주세요.
					</td>
				</tr>
				<tr>
					<th>성격</th>
					<td>
						●★●동물이름선택후 동물의 성격●★● 작업필요
						<input type="button" class="saveBtnTypeClick_2" value="성격1" onclick="">
						<input type="button" class="saveBtnTypeClick_2" value="성격3" onclick="">
						<input type="button" class="saveBtnTypeClick_2" value="성격4" onclick="">
					</td>
				</tr>
				<tr>
					<th>알레르기</th>
					<td id="data_ani_alerg">
						**동물이름을 선택해주세요.
					</td>
				</tr>
				<tr>
					<th>병력사항</th>
					<td id="data_ani_disea">
						**동물이름을 선택해주세요.
					</td>
				</tr>
				<tr>
					<th>주의사항</th>
					<td id="data_ani_caut">
						**동물이름을 선택해주세요.
					</td>
				</tr>
				<tr>
					<th>추가내용</th>
					<td>
						<textarea class="saveWS100p saveHS100" placeholder="추가할 내용을 적어주세요." name="i_content" id="i_content"><%=w_content%></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" name="" id="" value="초대하기" class="saveBtnOne">
		</div>
		
	</form>
    
	<!-- 
	<form name="getWriteAnimal" action="GetWriteAnimal_ok.jsp">
		<input type="text" name="my_animal_key" id="my_animal_key" value="">
		
		<input type="text" name="write_title" id="write_title" value="">
		<input type="text" name="write_start" id="write_start" value="">
		<input type="text" name="write_end" id="write_end" value="">
		<input type="text" name="write_content" id="write_content" value="">
		
	</form>
	 -->	
	
<%@include file="Footer.jsp" %>

</body>
</html>