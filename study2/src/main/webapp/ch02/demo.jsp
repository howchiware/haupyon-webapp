<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>서블릿 예제 - 파라미터 전송</h3>
	
	<p>
		<a href="/study2/demo?name=김자바&age=19">확인</a>
	</p>
	<hr>
	
	<form action="/study2/demo" method="post">
		<p>이름: <input type="text" name="name"></p>
		<p>나이: <input type="text" name="age"></p>
		<p>
			<button type="submit">보내기</button>
		</p>
	</form>

</body>
</html>