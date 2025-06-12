<%@ page contentType="text/html; charset=UTF-8"%>

<%@ page buffer="1kb"  autoFlush="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>page 지시어(directive)</h3>
	
	<pre>
		- buffer 속성: 출력할 버퍼 크기(기본 8kb)
		- autoFlush() 속성: 버퍼가 찬 경우 버퍼를 비울지에 대한 여부(기본: true-버퍼가 차면 비운다)
	</pre>
	
	<!-- 
		buffer의 크기가 1kb이고, autoFlush="false" 환경에서는 출력 내용이 4kb 이상이므로 에러가 발생한다
		autoFlush="true"로 설정하면 에러가 없어진다
	 -->
	
	<%
		for(int i = 1; i <= 1000; i++) {
			out.println("1234");
		}
	%>

</body>
</html>