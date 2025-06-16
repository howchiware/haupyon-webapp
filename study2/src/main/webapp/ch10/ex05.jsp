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

	<h3>JSTY-core: choose</h3>
	<!-- 다중 선택 구문 -->

	<form action="ex05.jsp" method="post">
		<p>
			<input type="text" name="num" placeholder="숫자" required="required"
				pattern="\d+">
			<button type="submit">확인</button>
		</p>
	</form>
	
	<c:if test="${ not empty param.num }">
		<p>
			<c:choose>
				<c:when test="${ param.num % 3 == 0 && param.num % 4 == 0 }">
					${ param.num } : 3과 4의 배수
				</c:when>
				<c:when test="${ param.num % 3 == 0 }">
					${ param.num } : 3의 배수
				</c:when>
				<c:when test="${ param.num % 4 == 0 }">
					${ param.num } : 4의 배수
				</c:when>
				<c:otherwise>
					${ param.num } : 3 또는 4의 배수가 아님
				</c:otherwise>
			</c:choose>
		</p>
	</c:if>
	

</body>
</html>