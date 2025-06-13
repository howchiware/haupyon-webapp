<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<form name="frm" action="ex07_ok.jsp" method="post">
		<p>
			<input type="text" name="num1" placeholder="첫번째수">
			<input type="text" name="num2" placeholder="두번째수">
			<!-- hidden: 화면에 표시되지 않지만 서버에 전송할 데이터를 가진 form 요소 -->
			<input type="hidden" name="operator">
		</p>
		<p>
			<button type="button" onclick="send('+');">합</button>
			<button type="button" onclick="send('-');">차</button>
			<button type="button" onclick="send('*');">곱</button>
			<button type="button" onclick="send('/');">몫</button>
		</p>
	</form>
	
	<script type="text/javascript">
	
		function send(oper) {
			const f = document.frm;
			f.operator.value = oper;
			f.submit();
		}
	</script>

</body>
</html>