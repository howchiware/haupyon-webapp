<%@ page contentType="text/html; charset=UTF-8"%>

<%
	pageContext.setAttribute("msg", "안녕하세유 송가인이어라");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>pageContext 객체: Jsp 실행에 필요한 Context 정보를 담고 있는 내장객체</h3>
	
	<!-- 
		- 주요 메소드
		   ㄴ JspWriter getOut(): 응답 스트림인 out 내장객체 방환
		   ㄴ ServletContext getServletContext(): 페이지에 대한 서블릿. 실행환경을 담고 있는 application 내장 객체를 반환
		   ㄴ Object getAttribute(String name): 주어진 이름의 속성의 값 반환. 없으면 null
		   ㄴ void setAttribute(String name, Object value): 주어진 이름으로 속성값 저장
	 -->
	 
	 <p>
	 	<%= pageContext.getAttribute("msg") %>
	 </p>
	 
	 <p>
	 	<% 
	 		pageContext.getOut().print("밥주세요"); 
	 	%>
	 </p>

</body>
</html>