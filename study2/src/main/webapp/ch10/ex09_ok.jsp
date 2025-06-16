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

	<h2>forEach: Collection 객체 반복</h2>
	
	<h3>forEach와 EL을 이용한 출력</h3>
	
	<c:forEach var="vo" items="${list }">
		<p>${vo.name } | ${vo.age } | ${vo.tel } | ${vo.subject }</p>
	</c:forEach>
	<hr>
	
	<h3>반복상태 확인: varStatus 속성</h3>
	<!-- index: 0부터 시작. count: 1부터 시작. first: 처음여부, last: 마지막여부 -->
	<c:forEach var="vo" items="${list }" varStatus="status">
		<p>
			${vo.name } | ${vo.age } | ${vo.tel } | ${vo.subject } | 
			${status.index } | ${status.count } | ${status.first } | ${status.last }
		</p>
	</c:forEach>
	

</body>
</html>