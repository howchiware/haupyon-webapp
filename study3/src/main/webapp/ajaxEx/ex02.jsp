<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>AJAX - GET</h3>

	<form name="myForm">
		<input type="text" name="num1" id="num1">
		<select name="oper" id="oper">
			<option value="+">더하기</option>
			<option value="-">빼기</option>
			<option value="*">곱하기</option>
			<option value="/">나누기</option>
		</select>
		<input type="text" name="num2" id="num2">
		<button type="button" onclick="sendOk()">결과</button>
	</form>
	<hr>
	<div id="resultLayout"></div>
	
	<script type="text/javascript">
	
		// AJAX 객체 생성
		function createXMLHttpRequest() {
			let req = null;
			
			try {
				req = new XMLHttpRequest();
			} catch (e) {
			}
			
			return req;
		}
	
	
		function sendOk() {
			let n1 = document.querySelector('#num1').value;
			let n2 = document.querySelector('#num2').value;
			let op = document.querySelector('#oper').value;
			op = encodeURIComponent(op);
			
			let params = 'num1=' + n1 + '&num2=' + n2 + '&oper=' + op;
			
			let url = 'ex02_ok.jsp?' + params;			
			
			// AJAX 객체 생성
			httpReq = createXMLHttpRequest();
			
			// 서버에서 요청을 처리하고 전송한 결과를 받을 자바스크립트 함수 지정
			httpReq.onreadystatechange = callback;
			
			// open - AJAX 요청의 형식을 설정
			httpReq.open('GET', url, true);
			
			// send
			httpReq.send(null);
			
		}
		
		function callback() {
			if(httpReq.readyState === 4) { // 요청상태 - 4: 모든 요청 응답 완료
				if(httpReq.status === 200) { // 서버에서 받은 상태코드 - 200: 성공
					printData();
				}
			}
		}
		
		function printData() {
			// 서버에서 전송받은 text
			let result = httpReq.responseText;
			
			const divEL = document.getElementById('resultLayout');
			divEL.innerHTML = result;
		}
		
	</script>

</body>
</html>