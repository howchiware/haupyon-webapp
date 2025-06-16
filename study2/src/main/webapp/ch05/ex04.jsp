<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>element 액션 태그 및 text 액션 태그</h3>
	
	<!-- 경고표시. <userName>이란 태그가 없음에도 오류가 나오지 않는다. 태그로 인식하게 된다.
		<userName>스프링</userName> 
	 -->
	 
	 <!-- 임의의 html이나 xml 태그를 만든다  -->
	 <!-- 소스를 확인해보면 <userName gender="여자">사임당</userName> 이라는 속성이 만들어진다 -->
	 <jsp:element name="userName">
	 	<jsp:attribute name="gender">여자</jsp:attribute>
	 	<jsp:body>사임당</jsp:body>
	 </jsp:element>
	 
	 <!-- jsp 페이지에 표시할 텍스트 -->
	 <p>
	 	<jsp:text>text 액션 태그</jsp:text>
	 </p>
	 
</body>
</html>