<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<% 
	request.setCharacterEncoding("utf-8");

	String subject = request.getParameter("subject");
	String selectFile = request.getParameter("selectFile");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>요청 받은 정보</h3>
	
	<p> subject: <%= subject %> </p>
	<p> selectFile: <%= selectFile %> </p>


</body>
</html>