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

	<h3>JSTL(core): forEach - 반복 구문</h3>

	<form action="ex06.jsp" method="post">
		<p>
			<input type="text" name="num" placeholder="숫자" required="required"
				pattern="\d+">
			<button type="submit">확인</button>
		</p>
	</form>
	
	<c:if test="${ not empty param.num }">
		<p> ** ${ param.num } 단 ** </p>
		<!-- step: 증가분. 1이면 생략 가능함 -->
		<c:forEach var="n" begin="1" end="9" step="1">
			${ param.num } * ${ n } = ${ param.num * n }<br>
		</c:forEach>
	</c:if>

</body>
</html>