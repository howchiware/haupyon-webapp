<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.NumberFormat"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	NumberFormat numf = NumberFormat.getCurrencyInstance();

	
	String name = request.getParameter("name");
	
	
	String birth = request.getParameter("birth");
	// 나이
	// LocalDate today = LocalDate.now();
	// Calendar now = Calendar.getInstance();
	
	// int age = (int)birthDate.until(today, ChronoUnit.YEARS);

	// 띠
	String[] tti = { "🐵원숭이🐒", "닭", "개", "돼지", "쥐", "소", "호랑이", "🐇토끼🐰", "용", "뱀", "말", "양" };

	
	String tel = request.getParameter("tel");
	
	int pay = 0;
	pay = Integer.parseInt(request.getParameter("pay"));
	String pPay = numf.format(pay);
	
	int bonus = 0;
	bonus = Integer.parseInt(request.getParameter("bonus"));
	String bBonus = numf.format(bonus);
	
	int tax = 0;
	if(pay+bonus >= 3000000 ) {
		 tax = (int)Math.floor((pay + bonus) * 0.03);
	} else if (pay+bonus >= 2000000 ) {
		 tax = (int)Math.floor((pay + bonus) * 0.02);
	} else {
		tax = 0;
	}
	String tTax = numf.format(tax);
	
	int realPay = pay + bonus - tax;
	String rRealPay = numf.format(realPay);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<style type="text/css">
.container .table {
	margin: 30px auto;
	border-collapse: collapse;
}

.container .table tr th {
	font-size: 15px;
	font-weight: 500;
}

.container .table tr td input {
	border: 1px solid black;
}

.container .table th,
.container .table td {
    border: 1px solid black;
    padding: 8px;
}
.container .button {
	margin: 30px auto;
}

.container .button .table-btn {
	border: 1px solid black;
	background-color: #fff;
}


</style>
</head>
<body>
	
	<div class="container">
	<table class="table">
		<tr>
			<th>이름</th>
			<td><%= name%></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><%= birth%></td>
		</tr>
		<tr>
			<th>띠</th>
			<td></td>
		</tr>
		<tr>
			<th>나이</th>
			<td></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%= tel%></td>
		</tr>
		<tr>
			<th>기본급</th>
			<td><%= pPay%></td>
		</tr>
		<tr>
			<th>수당</th>
			<td><%= bBonus%></td>
		</tr>
		<tr>
			<th>세금</th>
			<td><%= tTax%></td>
		</tr>
		<tr>
			<th>실급여</th>
			<td><%= rRealPay%></td>
		</tr>
	</table>
	</div>

</body>
</html>