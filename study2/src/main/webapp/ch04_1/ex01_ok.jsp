<%@page import="java.net.URLDecoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// request: 클라이언트가 보낸 요청 정보를 담고 있는 내장 객체
	
	// 클라이언트가 보낸 파라미터 받기
	// GET 방식으로 넘어온 인코딩된 파라미터를 디코딩하지 않으면 WAS에 따라 한글이 깨질 수도 있다
	String name = request.getParameter("name"); // 해당 이름의 파라미터 받기: 리턴 타입 - String
	
	/*
		- "자%바" 를 URLEncoder.encode()로 인코딩해서 전송할 것을 URLDecoder.decode()로 디코딩하면, 에러가 발생한다
		- 이유 =>
		    String input = "hello%world"; // 잘못된 인코딩*% 뒤에 2자리 16진수가 아님)
		    URLDecoder.decode(input, "UTF-8"); // 예외발생
		  처럼 JSP에서 디코딩된 "자%바"를 다시 디코딩해서 생기는 문제이다
		- "%" 를 URLEncoder.encode()에서 인코딩하지 않아서 생기는 문제이다
	*/
	name = URLDecoder.decode(name, "utf-8");
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

	<h3>넘어온 파라미터</h3>
	
	<p>이름: <%= name %></p>
	<p>나이: <%= age %>, <%= state %></p>

</body>
</html>