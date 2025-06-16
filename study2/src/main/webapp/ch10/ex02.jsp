<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h2>EL 내장객체</h2>
	
	<p>pageContext: 현재 페이지의 설정 정보</p>
	<p>ContextPath: <%= request.getContextPath() %></p>
	<p>ContextPath: ${ pageContext.request.contextPath }</p>
	<hr>
	
	<p>header: 요청 헤더의 정보</p>
	<p>User-Agent: ${ header["user-agent"] }</p>
	

</body>
</html>