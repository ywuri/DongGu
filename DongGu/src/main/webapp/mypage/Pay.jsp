<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ page import="com.DongGu.mypage.MyPageDAO" %>    
<%@ page import="com.DongGu.mypage.MyPageDTO" %>  
<jsp:useBean id="dao" class="com.DongGu.mypage.MyPageDAO"></jsp:useBean>
<%
   String m_sid = (String)session.getAttribute("sid");
   String m_sname = (String)session.getAttribute("sname");
   Integer m_usertype = (Integer)session.getAttribute("usertype"); 
   String i_num = request.getParameter("i_num");
   
   MyPageDTO dto = dao.mypage_o_pay(i_num); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/myweb/CSS_yelim/join.css">
<link rel="stylesheet" type="text/css" href="/myweb/CSS_yelim/mainlayout.css">
<title>Insert title here</title>
<style>

	@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://fastly.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
   }
   
   @font-face {
    font-family: 'Cafe24Meongi-B-v1.0';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2405-3@1.1/Cafe24Meongi-B-v1.0.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
	}
	
	@font-face {
    font-family: 'ONE-Mobile-POP';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-POP.woff') format('woff');
    font-weight: normal;
    font-style: normal;
	}	
	
	
	@font-face {
	    font-family: 'TTLaundryGothicB';
	    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/2403-2@1.0/TTLaundryGothicB.woff2') format('woff2');
	    font-weight: 700;
	    font-style: normal;
	}

	html {
		background: #fffae5;
		height: 450px;
	    margin: 0; 
	    padding: 0; 
	}
	
	header {
		margin: 0 auto;
		text-align: center; 
	}

    body {
        margin-top: 10%;
        padding: 20px;
        font-size: 18px;  
       	height:100%;
        text-align: center;
    }
    
    .jyl_login_logo{
		width: 330px;	
	}
	
	.jyl_login_div{
		margin-bottom: 50px;
	}
    
    ul {
        list-style-type: none;
        padding: 0;
        width: 100%;
    }

    ul li {
	    display: flex;
	    align-items: center; 
	    justify-content: center; 
        font-family:'ONE-Mobile-POP', sans-serif;
        
        margin: 10px 0;
    }
    
    ul li i {
    	text-align:left;
   		font-family: 'ONE-Mobile-POP', sans-serif;  
   		font-size: 25px;
	    display: inline-block; 
	    width: 110px; 
	    color: #333333c4;
    }
    
  

	#jyl_space {
        margin-bottom: 30px; 
    }
    
    label {
    	font-family: 'TTLaundryGothicB', sans-serif;
        font-size: 13px;
     }
     
    ul li input[type="text"]{
	    width: 100%; 
	    max-width: 250px;
	    height:43px;
	    flex-grow: 1;
	    font-family: 'ONE-Mobile-POP', sans-serif;
	    font-size: 15px;
	    padding: 7px;
	    border: 2px solid #c0c0c0; 
	    border-radius:10px;
	    box-sizing: border-box; 
	}
	
	 ul li input[type="password"]{
	    width: 100%; 
	    max-width: 250px;
	    height:43px;
	    flex-grow: 1;
	    font-size: 15px;
	    padding: 7px;
	    border: 2px solid #c0c0c0; 
	    border-radius:10px;
	    box-sizing: border-box; 
	}

	ul li input[type="text"]:focus, 
    ul li input[type="password"]:focus{
	    border: 2px solid #fedc56; 
	    outline: none; 
	}
	
	ul li input[type="text"]::placeholder,
	ul li input[type="password"]::placeholder {
	 	font-family: 'ONE-Mobile-POP', sans-serif;
	    color: #a0a0a0; /* 더 연한 색상으로 설정 */
	    opacity: 1; /* 기본 opacity로 설정 (브라우저에 따라 기본값이 다를 수 있음) */
	}

.btn {
	width:350px;
	height: 46px;
    font-family: 'TTLaundryGothicB', sans-serif;
    padding: 10px 20px;
    border-radius: 5px;
    background-color: #fedc56;
    color: #fff;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin: 5px;
	}

	.btn:hover {
    background-color: #e0a030;
	}

	.jyl_link{
		font-family: 'ONE-Mobile-POP', sans-serif;
	    text-decoration: none;
	    color: #33333391;
	    font-size: 13px;
	    font-weight: 400;
	}
	
	.jyl_link:hover{
	    color: #e0a030;  
	}
</style>
<script>
        function submitPayment() {
            // 부모 창에 버튼 제거를 알리는 함수 호출
            if (window.opener && !window.opener.closed) {
                window.opener.removePaymentButton();
            }
            // 팝업창을 닫음
            window.close();
        }
    </script>
</head>

<body>
	<header>
		<div class="jyl_login_div"><a href="Index.jsp"><img  class="jyl_login_logo" src="../img/logo.png" alt="logo"></a></div>
	</header>
	 <form name="login" action="login_ok.jsp" method="post" onsubmit="return validateForm()">      
        <ul>
        <li>
        <i>예금주</i><input type="text" name="username" readonly="readonly" value="<%= dto.getP_name() %>">
        </li>
        <li>
        <i>계좌명</i><input type="text" name="userbank" readonly="readonly" value="<%= dto.getP_bank_name() %>">
        </li>
        <li id="jyl_space">
        <i>계좌번호</i><input type="text" name="userbanknum" readonly="readonly" value="<%= dto.getP_bank_num() %>">
        </li>         
        <li>             
        <input type="submit" value="입금하기" class="btn" onclick="submitPayment();">       
        </li>       
        </ul>
    </form>
</body>
</html>