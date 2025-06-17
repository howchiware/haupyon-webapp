<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h2>c:url / c:param 태그</h2>
	
	<!-- 
		- c:url 태그
		  ㄴ url을 만들며 URL 인코딩 또는 URL 형식 지정에 사용한다
		  ㄴ 주소 가장 앞에 /를 붙이면 Context Path가 자동으로 추가된다
		  
		- c:param 태그
		  ㄴ c:import, c:url 태그에 파라미터를 전달하기 위해 사용한다
	 -->
	 
	 <!-- 파라미터를 인코딩하여 주소를 만든다 -->
	 <c:url var="a" value="ex13_ok.jsp">
	 	<c:param name="name" value="홍길동" />
	 	<c:param name="age" value="20" />
	 </c:url>
	 
	 <p>
	 	<a href="${a}">확인</a>
	 </p>

</body>
</html>