<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>폼: disabled 속성의 객체는 서버로 전송되지 않음</h3>
	
	<form action="ex08_ok.jsp" method="post">
		<p>번호: <input type="text" name="num" value="1234" readonly>
		<p>이름: <input type="text" name="name">
		<p>나이: <input type="text" name="age" value="20" disabled>
		<p>
			<input type="hidden" name="id">
			<button type="submit">보내기</button>
		</p>
	</form>

</body>
</html>