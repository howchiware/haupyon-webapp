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

	<h2>c:import 태그</h2>
	<!-- 
		jsp:include 액션 태그와 유사
		서버 내부 및 서버 외부 자원의 내용을 포함할 수 있다
	 -->
	 
	 
	 <!-- 내부 자원 추가 -->
	 <c:set var="url" value="ex12.jsp" />
	 <c:import var="u" url="${url}" />
	 
	 
	 <h3>실행 결과 가져오기</h3>
	 <div>
	 	<c:out value="${u}" escapeXml="false"/>
	 </div>
	 <hr>
	 
	 <!-- c:import에서 var 속성을 사용하지 않으면, 바로 실행 결과가 출력된다 -->
	 <div>
	 	<c:import url="${url}" />
	 	<c:import url="ex12.jsp" />
	 </div>
	 
	 <!-- 외부 자원 포함 -->
	 <c:set var="url" value="https://www.naver.com" />
	 <div>
	 	<c:import url="${url}" />
	 </div>
	 

</body>
</html>