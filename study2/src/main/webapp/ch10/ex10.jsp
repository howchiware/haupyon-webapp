<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%
	Map<String, Object> map1 = new HashMap<>();
	map1.put("name", "이자바");
	map1.put("age", 20);
	map1.put("subject", "Servlet");
	
	Map<String, Object> map2;
	List<Map<String, Object>> listMap = new ArrayList<>();
	
	map2 = new HashMap<>();
	map2.put("name", "홍두깨");
	map2.put("city", "서울");
	listMap.add(map2);
	
	map2 = new HashMap<>();
	map2.put("name", "봉미선");
	map2.put("city", "떡잎마을");
	listMap.add(map2);
	
	map2 = new HashMap<>();
	map2.put("name", "피카츄");
	map2.put("city", "태초마을");
	listMap.add(map2);
	
	request.setAttribute("map", map1);
	request.setAttribute("list", listMap);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<jsp:forward page="ex10_ok.jsp" />

</body>
</html>