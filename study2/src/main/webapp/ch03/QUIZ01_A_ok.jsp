<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	// disabled 속성은 서버로 넘어가지 않는다.
	// readonly는 넘어간다
	String[] cc = request.getParameterValues("chks");
	
	String c = "";
	
	if(cc != null) {
		for(String a : cc) {
			c += a + " ";
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

	<h3>선택 좌석</h3>
	
	<p><%= c%></p>

</body>
</html>