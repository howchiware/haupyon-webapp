<%@ page contentType="text/html; charset=UTF-8"%>

<%
	int n = 0;

	int row = 10;
	int col = 12;
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
	
	<table border="1" style="margin: 30px auto; width: <%=col * 70%>px; border-collapse: collapse;"> 	
		<% for(int i = 1; i <= row; i++ ) { %>
			<tr height="30" align="center">
		 		<% for(int j = 1; j <= col; j++) { %>
					<td><%= ++n %></td>
				<% } %>
			</tr>
		<% } %>
	</table>

</body>
</html>