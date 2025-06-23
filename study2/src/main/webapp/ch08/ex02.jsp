<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<%
	Cookie ck = new Cookie("", "");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>쇼핑몰</h3>

	<table border="1" style="width: 400px; border-collapse: collapse;">
		<tr height="30" align="center" bgcolor="#eee">
			<td width="250">상품명</td>
			<td>가격</td>
		</tr>
		<tr height="30" align="center">
			<td>
				<a href="ex02_1.jsp">컴퓨터</a>
			</td>
			<td>1,000,000</td>
		</tr>
		<tr height="30" align="center">
			<td>
				<a href="ex02_2.jsp">핸드폰</a>
			</td>
			<td>1,500,000</td>
		</tr>
		<tr height="30" align="center">
			<td>
				<a href="ex02_3.jsp">노트북</a>
			</td>
			<td>2,000,000</td>
		</tr>
	</table>
	
	<h4>오늘본 상품 목록</h4>
	
	
	

</body>
</html>