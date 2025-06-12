<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>include 지시어</h3>
	<pre>
		- jsp 페이지에 다른 페이지의 내용을 포함할 때 사용
		- jsp 파일의 java로 변환할 때 처리
		- 복사 / 붙여넣기 개념과 유사
	</pre>

	<%@ include file="sub.jsp"%>
	<p>
		<%=subject%> 강좌 입니다
	</p>
</body>
</html>