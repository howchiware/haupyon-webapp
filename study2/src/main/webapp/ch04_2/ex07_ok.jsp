<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int n1 = Integer.parseInt(request.getParameter("num1"));
	int n2 = Integer.parseInt(request.getParameter("num2"));
	String oper = request.getParameter("operator");
	
	String s = "";
	
	switch(oper) {
	case "+": s = String.format("%d + %d = %d", n1, n2, (n1+n2)); break;
	case "-": s = String.format("%d - %d = %d", n1, n2, (n1-n2)); break;
	case "*": s = String.format("%d * %d = %d", n1, n2, (n1*n2)); break;
	case "/": s = String.format("%d / %d = %d", n1, n2, (n1/n2)); break;
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
	

	<h3>결과</h3>
	<p><%= s %></p>
	

</body>
</html>