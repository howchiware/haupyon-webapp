<%@ page contentType="text/html; charset=UTF-8"%>

<%
	String method = request.getMethod();
	String scheme = request.getScheme();
	String cp = request.getContextPath();
	String uri = request.getRequestURI();
	StringBuffer url = request.getRequestURL();
	String qs = request.getQueryString();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
	<h3>request: path 정보</h3>
	
	<p>요청방식(method): <%= method %></p>
	<p>scheme: <%= scheme %></p>
	<p>ContextPath: <%= cp %></p> <!-- 한 사이트의 이름을 나타냄 -->
	<p>ContextPath: ${pageContext.request.contextPath}</p> <!-- 원래는 이런 형태의 표현식으로 사용해야 함. 암기해야 함 -->
	<p>요청경로(uri): <%= uri %></p> <!-- cp부터 끝까지 주소 -->
	<p>요청경로(url): <%= url %></p> <!-- 전체 주소 -->
	<p>QueryString: <%= qs %></p>

</body>
</html>