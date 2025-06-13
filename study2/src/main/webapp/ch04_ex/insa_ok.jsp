<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.text.NumberFormat"%>
<%
	// 서블릿 6.0은 request characterEncoding 의 기본은 utf-8 이다.
	request.setCharacterEncoding("utf-8");

    // 1 (닭)  2(개)  3(돼지)  4(쥐)  5(소)  6(호랑이)  7(토끼 )  8(용)  9(뱀)  10(말)  11(양)  12(원숭이)
	String []tt = {"원숭이", "닭","개","돼지","쥐","소","호랑이","토끼","용","뱀","말","양"};

	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String phone = request.getParameter("phone");
	int salary = Integer.parseInt(request.getParameter("salary"));
	String sbonus = request.getParameter("bonus");
	int bonus = 0;
	if(sbonus.length() != 0) {
		bonus = Integer.parseInt(sbonus);
	}
	
	String strDate = birth.replaceAll("(\\.|\\/|\\-)", "");
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
	LocalDate birthDate = LocalDate.parse(strDate, formatter);	
			
	int y = Integer.parseInt(strDate.substring(0, 4));
	
	int idx = y % 12;
	String t = tt[idx];
	
	int total_pay = salary + bonus;
	int tax = 0;
	if(total_pay >= 3000000) {
		tax = (int)(total_pay * 0.03);
	} else if(total_pay >= 2000000) {
		tax = (int)(total_pay * 0.02);
	} 
	int pay = total_pay - tax;

	NumberFormat nf = NumberFormat.getCurrencyInstance();
	
	LocalDate today = LocalDate.now();
	int age = (int)birthDate.until(today, ChronoUnit.YEARS);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
* { padding: 0; margin: 0; }
*, *::after, *::before { box-sizing: border-box; }

body {
	font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
	font-size: 14px;
	color: #222;
}

a { color: #222; text-decoration: none; cursor: pointer; }
a:active, a:hover { color: #f28011; text-decoration: underline; }

/* form-control */
.btn {
	color: #333;
	border: 1px solid #999;
	background-color: #fff;
	padding: 5px 10px;
	border-radius: 4px;
	font-weight: 500;
	cursor:pointer;
	font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.btn:active, .btn:focus, .btn:hover {
	background-color: #f8f9fa;
	color:#333;
}
.btn[disabled], fieldset[disabled] .btn {
	pointer-events: none;
	cursor: default;
	opacity: .65;
}

.form-control {
	border: 1px solid #999; border-radius: 4px; background-color: #fff;
	padding: 5px 5px; 
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.form-control[readonly] { background-color:#f8f9fa; }

textarea.form-control { height: 170px; resize : none; }

.form-select {
	border: 1px solid #999; border-radius: 4px; background-color: #fff;
	padding: 4px 5px; 
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.form-select[readonly] { background-color:#f8f9fa; }

textarea:focus, input:focus { outline: none; }
input[type=checkbox], input[type=radio] { vertical-align: middle; }

/* table */
.table { width: 100%; border-spacing: 0; border-collapse: collapse; }
.table th, .table td { padding-top: 10px; padding-bottom: 10px; }

.table-border thead > tr { border-top: 2px solid #212529; border-bottom: 1px solid #ced4da; }
.table-border tbody > tr { border-bottom: 1px solid #ced4da; }
.table-border tfoot > tr { border-bottom: 1px solid #ced4da; }
.td-border td { border: 1px solid #ced4da; }

.container { width: 500px; margin:30px auto; }

.title { width:100%; font-size: 16px; font-weight: bold; padding: 13px 0; }

.table-article td {border: 1px solid #ced4da; }
.table-article tr > td:first-child {
	text-align: center; background: #f8f9fa; width: 100px; text-align: right; padding-right: 10px; }
.table-article tr > td:nth-child(2) { padding-left: 10px; }
</style>

</head>
<body>

<div class="container">
	<div class="title">
	    <h3><span>|</span> 인사관리</h3>
	</div>

	<table class="table table-article">
		<tr>
		   <td>이름</td>
		   <td><%=name%></td>
		</tr>
		<tr>
		   <td>생년월일</td>
		   <td><%=birth%></td>
		</tr>
		<tr>
		   <td>띠</td>
		   <td><%=t%></td>
		</tr>
		<tr>
		   <td>나이</td>
		   <td><%=age%></td>
		</tr>
		<tr>
		   <td>전화번호</td>
		   <td><%=phone%></td>
		</tr>
		<tr>
		   <td>기본급</td>
		   <td><%=nf.format(salary)%></td>
		</tr>
		<tr>
		   <td>수당</td>
		   <td><%=nf.format(bonus)%></td>
		</tr>
		<tr>
		   <td>세금</td>
		   <td><%=nf.format(tax)%></td>
		</tr>
		<tr>
		   <td>실급여</td>
		   <td><%=nf.format(pay)%></td>
		</tr>
	</table>
</div>

</body>
</html>