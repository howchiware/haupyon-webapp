<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String[] list = request.getParameterValues("userId");
	
	String l = "";
	
	if(list != null) {
		for(String s : list) {
			l += s + " ";
		}
	}
	
	String message = request.getParameter("msg");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>쪽지</h3>
	
	<p>친구 목록: <%= l%></p>
	
	<h3>메시지</h3>
	<p><%= message%></p> 


</body>
</html>