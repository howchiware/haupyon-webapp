<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// 포워딩된 페이지는 request, response 객체가 그대로 전달되므로 클라이언트가 보낸 파라미터를 받을 수 있다
	String name = request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	
	// 포워딩 페이지에서 전달한 값 받기
	String s = (String)request.getAttribute("state"); // Object request.getAttribute(string) // 다운캐스팅해서 받기. Object였으니깐..
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>결과</h3>
	
	<p>이름: <%= name %></p>
	<p>나이: <%= age %>, <%= s %></p>

</body>
</html>