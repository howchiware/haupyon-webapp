<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h2>c:forTokens 태그</h2>
	
	<!-- 제공된 구분자로 토큰을 반복 -->
	<c:forTokens var="color" items="Red,Blue,Green" delims=",">
		색상 이름: ${color} <br>
	</c:forTokens>

</body>
</html>