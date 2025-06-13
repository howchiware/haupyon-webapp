<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String [] cc = request.getParameterValues("chks");
	String s = "";
	
	if(cc != null) {
		for(String c:cc) {
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

<h3>좌석 예약</h3>

<p>예약한 좌석 : <%=s%></p>

</body>
</html>