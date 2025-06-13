<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String [] cc = request.getParameterValues("nums");
	String s = "";
	
	if(cc != null) {
		for(String c : cc) {
			s += c + " ";
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>
	<p>삭제할 게시물 : <%=s%></p>
</body>
</html>