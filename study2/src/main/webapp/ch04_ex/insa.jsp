<%@ page contentType="text/html; charset=UTF-8"%>
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

/* container */
.container { width: 500px; margin:30px auto; }

.title { width:100%; font-size: 16px; font-weight: bold; padding: 13px 0; }

.table-form tr > td { border: 1px solid #ced4da; }
.table-form tr > td:first-child {
	text-align: center; background: #f8f9fa; width: 100px; text-align: right; padding-right: 10px; }
.table-form tr > td:nth-child(2) { 	padding-left: 10px; }
.table-form input[type=text], .table-form input[type=date], .table-form input[type=file], .table-form textarea { width: 96%; }

</style>

<script type="text/javascript">
function isValidDate(date) {
	if(date.length !== 8 && date.length !== 10) return false;
	
	let p = /(\.)|(\-)|(\/)/g;
	date = date.replace(p, "");
	
	let format = /^[12][0-9]{7}$/;
	if(! format.test(date) ) return false;
	
	let y = parseInt( date.substring(0,4) );
	let m = parseInt( date.substring(4,6) );
	let d = parseInt( date.substring(6) );
	
	if(m<1 || m>12) return false;
	
	let lastDay = (new Date(y,m,0)).getDate();
	if(d<1 || d>lastDay) return false;
	
	return true;
}

function isValidKorean(data){
	let p = /^[가-힣]+$/;
	
    return p.test(data);
}

function sendOk() {
	// const f = document.forms[0];
	const f = document.insaForm;
	
	let p;
	
	if(! isValidKorean(f.name.value)) {
		alert("이름을 입력 하세요.");
		f.name.focus();
		return;
	}
	
	if(! isValidDate(f.birth.value)) {
		alert("생년월일을 정확히 입력 하세요(yyyy-mm-dd).");
		f.birth.focus();
		return;
	}
	
	p = /^(010)-[0-9]{4}-[0-9]{4}$/;
	if(! p.test(f.phone.value)) {
		alert("전화번호를 정확히 입력 하세요.");
		f.phone.focus();
		return;
	}
	
	// p = /^(\d+)$/;
	p = /^\d{6,8}$/;
	if(! p.test(f.salary.value)) {
		alert("기본급여는 6~8자리의 숫자만 가능 합니다.");
		f.salary.focus();
		return;
	}
	
	p = /^\d{0,7}$/;
	if(! p.test(f.bonus.value)) {
		alert("수당은 0~7자리의 숫자만 가능 합니다.");
		f.bonus.focus();
		return;
	}
	
	f.submit();
}
</script>

</head>
<body>

<div class="container">
	<div class="title">
	    <h3><span>|</span> 인사관리</h3>
	</div>
	
	<form name="insaForm" action="insa_ok.jsp" method="post">
	<table class="table table-form">
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="name" class="form-control">
			</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>
				<input type="date" name="birth" class="form-control">
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<input type="text" name="phone" class="form-control">
			</td>
		</tr>
		<tr>
			<td>기본급</td>
			<td>
				<input type="text" name="salary" class="form-control">
			</td>
		</tr>
		<tr>
			<td>수당</td>
			<td>
				<input type="text" name="bonus" class="form-control">
			</td>
		</tr>
	</table>
	
	<table class="table">
		<tr align="center">
			<td>
				<button type="button" class="btn" onclick="sendOk();">등록하기</button>
				<button type="reset" class="btn">다시입력</button>
			</td>
		</tr>
	</table>
	</form>
</div>

</body>
</html>