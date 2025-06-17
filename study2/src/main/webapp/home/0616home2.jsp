<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<%
	request.setCharacterEncoding("UTF-8");
	String s = request.getParameter("score");
	int score = -1;  // 점수를 안 넣었을 경우를 위한 기본값
	if (s != null && !s.equals("")) {
		try {
			score = Integer.parseInt(s);
		} catch (Exception e) {
			score = -1;
		}
	}
	pageContext.setAttribute("score", score);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 점수 → 학점 출력</title>
<style>
	body { font-family: Arial; padding: 30px; background: #f9f9f9; }
	form { margin-bottom: 20px; }
	input[type="number"] {
		padding: 5px; width: 100px;
	}
	button {
		padding: 5px 10px;
	}
	.result {
		padding: 15px;
		background: #fff;
		border: 1px solid #ddd;
		width: 300px;
	}
</style>
</head>
<body>

<h2>점수를 입력하면 학점을 알려드립니다</h2>

<form method="get">
	<label>점수 입력 (0~100): </label>
	<input type="number" name="score" min="0" max="100" required>
	<button type="submit">확인</button>
</form>

<c:if test="${score >= 0}">
	<div class="result">
		<p>당신의 점수는 <strong>${score}</strong>점입니다.</p>
		<p>등급:
			<c:choose>
				<c:when test="${score >= 90}">A학점</c:when>
				<c:when test="${score >= 80}">B학점</c:when>
				<c:when test="${score >= 70}">C학점</c:when>
				<c:when test="${score >= 60}">D학점</c:when>
				<c:otherwise>F학점</c:otherwise>
			</c:choose>
		</p>
	</div>
</c:if>

</body>
</html>
