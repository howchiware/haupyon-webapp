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

	<h2>EL 및 JSTL에서 Map 접근</h2>
	
	<h3>EL에서 Map 접근</h3>
	<p>${map.name } | ${map.age } | ${map.subject } |</p>
	<hr>
	
	
	<h3>JSTL에서 Map 접근</h3>
	<c:forEach var="entry" items="${map }">
		<p>${entry.key } : ${entry.value }</p>
	</c:forEach>
	<hr>
	
	
	<h3>JSTL에서 List의 Map 접근</h3>
	<c:forEach var="m" items="${list }">
		<p>${m.name } | ${m.city }</p>
	</c:forEach>
	

</body>
</html>