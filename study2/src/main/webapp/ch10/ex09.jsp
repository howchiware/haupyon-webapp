<%@page import="java.util.ArrayList"%>
<%@page import="ch10.user.User"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%
	request.setCharacterEncoding("utf-8");

	List<User> list = new ArrayList<>();
	
	list.add(new User("김자바", 20, "010-1111-1111", "자바"));
	list.add(new User("홍두깨", 21, "010-2222-2353", "HTML"));
	list.add(new User("리피아", 55, "010-3333-5455", "CSS"));
	list.add(new User("송가인", 42, "010-4444-8528", "자바스크립트"));
	list.add(new User("신형만", 13, "010-5555-2554", "서블릿"));
	
	request.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<jsp:forward page="ex09_ok.jsp" />
	
	
</body>
</html>