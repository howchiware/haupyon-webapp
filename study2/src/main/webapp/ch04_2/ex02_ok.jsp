<%@ page contentType="text/html; charset=UTF-8"%>

<%
	// post 방식으로 넘어온 파라미터의 인코딩 방식 설정
	request.setCharacterEncoding("utf-8");

	// getParameter(): get, post 방식으로 넘어온 파라미터 받기
	//               : 리턴 타입은 String
	//               : 동일한 이름의 파라미터는 처음 하나만 받는다
	
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	String city = request.getParameter("city"); // city 라는 이름의 파라미터로 보낸 것이 없으므로 null 을 반환
	String subject = request.getParameter("subject"); // 좋아하는 과목을 하나도 선택하지 않았으면 null 을 반환
												// 좋아하는 과목을 두개 이상 선택하면, 처음 선택한 것만 받는다
												// 동일한 이름의 파라미터는 getParameterValues()로 받는다
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>넘어온 파라미터</h3>
	<p>이름: <%= name %></p>
	<p>패스워드: <%= pwd %></p>
	<p>나이: <%= age %></p>
	<p>성별: <%= gender %></p>
	<p>지역: <%= city %></p>
	<p>과목: <%= subject %></p>

</body>
</html>