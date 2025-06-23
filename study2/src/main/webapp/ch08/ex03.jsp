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

	<h3>세션 동작 원리</h3>
	
	<!-- isNew(): 클라이언트가 최초 접속한 경우 true 를 반환 -->
	<!-- isNew()가 true 이면 클라이언트 정보가 서버에 저장되지 않은 상태 -->
	<!-- 이 경우 서버는 response header에 JSESSIONID 라는 이름으로 쿠키 정보를 client에 전달 -->
	<p> isNew(): <%= session.isNew() %> </p>
	
	<hr>
	
	
	<h3>쿠키 정보</h3>
	<%
		Cookie[] cc = request.getCookies();
		if(cc != null) {
			for(Cookie c : cc) {
				String name = c.getName();
				String value = c.getValue();
				out.print("<p>" + name + " : " + value + "</p>");
			}
		}
	%>
	
</body>
</html>