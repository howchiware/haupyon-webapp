
<!-- page의 contentType 속성: 클라이언트 전송하는 문서 타입. 기본 인코딩은 ISO-8859_1 -->
<%@ page contentType="text/html; charset=UTF-8"%>

<!-- page의 import 속성: 필요한 자바 클래스를 import -->
<%@page import="java.util.Arrays"%>
<%
	String []ss = new String[]{"java", "spring", "html", "css", "oracle"};
	Arrays.sort(ss);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>page 지시어</h3>
	<p>
		page 지시어: JSP 페이지의 설정 정보를 지정
	</p>
	
	<div>
		<% for(String s : ss) { %>
			<p> <%= s %> </p>
		<% } %>
	</div>

	

</body>
</html>