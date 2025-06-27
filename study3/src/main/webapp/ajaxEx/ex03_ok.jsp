<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%

	request.getParameter("utf-8");
	
	int n1 = Integer.parseInt(request.getParameter("num1"));
	int n2 = Integer.parseInt(request.getParameter("num2"));
	String oper = request.getParameter("oper");
	
	String s = "";
	
	switch(oper) {
	case "+" : s = String.format("%d + %d = %d", n1, n2, n1+n2); break;
	case "-" : s = String.format("%d - %d = %d", n1, n2, n1-n2); break;
	case "*" : s = String.format("%d * %d = %d", n1, n2, n1*n2); break;
	case "/" : s = String.format("%d / %d = %d", n1, n2, n1/n2); break;
	}

%>

	<p><%= s %></p>

</body>
</html>