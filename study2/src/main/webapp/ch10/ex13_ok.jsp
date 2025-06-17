<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
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
	<p>나이: <%= age %></p>

</body>
</html>