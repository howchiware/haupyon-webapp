<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String userName = request.getParameter("userName");
	String birth = request.getParameter("birth");
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String zip = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String job = request.getParameter("job");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

<h3> 요청받은 회원 정보 </h3>

<p> 아이디 : <%= userId%> </p>
<p> 패스워드 : <%= userPwd%> </p>
<p> 이름 : <%= userName%> </p>
<p> 생년월일 : <%= birth%> </p>
<p> 이메일 : <%= email1%>@<%= email2%> </p>
<p> 전화번호 : <%= tel1%>-<%= tel2%>-<%= tel3%> </p>
<p> 우편번호 : <%= zip%> </p>
<p> 주소 : <%= addr1%> </p>
<p> 나머지주소 : <%= addr2%> </p>
<p> 직업 : <%= job%> </p>

</body>
</html>