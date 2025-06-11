<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>구구단</h3>
	
	<% for(int i = 2; i <= 9; i++) { %>
		<p>**<%= i %> 단 **</p>
		<% for(int j = 1; j <= 9; j++) { %>
			<p><%= i %> * <%= j %> = <%= i * j %></p>
		<% } %>
		<p> ---------------------- </p>
	<% } %>
	
	<%
		for(int i = 2; i <= 9; i++ ){
			out.print("<p>** " + i + "단 ** </p>");
			
			for(int j = 1; j <= 9; j++ ){
				out.print("<p>" + i + " * " + j + " = " + (i*j) + "</p>");
			}
			out.print("<p> ---------------------- </p>");
		}
	%>
	<hr>
</body>
</html>