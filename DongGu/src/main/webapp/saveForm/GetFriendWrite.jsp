<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
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
	String animalName = "";

	//동물정보 기본 셋팅(로그인정보로)
	if(s_id != null && !s_id.equals("")){
		animalName = fdao.animalName(s_id, 0);
    }
%>
<script>
	function animalChange(myani_num, updateMode){

	    /*
		// 타입 확인
	    if (typeof myani_num === 'string') {
	    	alert('aaaa는 문자열입니다.');
	    } else if (typeof myani_num === 'number') {
	    	alert('aaaa는 숫자입니다.');
	    } else {
	    	alert('aaaa는 문자열도 숫자도 아닙니다.');
	    }
	    */

        var selectElement = document.getElementById('ai_num');
        var options = selectElement.options;
        var ai_num, val_img, val_birth, val_link, val_aler, val_dise, val_caut;

        //select box option수만큼 돌리기
        for (var i = 0; i < options.length; i++) {

        	//option의 value가 myani_num와 동일 한 것 찾기
            if (options[i].value == myani_num) {

            	//option의 각 설정해준 값을 변수에 담기
            	ai_num = options[i].getAttribute('value');		//animalinfo테이블의 기본키
            	
            	//alert(ai_num);
            	val_name = options[i].getAttribute('val_name');	//animalinfo테이블의 동물이름
            	val_img = options[i].getAttribute('val_img');
                val_birth = options[i].getAttribute('val_birth');
                
                val_link = options[i].getAttribute('val_link');
                val_an_nature = options[i].getAttribute('val_an_nature');
                
                // 콤마로 문자열 나누기
                let nature_parts = val_an_nature.split(",");
                
                var val_an_nat = "";
                for(let i=0; i<nature_parts.length; i++){
	                val_an_nat += '<span class="animal_nature">'+nature_parts[i].trim()+"</span>"; // 공백 제거
				}
                
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

        data_ani_img.innerHTML = "<img src='/DongGu/img/Animal/"+val_img+"' class='writeImgSize'>";
        data_ani_birth.textContent = val_birth;

        data_ani_alerg.textContent = val_aler;
        if(val_aler == "null" || val_aler == "" ){
            data_ani_alerg.textContent = "없음";
		}
        
        data_ani_disea.textContent = val_dise;
        if(val_dise == "null" || val_dise == "" ){
        	data_ani_disea.textContent = "없음";
		}
        
        data_ani_caut.textContent = val_caut;
        if(val_caut == "null" || val_caut == "" ){
        	data_ani_caut.textContent = "없음";
		}
   	
        data_ani_nature.innerHTML = val_an_nat;
	}
	
	// 현재 날짜를 YYYY-MM-DD 형식으로 가져오기
	function getCurrentDate() {
	    const today = new Date();
	    const year = today.getFullYear();
	    const month = String(today.getMonth() + 1).padStart(2, '0'); // 월은 0부터 시작하므로 +1
	    const day = String(today.getDate()).padStart(2, '0');
	    return `${year}-${month}-${day}`;
	}
	
	// 현재 날짜를 min 속성으로 설정
	document.getElementById('i_start').setAttribute('min', getCurrentDate());
	document.getElementById('i_end').setAttribute('min', getCurrentDate());
	
	//저장전 데이터 존재여부파악
	function datacheck(){
		if(document.getElementById('i_title').value.trim() === ""){
			alert("초대제목을 입력해주세요.");
			document.getElementById('i_title').focus();
			return false; // 폼 제출을 막습니다.
			
		}else if(document.getElementById('i_start').value.trim() === ""){
			alert("시작일을 입력해주세요.");
			document.getElementById('i_start').focus();
			return false;
			
		}else if(document.getElementById('i_end').value.trim() === ""){
			alert("종료일을 입력해주세요.");
			document.getElementById('i_end').focus();
			return false;
			
		}else if(document.getElementById('ai_num').value.trim() === ""){
			alert("동물명을 선택해주세요.");
			document.getElementById('ai_num').focus();
			return false;
			
		}else if(document.getElementById('i_content').value.trim() === ""){
			alert("추가내용을 입력해주세요.");
			document.getElementById('i_content').focus();
			return false;
		}
	}
</script>
<%
	// 현재 날짜를 가져와서 "yyyy-MM-dd" 형식으로 바꿔줌
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(new Date());
	
	int a_num = 0;
	int ai_num = 0;
	String w_title = "";
	String w_start = "";
	String w_end = "";
	String w_content = "";
	
	String iNumStr = request.getParameter("i_num");
	String btnValue = "초대하기";
	int btnValue_int = 0;

	int i_nums = 0;
	//마이페이지에서 넘어온 경우 iNumStr(  request.getParameter("i_num")  ) 값 존재
	//수정모드
	if (iNumStr != null && !iNumStr.isEmpty()) {

		btnValue = "초대장 수정하기";
		btnValue_int = 1;

	    i_nums = Integer.parseInt(iNumStr);
	    //int i_nums = Integer.parseInt(request.getParameter("i_num"));
		
		//마이페이지에서 수정하기 클릭시
		ArrayList<FriendDTO> arr = fdao.getFriendData(i_nums);
	
		if(arr==null||arr.size()==0){
			%>
			<script>
			window.alert('데이터가 존재하지 않습니다. 관리자에게 문의하세요.');
	        history.back(); // 이전 페이지로 돌아가기
			</script>
	<%
		}else {
		//System.out.println(arr.size());
			for(int i=0; i<arr.size(); i++){
				
				a_num = arr.get(i).getI_num();
				ai_num = arr.get(i).getAi_num();
				w_title = arr.get(i).getI_title();

				String startDateTime = arr.get(i).getI_start();
				String endDateTime = arr.get(i).getI_end();
				
				//시, 분, 초 자르고 날짜만 변수에 저장
			    w_start = startDateTime.substring(0, 10);
			    w_end = endDateTime.substring(0, 10);
								
				w_content = arr.get(i).getI_content();
			}

			//동물정보 셋팅 변경(로그인정보 +마이페이지에서 넘어온 초대장키를 기준으로 동물정보 select box selected 시키기
			animalName = fdao.animalName(s_id, ai_num);
			%>
			<script>
				//animalChange(<%=ai_num%>);
				//updateModeAnimalInfo(<%=ai_num%>);
			</script>
			<%
		}
	//초대장 처음 등록시
	}else{
	
		a_num = 0;
		ai_num = 0;
		w_title = "";
		w_start = today;
		w_end = today;
		w_content = "";
	}
%>
</head>
<body>
<%@include file="../SubHeader.jsp" %>
    
	<form name="getWrite" action="GetWrite_ok.jsp" onsubmit="return datacheck();">
		<div class="saveTableOne">
			<h3>초 대 장</h3>
			
			<!-- ok파일에서 필요 -->
			<input type="hidden" name="update_yn" id="update_yn" value="<%=btnValue_int%>"><!-- 수정모드인지 등록모드인지 파악하기 위함 -->
			<input type="hidden" name="i_nums" id="i_nums" value="<%=i_nums%>"><!-- 초대장의 기본키값 -->
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
						<input type="date" name="i_start" id="i_start" value="<%=w_start%>" class="saveWS100" min="<%= today %>"> ~ 
						<input type="date" name="i_end" id="i_end" value="<%=w_end%>" class="saveWS100" min="<%= today %>">
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
						<select name="ai_num" id="ai_num" class="saveWS250" onchange="animalChange(this.value);">
							<option value="">동물이름을 선택해주세요.</option>
							<%=animalName%>
						</select>
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
						<div id="data_ani_nature">
							**동물이름을 선택해주세요.
						</div>
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
					<td>
						<textarea class="saveWS100p saveHS100" id="data_ani_caut" disabled>**동물이름을 선택해주세요.</textarea>
					</td>
				</tr>
				<tr>
					<th>추가내용</th>
					<td>
						<textarea class="saveWS100p saveHS100" placeholder="추가할 내용을 적어주세요." name="i_content" id="i_content"><%=w_content%></textarea>
					</td>
				</tr>
			</table>
			<input type="submit" name="" id="" value="<%=btnValue %>" class="saveBtnOne">
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
	 
<script>
	//0.1초 뒤에 select box 선택된 동물이름 기준으로 데이터 뿌려주기
	setTimeout(function() {
	    var aiNum = "<%= ai_num %>";
	    if (aiNum) {
	    	animalChange(aiNum);
	    }
	}, 100); // 100ms 대기
	
	
	/*
	function updateModeAnimalInfo(){

        var update_ai_num = document.getElementById('update_ai_num').value;
        alert(update_ai_num);

		animalChange(update_ai_num);
	}
	*/
</script>
	
<%@ include file="../Footer.jsp" %>

</body>
</html>