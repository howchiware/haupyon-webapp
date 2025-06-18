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

	<h3>예제 프로그램</h3>
	
	<p>
		<a href="${pageContext.request.contextPath}/score/list.do">성적 처리</a>
	</p>

	<p>
		<a href="${pageContext.request.contextPath}/bbs/list.do">게시판</a>
	</p>

</body>
</html>