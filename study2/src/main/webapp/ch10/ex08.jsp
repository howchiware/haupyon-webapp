<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%
	request.setCharacterEncoding("utf-8");

	List<String> list = new ArrayList<>();
	list.add("서울");
	list.add("인천");
	list.add("경기");
	
	request.setAttribute("list", list);
	request.setAttribute("subject", "자바,스프링,HTML,CSS,서블릿");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>forEach</h3>
	
	<jsp:forward page="ex08_ok.jsp" />

</body>
</html>