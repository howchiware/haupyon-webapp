<%@page import="ch10.user.User"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	User vo = new User("홍길동", 10, "010-1234-1234", null);
	
	request.setAttribute("dto", vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<jsp:forward page="ex03_ok.jsp">
		<jsp:param value="서울" name="city" />
	</jsp:forward>

</body>
</html>