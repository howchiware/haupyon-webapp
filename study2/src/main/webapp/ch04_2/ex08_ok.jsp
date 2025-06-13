<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String num = request.getParameter("num");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String id = request.getParameter("id");
	String city = request.getParameter("city");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>전달받은 파라미터</h3>
	
	<p>num: <%= num %></p> <!-- readonly 속성의 input 객체의 파라미터는 값이 넘어온다 -->
	<p>name: <%= name %></p>
	<p>age: <%= age %></p> <!-- null: disabled 속성의 input 객체의 파라미터는 값이 넘어오지 않는다 -->
	<p>id: <%= id %></p> <!-- "": 값을 입력하지 않은 input 객체의 파라미터 -->
	<p>city: <%= city %></p> <!-- null: 파라미터에 이름이 존재하지 않는 경우 -->

</body>
</html>