<%@page import="ch10.user.User"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<!--  
		- EL의 주 사용 목적
		  ㄴ request, session, pageContext 등에서 설정한 속성(attribute)을 출력하기 위해 사용	
	-->
	
	<h3>EL을 사용하지 않은 경우</h3>
	<%
		User u = (User)request.getAttribute("dto");
		String city = request.getParameter("city");
	%>
	
	<p>
		<!-- 값이 null이면 null로 출력된다 -->
		<%= u.getName() %>, <%= u.getAge() %>, <%= u.getTel() %>, <%= u.getSubject() %> <!-- ${ dto.subject }: null인 데이터는 null로 표시됨 -->
	</p>
	<p><%= city %></p>
	<hr>
	
	
	
	
	<h3>EL을 사용한 경우</h3>
	<p>
		<!-- EL은 null은 아무것도 출력하지 않는다 -->
		${ dto.name }, ${ dto.age }, ${ dto.tel }, ${ dto.subject } <!-- getter가 있어야 하는... --> <!-- ${ dto.subject }: null인 데이터는 표시되지 않음 -->
	</p>
	<p>
		<!-- 파라미터는 param 이라는 EL 내장객체 사용 -->
		${ param.city }
	</p>

</body>
</html>