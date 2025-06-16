<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>forward</h3>

	<!-- 
		- 클라이언트로부터 요청 받은 서블릿(JSP)은 다른 자원(JSP, 서블릿)으로 요청 정보를 전달하여 처리하는 것
		- 포워딩은 서블릿 컨테이너에서 이루어지므로 클라이언트는 알 수 없음. 브라우저 주소 줄이 바뀌지 않음(최초에 호출한 URL이 표시됨)
		- 요청받은 페이지는 포워딩페이지에 request, response 객체를 그대로 전달
		- 요청받은 페이지가 포워딩하는 페이지에 새로운 정보를 전달하기 위해서는 request.setAttribute("이름", 값	)을 이용한다		
	 -->
	 
	 <form action="ex03_ok.jsp" method="post">
	 	<p>이름: <input type="text" name="name" required="required"></p>
	 	<p>나이: <input type="text" name="age" required="required" pattern="\d+"></p>
	 	<p><button type="submit">등록</button></p>
	 </form>

</body>
</html>