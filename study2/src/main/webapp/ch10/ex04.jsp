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

	<h3>JSTL-core: if</h3>
	
	<form action="ex04.jsp" method="post">
		<p>
			<input type="text" name="num" placeholder="숫자" required="required" pattern="\d+">
			<button type="submit">확인</button>
		</p>
	</form>
	
	<p>
		<c:if test="${not empty param.num }"> <!-- c는 core. test는 조건 -->
			${ param.num } : ${ param.num % 2 == 0 ? '짝수' : '홀수' } <!-- null은 0으로 판단해서 실행하면 ': 짝수'가 미리 출력된다 -->
		</c:if>	
	</p>
	
	<p>
		<c:if test="${not empty param.num }"> 
			<c:if test="${ param.num % 2 == 0 }">
				짝수
			</c:if>
			<c:if test="${ param.num % 2 == 1 }">
				홀수
			</c:if>
		</c:if>	
	</p>
	
	

</body>
</html>