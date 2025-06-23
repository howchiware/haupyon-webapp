<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%
	// 세션에 저장된 속성값 삭제
	session.removeAttribute("name");
	session.removeAttribute("age");
	
	// 세션에 저장된 모든 속성을 제거하고, 세션을 초기화
	session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>세션 정보 삭제</h3>
	
	<p><a href="ex04.jsp">돌아가기</a></p>

</body>
</html>