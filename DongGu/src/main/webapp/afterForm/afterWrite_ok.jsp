<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.time.*"%>
<%@ page import="java.time.format.*"%>
<jsp:useBean id="adto" class="com.DongGu.friend.AfterDTO"></jsp:useBean>
<jsp:setProperty property="*" name="adto"/>
<jsp:useBean id="adao" class="com.DongGu.friend.AfterDAO" scope="session"></jsp:useBean>
<%

	request.setCharacterEncoding("utf-8");	//post면 꼭 써야함
	/*
		목적: POST 요청의 문자 인코딩을 설정하는 코드입니다. 이는 폼 데이터가 UTF-8로 인코딩되어서 서버로 전송되도록 보장합니다.
		
		필요한 이유: POST 요청에서 문자 인코딩을 명시적으로 설정하지 않으면, 기본 인코딩이 사용될 수 있습니다. 
					이를 통해 데이터가 올바르게 처리되지 않을 수 있으므로, UTF-8로 인코딩을 명시하는 것이 중요합니다.
	*/
	
	// 업로드 최대 크기 설정 (10MB)
	int maxPostSize = 10 * 1024 * 1024;

	String uploadPath = request.getRealPath("/"); //이거 추가
	/*
		목적: 서버의 웹 애플리케이션 루트 디렉토리의 절대 경로를 얻습니다.
		
		필요한 이유: MultipartRequest가 파일을 저장할 디렉토리의 절대 경로를 필요로 합니다. 
		request.getRealPath("/")는 현재 웹 애플리케이션의 루트 디렉토리 경로를 반환하며, 
		이 경로에 img/webFolder/upload/를 추가하여 파일 저장 경로를 설정합니다. > savepath로 설정해놓음(내가)
	*/
	
	// 설정 경로
	String savepath = uploadPath + "img/after/";
	MultipartRequest mr = new MultipartRequest(request, savepath, maxPostSize, "utf-8");

	//MultipartRequest이게있으면 request대신에 MultipartRequest 변수명(mr)로 써야함
	
    adto.setR_write_id(mr.getParameter("r_write_id"));
    
    String r_id_check = mr.getParameter("r_id_check");
    int param_r_idc = Integer.parseInt(r_id_check);
    
    adto.setR_id_check(param_r_idc);
    
    String r_star = mr.getParameter("r_star");
    int param_r_star = Integer.parseInt(r_star);
    adto.setR_star(param_r_star);
    
    adto.setR_content(mr.getParameter("r_content"));
    
    // 업로드된 파일 객체 가져오기
    File uploadedFile = mr.getFile("r_img");
    //adto.setR_img(uploadedFile); // 파일 필드 설정
    
    String msg = "";
    String originalFileName = mr.getOriginalFileName("r_img"); // 원본 파일 이름

    if (uploadedFile != null && originalFileName != null) {
    	
    	// 파일 확장자
        String fileExtension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1).toLowerCase();
        //lastIndexOf(".") > originalFileName의 마지막 .이 있는 위치 반환
        //lastIndexOf(".") + 1 > originalFileName의 마지막 .이 있는 위치에서 +1을 더한 값 반환
        //substring(숫자값) > 숫자값부터 맨 마지막까지의 문자열 반환
        //toLowerCase > 해당 문자를 모두 소문자로 변환
        
        if (!fileExtension.matches("jpg|jpeg|png|gif")) {
            msg = "이미지 파일만 업로드할 수 있습니다. 다시 시도해 주세요.";
            uploadedFile.delete();	//업로드 되어있는 파일 삭제
            %>
            <script>
                window.alert('<%=msg%>');
                history.back(); // 이전 페이지로 돌아가기
            </script>
            <%
        } else {
            // 파일명 변경

            // 현재 날짜와 시간
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
            String formattedDateTime = now.format(formatter);
            
            //변경할 이름 먼저 만들고
            File newFile = new File(savepath + formattedDateTime +"_"+ mr.getParameter("r_id")+"."+fileExtension);
            
            //받은 uploadedFile을 / 변경할 이름(만들어 놓은걸로)으로 변경
            uploadedFile.renameTo(newFile);
            
            //확장자를 붙인 파일명 변수로 만듦
            String newFileName = formattedDateTime +"_"+ mr.getParameter("r_id")+"."+fileExtension;
            
    		adto.setR_img(newFile); //변경한 파일명으로 파일 넘김
    		adto.setR_img_name(newFileName); //변경한 파일명 넘김

            int result = adao.AfterWrite(adto);

            msg = result > 0 ? "후기가 등록되었습니다!" : "후기가 등록되지 않았습니다. 관리자에게 문의하세요.";
            %>
            <script>
                window.alert('<%=msg%>');
                location.href='/DongGu/afterForm/AfterList.jsp'; 

            </script>
            <%
        }
    } else {
        msg = "파일이 업로드되지 않았습니다. 다시 시도해 주세요.";
        %>
        <script>
            window.alert('<%=msg%>');
            history.back(); // 이전 페이지로 돌아가기
        </script>
        <%
    }
%>