<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>    

<%
	Cookie c1 = new Cookie("subject", null);
	c1.setMaxAge(0);
	response.addCookie(c1);
	
	Cookie c2 = new Cookie("subject2", null);
	c2.setMaxAge(0);
	response.addCookie(c2);
	
	Cookie c3 = new Cookie("subject3", null);
	c3.setMaxAge(0);
	response.addCookie(c3);
	
	Cookie c4 = new Cookie("tel", null);
	c4.setPath("/"); // 쿠키를 제거할 때 setPath()를 설정한 경우 제거할 때도 설정
	c4.setMaxAge(0);
	response.addCookie(c4);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3> 쿠키 제거 </h3>
	
	<p>
		<a href="ex01.jsp">돌아가기</a>
	</p>

</body>
</html>