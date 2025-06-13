<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
* { margin: 0; border: 0; box-sizing: border-box; }

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
		
		<form name="insaForm" method="post">
			<table class="table">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="birth"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="tel"></td>
				</tr>
				<tr>
					<th>기본급</th>
					<td><input type="text" name="pay"></td>
				</tr>
				<tr>
					<th>수당</th>
					<td><input type="text" name="bonus"></td>
				</tr>
			</table>
			<table class="button">
				<tr>
					<td>
						<button type="button"  class="table-btn" onclick="sendOk();">등록하기</button>
					</td>
				</tr>
			</table>
		</form>
		
	</div>
	
	
	
	
	
	
	
	<script type="text/javascript">
		
		
		
		
		function sendOk() {
			const f = document.insaForm;
			let p;
			
			p = /(^[가-힣]{2,4}$)|(^[a-z]{2,10}\s[a-z]{2,10}$)/i;
			if(! p.test(f.name.value.trim())) {
				alert('⚠️이름을 입력하거나 올바른 형식으로 입력하세요.');
				f.name.focus();
				return;
			}
			
			if(! f.birth.value.trim()) {
				alert('⚠️생일을 선택하세요');
				f.birth.focus();
				return;
			}
			
			p = /^\d{3}-\d{3,4}-\d{4}$/;
			if(! p.test(f.tel.value.trim())) {
				alert('⚠️전화번호를 입력하거나 올바른 형식으로 입력하세요.');
				f.tel.focus();
				return;
			}
			
			p = /^\d{6,8}$/;
			if(! f.pay.value.trim()) {
				alert('⚠️기본급을 입력하세요(6-8 자리 숫자만 가능)');
				f.pay.focus();
				return;
			}
			
			p = /^\d{0,7}$/;
			if(! f.bonus.value.trim()) {
				alert('⚠️수당을 입력하세요(0~7 자리 숫자만 가능)');
				f.bonus.focus();
				return;
			}

			f.action = 'insa_ok.jsp';
			f.submit();
			
		}
		
		
		
	
	</script>

	

</body>
</html>

