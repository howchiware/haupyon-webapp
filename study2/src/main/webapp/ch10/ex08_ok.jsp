<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>forEach - Collection 객체 반복</h3>
	<c:forEach var="a" items="${list}">
		<p>${a }</p>
	</c:forEach>
	<hr>
	
	<c:forEach var="a" items="${subject.split(,)}">
		<p>${a }</p>
	</c:forEach>
	<hr>

</body>
</html>