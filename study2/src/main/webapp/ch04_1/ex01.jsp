
<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>파라미터 전송: GET</h3>
	<pre>
		- GET: 파라미터 기본 전송방식
		- Query String: GET 방식으로 전송되는 파라미터
		- 주소줄에 정보를 실어서 보낸다
		<%-- 형식: 주소?이름1=값1&이름2=값2 --%>
		- GET 방식으로 파라미터를 전송할 때는 반드시 인코딩해서 보내야 한다
	</pre>
	<hr>
	
	<!-- a 태그를 이용한 파라미터 전송 -->
	<p>
		<!-- "홍%동"을 인코딩하지 않고 GET 방식으로 보내면 크롬은 null로 전송한다 -->
		<a href="ex01_ok.jsp?name=홍%동&age=20">확인</a>
		
		<!-- 자바를 이용하여 인코딩해서 전송 -->
		<a href="ex01_ok.jsp?name=<%= URLEncoder.encode("홍길동","utf-8") %>&age=20;">확인</a>
	</p>
	
	<!-- 자바스크립트를 이용하여 GET 방식으로 파라미터 전송 -->
	<p>
		<button type="button" onclick="send()">확인</button>
	</p>
	<script type="text/javascript">
		function send() {
			let name = "자&바";
			let age = 17;
			
			// name을 인코딩하지 않고 보내면 크롬은 '자'만 전달
			// 자바스크립트로 인코딩
			name = encodeURIComponent(name);
			
			let params = 'name=' + name + '&age=' + age;
			let url = 'ex01_ok.jsp?' + params;
			location.href = url;
		}
	</script>
	<%--
		- form 태그를 이용한 GET 방식 전송
		  : 일반적으로 form 태그를 이용한 get 방식 전송은 잘 사용하지 않는다
		  
		- form 태그를 이용한 GET 방식 전송은 method 속성을 생략하거나, method="get"으로 설정한다
	--%>
	
	<form action="ex01_ok.jsp" name="myForm" method="get">
		<p>이름: <input type="text" name="name"> </p>
		<p>나이: <input type="text" name="age"> </p>
		<p>
			<button type="button" onclick="sendOk()">전송</button>
		</p>
	</form>
	
	<script type="text/javascript">
		function sendOk() {
			// form 태그를 이용해서 내용을 get 방식으로 전송하면 a 태그와 다르게 인코딩하지 않아도,
			// "김%바" 와 같은 데이터도 잘 넘어간다
			const f = document.myForm;
			
			f.name.value = encodeURIComponent(f.name.value); // 인코딩해서 전송하기
			
			f.submit(); // 일반 버튼 등에서 form 태그의 정보를 서버로 전송
		}
	</script>
	
	

</body>
</html>