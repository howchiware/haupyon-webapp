<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int age = Integer.parseInt(request.getParameter("age"));
	String s = age >= 19 ? "성인" : "미성년자";
	
	// 포워딩하는 페이지에게 정보를 전달
	request.setAttribute("state", s); // request.setAttribute(String, Object);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>포워딩하면 이 페이지는 보이지 않는다</h3>
	
	<!-- jsp 액션태그를 이용한 포워딩 -->
	<jsp:forward page="ex03_result.jsp" />

</body>
</html>