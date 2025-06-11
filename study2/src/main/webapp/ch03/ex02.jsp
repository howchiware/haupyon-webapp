<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>표현식</h3>
	
	<div>
		<pre>
			- 자바 코드의 결과를 클라이언트에게 전송하기 위해 사용
			- 표현식은 자바코드로 변환될 때 out.print(코드); 형식으로 변환
			- 표현식은 서버측에서 실행되고 실행 결과(문자열)을 클라이언트에게 전송
		</pre>
	</div>
	
	<!-- 표현식 -->
	<p>
		합: <%= 1+2+3+4+5 %>
	</p>
	
	<p>
		<!-- 스크립릿: 자바코드 -->
		<%
			int n = 10;
			String s = n % 2 == 0 ? "짝수" : "홀수";
		%>
		<%= n %>은 <%= s %> 입니다
	</p>

</body>
</html>