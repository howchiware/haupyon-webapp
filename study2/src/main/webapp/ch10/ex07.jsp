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

	<h3>구구단</h3>
	
	<c:forEach var="i" begin="2" end="9">
		<p>${ i }단</p>
		<c:forEach var="j" begin="1" end="9">
			${ i } * ${ j } = ${ i * j }<br>
		</c:forEach>
		<br>
	</c:forEach>

</body>
</html>