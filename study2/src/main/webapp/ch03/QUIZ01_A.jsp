<%@ page contentType="text/html; charset=UTF-8"%>
<%
int rows = 10;
int cols = 15;

int width = cols * 30 + 20 * (cols / 5) + 30;
if (cols % 5 == 0)
	width -= 20;

String[] cc = { "B-3", "B-4", "E-6", "E-7", "H-2", "H-3" };
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<style type="text/css">
.container {
	margin: 30px auto;
	width: <%=width%>px;
}
</style>
</head>
<body>

	<div class="container">
		<div class="screen">스크린</div>
		
		<form name="myForm" method="post">
			<table class="table">
				<tr align="center" height="30">
				<%
					out.print("<td width='30'>&nbsp;</td>");
					for(int i = 1; i <= cols; i++) {
						if(i != 1 && i % 5 == 1) {
							out.print("<td width='20'>&nbsp;</td>");
						}
						out.print("<td width='30'>" + i + "</td>");
					}
				%>
				</tr>
				
				<%
					String s, p;
					for(int i=1; i <= rows; i++) {
						out.print("<tr align='center' height='30'>");
						
						out.print("<td>" + String.format("%c", 64 + i) + "</td>");
						
						for(int j = 1; j <= cols; j++) {
							if(j != 1 && j % 5 == 1) {
								out.print("<td bgcolor='e4e4e4'>&nbsp;</td>");
							}
							
							s = String.format("%c-%d", 64+i, j);
							p = "";

/* 							out.print("<td>");
							out.print("<input type='checkbox' name='chks' value='"+ s + "' " + p + ">");
							out.print("</td>"); 
*/							
							
							out.print("<td>");
							for(int k = 0; k <= cc.length -1; k++) {
								if(s.equals(cc[k])) {
									out.print("<input type='checkbox' checked='checked' name='chks' value='"+ s + "' " + p + ">");

								} else {
									out.print("<input type='checkbox' name='chks' value='"+ s + "' " + p + ">");

								}
							}	
							out.print("</td>");
							
						}
						out.print("</tr>");
					}
					
					out.print("<button type='button' onclick='check();'>좌석예약</button>");
				%>
				
				<%
					
					
					
				%>
				
			</table>
		</form>
	</div>	
	
	




</body>
</html>


