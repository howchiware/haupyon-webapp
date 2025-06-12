<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>form 데이터 전송 - 일반 버튼</h3>
	
	<pre>
		- form 태그 안의 내용을 일반 버튼 등을 이용하여 전송
		  form 태그 객체의 submit() 함수를 호출한다
		- submit() 함수를 호출하면 submit 이벤트는 발생하지 않는다
	</pre>

	 <hr>
	
	<form name="myForm" method="post">
		<p>이름 : <input type="text" name="name"> </p>
		<p>나이 : <input type="text" name="age"> </p>
		<p>
			<button type="button" onclick="sendOk();">보내기</button>
		</p>
	</form>
	
	<script type="text/javascript">
		function sendOk() {
			const f = document.myForm;
			
			if(! f.name.value.trim()) {
				f.name.focus();
				return;
			}
			
			if(! /^\d{1,3}$/.test(f.age.value)) {
				f.age.focus();
				return;
			}
			
			f.action = 'ex05_ok.jsp'; // 서버 주소 // form에서 action 줬는데 여기서도 action 주면 아래에 있는 action이 먹힌다
			f.submit(); // 일반 버튼, SELECT 등에서 form 태그의 내용을 서버로 전송
			
		}
	</script>	

</body>
</html>