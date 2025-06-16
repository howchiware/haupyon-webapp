<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>exception 내장객체: jsp 에서 발생한 예외를 처리할 페이지를 지정한 경우 에러 페이지에 전달되는 예외 객체</h3>
	
	<p>
		<!-- name 파라미터가 없으면 예외가 발생됨 -->
		이름: <%= request.getParameter("name").toUpperCase() %>
	</p>
	
	

</body>
</html>