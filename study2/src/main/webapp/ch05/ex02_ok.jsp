<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%-- bean 생성 --%>
<jsp:useBean id="vo" class="ch05.user.User"/>

<%-- 생성된 bean에 파라미터 값 설정하기 --%>
<%-- property="*"는 form 입력요소 name 속성값과 일치하는 User 클래스 필드에 값을 설정  --%>
<jsp:setProperty name="vo" property="*"/>
<%-- form 입력요소 name 속성값과 일치하지 않는 경우  --%>
<jsp:setProperty name="vo" property="num" param="no"/>
<%
	String s = vo.getAge() >= 19 ? "성인" : "미성년자";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>결과</h3>
	<p>번호: <%= vo.getNum() %></p>
	<p>이름: <%= vo.getName() %></p>
	<p>나이: <%= vo.getAge() %>, <%= s %></p>
	<p>과목: <%= vo.getSubject() %></p>

</body>
</html>