<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Calendar cal = Calendar.getInstance();

	String s = String.format("%tF %tT", cal, cal);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>첫번째 JSP</h3>
	
	<p>
		오늘 날짜 및 현재 시간은 <%=s %> 입니다.
	</p>
	
	

</body>
</html>