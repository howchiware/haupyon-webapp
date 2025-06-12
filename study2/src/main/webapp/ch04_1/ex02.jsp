<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>파라미터 전송 - POST 전송</h3>
	
	<pre>
		- POST 방식으로 파라미터를 전송하면 body에 정보를 실어서 보낸다
		- POST 방식은 용량에 제한이 없다
		- POST 방식은 form 태그의 method="post"를 통해 전송된다
		- form 태그의 method="post"에서 기본 enctype은 enctype="application/x-www-form-urlencoded"이다
		- "application/x-www-form-urlencoded"는 주소 형식으로 데이터를 인코딩해서 보낸다
		- form 태그의 enctype 속성은 method="post"에서만 유효하다
	</pre>
	
	<form action="ex02_ok.jsp" method="post">
		<p>이름 : <input type="text" name="name"> </p>
		<p>나이 : <input type="text" name="age"> </p>
		<p>
			<button type="submit">보내기</button>
		</p>
	</form>

</body>
</html>