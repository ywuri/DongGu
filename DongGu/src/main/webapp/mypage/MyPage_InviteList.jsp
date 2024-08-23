<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>    
<%@ page import="java.sql.Date" %>    
<%@ page import="com.DongGu.mypage.MyPageDAO" %>    
<%@ page import="com.DongGu.mypage.MyPageDTO" %>  
 <jsp:useBean id="dao" class="com.DongGu.mypage.MyPageDAO"></jsp:useBean>
    
<%
   String m_sid = (String)session.getAttribute("sid");
   String m_sname = (String)session.getAttribute("sname");
   String i_num = request.getParameter("i_num");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Home</title>
<link rel="stylesheet" type="text/css" href="/DongGu/css/DongGu.css">
<style>
   .jyl_graph{display: flex; margin-left:10px;}
   .jyl_bar-background {background-color: #e1e1e1; height: 18px; border-radius: 15px; overflow: hidden; position: relative; width: 90%;}   
   .jyl_bar-fill1 {background-color: #8290e3; height: 100%; transition: width 0.3s;}   
   .jyl_bar-fill2 {background-color: #8290e3; height: 100%; transition: width 0.3s;}
   .jyl_bar-fill3 {background-color: #fee37a; height: 100%; transition: width 0.3s;}
</style>
</head>

<body >
</body>
<h1>하이</h1>
</html>