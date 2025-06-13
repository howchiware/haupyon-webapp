<%@ page contentType="text/html; charset=UTF-8"%>
<%
int rows = 10;
int cols = 15;

int width = cols * 30 + 20 * (cols / 5) + 30;
if (cols % 5 == 0)
	width -= 20;

String[] cc = {"B-3", "B-4", "E-6", "E-7", "H-2", "H-3"};
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="${pageContext.request.contextPath}/dist/css/style.css" type="text/css">
<style type="text/css">
.container {
	margin: 30px auto;
	width: <%=width%>px;
}

.screen {
	width: 100%;
	font-size: 15px;
	font-weight: 500;
	padding: 10px 0;
	text-align: center;
	background: #e4e4e4;
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
					for (int i = 1; i <= cols; i++) {
						if (i != 1 && i % 5 == 1) {
							out.print("<td width='20'>&nbsp;</td>");
						}
						out.print("<td width='30'>" + i + "</td>");
					}
					%>
				</tr>

				<%
				String s, p;
				for (int i = 1; i <= rows; i++) {
					out.print("<tr align='center' height='30'>");

					out.print("<td>" + String.format("%c", 64 + i) + "</td>");

					for (int j = 1; j <= cols; j++) {
						if (j != 1 && j % 5 == 1) {
							out.print("<td bgcolor='e4e4e4'>&nbsp;</td>");
						}

						s = String.format("%c-%d", 64 + i, j);
						p = "";

						for (int k = 0; k < cc.length; k++) {
							if (s.equals(cc[k])) {
								p = "checked disabled";
								break;
							}
						}

						out.print("<td>");
						out.print("<input type='checkbox' name='chks' value='" + s + "' " + p + ">");
						out.print("</td>");

					}
					out.print("</tr>");
				}
				%>


			</table>


			<table class="table">
				<tr align="right">
					<td>
						<button type="button" class="btn" onclick="sendOk();">좌석예약</button>
					</td>
				</tr>

			</table>
		</form>
	</div>

	<script type="text/javascript">
		function sendOk() {
			const f = document.myForm;
			
			const chkELS = document.querySelectorAll('form input[name=chks]:checked:not(:disabled)');
			
			if(chkELS.length < 1 || chkELS.length > 4) {
				alert('좌석은 1~4까지 예약 가능합니다.');
				return;
			}
			
			f.action = 'QUIZ01_A_ok.jsp';
			f.submit();
			
		}
	</script>





</body>
</html>


