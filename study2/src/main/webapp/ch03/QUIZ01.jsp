<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	
	
	<table style="border-style: none; margin: 30px auto;">
		<% for(int i = 0; i <= 10; i++ ) { %>
				<tr style="width: 30; height: 30; ">
					
				
				
				<% for(int j = 0; j <= 15; j++) { %>
				
					<% if( i <= 0) { %>
						<td><%= j %></td>
					<% } else { %> 
						<td><input type="checkbox"></td>
					<% } %>
					
					
				<% } %>
				
				
				</tr>
		
		<% } %>
		
	</table>




</body>
</html>


