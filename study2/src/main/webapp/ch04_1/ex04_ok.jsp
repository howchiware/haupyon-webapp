<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// post 방식으로 넘어온 파라미터의 인코딩 설정
	// 서블릿 6.0부터는 기본 인코딩이 utf-8로 생략이 가능
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	String state = age >= 19 ? "성인" : "미성년자";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>post 방식의 파라미터 받기</h3>
	
	<p> 이름: <%= name%></p>
	<p> 나이: <%= age %>, <%= state %> </p>

</body>
</html>