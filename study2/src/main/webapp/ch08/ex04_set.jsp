<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%
	/*
       - session: 세션을 나타내는 JSP 내장객체(HttpSession)
       - 서블릿에서 세션 객체 구하기
         HttpSession session = request.getSession();
       - EL 에서의 session 객체
         sessionScope
	*/
	
	// 세션 유지시간 설정(톰캣 기본:  30분)
	session.setMaxInactiveInterval(60 * 20); // (단위: 초)
	
	// 세션에 정보 저장
	// setAttribute(String, Object)
	session.setAttribute("name", "홍길동");
	session.setAttribute("age", 20);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>세션에 정보 저장</h3>
	
	<p><a href="ex04.jsp">돌아가기</a></p>

</body>
</html>