<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%
	// session에 저장된 정보 가져오기
	String name = (String) session.getAttribute("name");
	Integer age = null;
	age = (Integer) session.getAttribute("age");
	
	// 세션 유지 시간
	int interval = session.getMaxInactiveInterval();
	
	// 세션 아이디
	String id = session.getId();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	// 세션 생성 시간
	Date date = new Date(session.getCreationTime());
	String create_date = sdf.format(date);
	
	// 세션 마지막 접속 시간
	Date date2 = new Date(session.getLastAccessedTime());
	String last_date = sdf.format(date2);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3> 세션 정보</h3>
	
	<p> name: <%= name %> </p> <!-- 존재하지 않으면 null -->
	<p> age: <%= age %> </p>
	<p>EL로 세션 정보 출력: ${sessionScope.name}, ${sessionScope.age}</p>
	<p> 최대 유지시간: <%= interval %> </p>
	<p> 세션 아이디: <%= id %> </p>
	<p> 세션 생성 시간: <%= create_date %> </p>
	<p> 세션 마지막 접속 시간: <%= last_date %> </p>
	<hr>
	
	<p><a href="ex04.jsp">돌아가기</a></p>
	
</body>
</html>