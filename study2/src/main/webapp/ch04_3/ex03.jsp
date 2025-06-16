<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>response 객체: 클라이언트의 요청에 대한 응답 정보를 담고 있는 객체</h3>
	
	<!-- 
		- response: HttpServletResponse 객체
		- redirect
		  ㄴ 웹 컨테이너는 웹 브라우저에게 주어진 페이지로 이동하라는 명령을 내림(응답코드 302)
		  ㄴ 웹 브라우저는 주어진 주소의 새로운 페이지에 접속함
		  ㄴ request, response 객체가 초기화 된다(다시 생성)
		  ㄴ 새로 접속하는 것이다
		  ㄴ 일반적으로 리다이렉트 해야하는 경우 => 로그인 후, 로그아웃 후, DB의 INSERT, UPDATE, DELETE 후
		  ㄴ INSERT 했는데 리다이렉트를 하지 않으면, INSERT는 두번 실행된다
	 -->
	 
	 	<p>
	 		<a href="ex03_ok.jsp">리다이렉트</a>
	 		<a href="ex03_ok2.jsp">에러</a>
	 	</p>
	 	
	 	


</body>
</html>