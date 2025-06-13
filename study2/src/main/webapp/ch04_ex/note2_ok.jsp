<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String [] receiver = request.getParameterValues("userId");
	String msg = request.getParameter("msg");
	
	String s = "";
	if(receiver != null) {
		for(String id : receiver) {
			s += id + " ";
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

<div>
	<p>받는사람 : <%=s%></p>
	<p>메시지 ...</p>
	<div style="white-space: pre;"><%=msg%></div>
</div>

</body>
</html>