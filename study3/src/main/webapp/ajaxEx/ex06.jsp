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

	<h3>AJAX - POST : JSON</h3>

	<form name="myForm">
		<p>이름: <input type="text" name="name" id="name"></p>
		<p>내용: <textarea rows="3" cols="60" name="content" id="content"></textarea></p>
		<p>
			<button type="button" onclick="sendOk();">등록하기</button>
		</p>
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
			let name = document.querySelector('#name').value;
			let content = document.querySelector('#content').value;
			content = encodeURIComponent(content); // '자&바'와 같이 &을 사용했을 때 단어가 짤리는 현상 방지
			
			let params = 'name=' + name + '&content=' + content;
			
			let url = 'ex06_ok.jsp';			
			
			// AJAX 객체 생성
			httpReq = createXMLHttpRequest();
			
			// 서버에서 요청을 처리하고 전송한 결과를 받을 자바스크립트 함수 지정
			httpReq.onreadystatechange = callback;
			httpReq.responseType = 'json';
			
			// open - AJAX 요청의 형식을 설정
			httpReq.open('POST', url, true); // true: 비동기 통신
			
			// Content-Type 명시: POST에서는 필수
			httpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			
			// send
			httpReq.send(params); // send(내용)
			
		}
		
		
		function callback() {
			if(httpReq.readyState === 4) { // 요청상태 - 4: 모든 요청 응답 완료
				if(httpReq.status === 200) { // 서버에서 받은 상태코드 - 200: 성공
					printXML();
				}
			}
		}
		
		function printXML() {
			
			// let result = httpReq.responseText;
			// httpReq.responseType = 'json'; 으로 설정한 경우에는 responseTest로 받을 수 없다
			
			let job = httpReq.response; // 객체
			console.log(job);
			
			let out = `<p>데이터 개수: \${job.dataCount}</p>`;
			for(let item of job.list) {
				let num = item.num;
				let name = item.name;
				let content = item.content;
				
				out += `<p>번호: \${num}<br>이름:\${name}<br>내용: \${content}</p><hr>`;
			
			}
			
			document.getElementById('resultLayout').innerHTML = out;
			
			/* 이 방식은 나중에....
			let result = httpReq.response;
			console.log(typeof result);
			*/
		}
		
	</script>

</body>
</html>