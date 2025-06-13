<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	Enumeration<String> e = request.getParameterNames();
	
	String name = request.getParameter("name");
	String stdId = request.getParameter("stdId");
	String gender = request.getParameter("gender");
	String city = request.getParameter("city"); 
	String []ss = request.getParameterValues("subject"); 
	String subject = "";
	if(ss != null) {
		for(String s : ss) {
			subject += s + " ";
		}
	}
	String []hh = request.getParameterValues("hobby"); 
	String hobby = "";
	if(hh != null) {
		for(String h : hh) {
			hobby += h + " ";
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<p>이름: <%= name %></p>
	<p>학번: <%= stdId %></p>
	<p>성별: <%= gender %></p>
	<p>과목: <%= subject %></p>
	<p>지역: <%= city %></p>
	<p>취미: <%= hobby %></p>

</body>
</html>