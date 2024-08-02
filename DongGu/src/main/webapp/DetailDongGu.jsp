<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">

<style>

        #DetailDongGuContainer {
            width: 80%;
            margin: 20px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top:190px;
        }
        h1 {
            text-align: center;
        }
        .image {
            text-align: center;
            margin-bottom: 20px;
        }
        .image img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
        }
        .details {
            margin-bottom: 20px;
        }
        .details p {
            margin: 8px 0;
        }
        .details label {
            font-weight: bold;
        }
        .address {
            border-top: 1px solid #ddd;
            padding-top: 10px;
            margin-top: 10px;
        }
    </style>

</head>
<body>
<%@include file="Header.jsp" %>



    <div id="DetailDongGuContainer">
        <h1>초대장</h1>
        <div class="image">
            <img src="이미지URL" alt="동물 이미지">
        </div>
        <div class="details">
            <p><label>초대제목:</label> 초대장 제목</p>
            <p><label>시작날짜-끝날짜:</label> 시작날짜 - 끝날짜</p>
            <p><label>동물 품종:</label> 동물 품종</p>
            <p><label>이름:</label> 동물 이름</p>
            <p><label>생년월일:</label> 생년월일</p>
            <p><label>성격:</label> 성격</p>
            <p><label>알레르기:</label> 알레르기 정보</p>
            <p><label>병력사항:</label> 병력사항</p>
            <p><label>주의사항:</label> 주의사항</p>
        </div>
        <div class="address">
            <p><label>주소:</label> 주소</p>
            <p><label>자택종류:</label> 자택종류</p>
        </div>
        <p><label>초대자이름/닉네임:</label> 초대자 이름/닉네임</p>
    </div>



<%@include file="Footer.jsp" %>

</body>
</html>