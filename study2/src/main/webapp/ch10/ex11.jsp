<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%
	String s = "<p style='color:red;'>자바</p>";
	
	pageContext.setAttribute("msg", s);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h2>c:out 태그 - 표현식의 결과를 화면에 출력 </h2>
	
	<h3>EL을 이용하여 출력(글자색: red)</h3>
	<p>${msg }</p>
	<hr>
	
	
	<h3>JSTL 출력-1</h3>
	<!-- 기본으로 escapeXml이 true 이므로 태그 문자가 그대로 표시된다 -->
	<p><c:out value="${msg }" /></p>
	
	<h3>JSTL 출력-2(글자색:red)</h3>
	<p><c:out value="${msg }" escapeXml="false"/></p>
	

</body>
</html>