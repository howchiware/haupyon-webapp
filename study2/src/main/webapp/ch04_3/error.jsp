<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isErrorPage="true" %> <!-- 에러 페이지임을 명시 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<p>요청처리 과정에서 예외가 발생했습니다.</p>
	<hr>
	
	<p>예외타입: <%= exception.getClass().getName() %></p>
	<p>에러 메시지: <%= exception.getMessage() %></p>
	
</body>
</html>