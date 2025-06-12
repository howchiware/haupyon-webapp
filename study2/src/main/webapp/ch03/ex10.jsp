<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="error.jsp" %>

<%
	String s = "a";
	int n = Integer.parseInt(s);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>page 지시어(directive)</h3>
	<!-- page errorPage: 에러 페이지를 설정할 수 있다 -->
	<hr>
	
	<p><%= n %></p>

</body>
</html>