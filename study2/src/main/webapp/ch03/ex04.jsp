<%@ page contentType="text/html; charset=UTF-8"%>

<%
	int n = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>스크립릿, 표현식</h3>
	
	<table border="1" style="margin: 30px auto; width: 300px; border-collapse: collapse;"> 	
		<% for(int i = 1; i <= 5; i++ ) { %>
			<tr height="30" align="center">
		 		<% for(int j = 1; j <= 6; j++) { %>
					<td><%= ++n %></td>
				<% } %>
			</tr>
		<% } %>
	</table>

</body>
</html>