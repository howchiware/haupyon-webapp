<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>파라미터 전송</h3>
	
	<div>
		<p>GET 방식 전송</p>
		<p>
			<a href="ex01_ok.jsp?name=kim&subject=java&score=85">확인</a> |
			<button type="button" onclick="location.href='ex01_ok.jsp?name=kim&subject=java&score=85';">확인</button>
		</p>
	</div>
	
	<hr>
	
	<div>
		<p>POST 방식 전송</p>
		<form method="post" action="ex01_ok.jsp">
			<p>이름: <input type="text" name="name"></p>
			<p>과목: <input type="text" name="subject"></p>
			<p>점수: <input type="text" name="score"></p>
			<p>
				<button type="submit">확인</button>
			</p>
		</form>
	</div>

</body>
</html>