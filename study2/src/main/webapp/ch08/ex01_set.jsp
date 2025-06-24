<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<%
	// 쿠키 설정: 서버가 클라이언트 컴퓨터에 정보를 저장
	// 쿠키 시간을 설정하지 않으면 브라우저가 종료되면 쿠키도 제거 된다
	Cookie c1 = new Cookie("subject", "java");
	response.addCookie(c1);
	
	Cookie c2 = new Cookie("subject2", "spring");
	c2.setMaxAge(60 * 60); // 쿠키 유효시간(단위: 초) // 1시간
	response.addCookie(c2);
	
	Cookie c3 = new Cookie("subject3", URLEncoder.encode("오라클", "UTF-8"));
	c3.setMaxAge(-1); // -1: 브라우저가 종료되면 쿠키도 삭제(기본)
	response.addCookie(c3);
	
	// 쿠키는 기본적으로 쿠키를 설정한 경로에서만 접근할 수 있다
	Cookie c4 = new Cookie("tel", "010-1111-1111");
	c4.setPath("/"); // 모든 경로에서 쿠키를 접근하도록 설정
	response.addCookie(c4);
	
	Cookie c5 = new Cookie("age", "20");
	c5.setMaxAge(0); // 쿠키 생성과 동시에 제거
	response.addCookie(c5);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h3>쿠키 설정</h3>
	
	
	<p>
		<a href="ex01.jsp">돌아가기</a>
	</p>

</body>
</html>