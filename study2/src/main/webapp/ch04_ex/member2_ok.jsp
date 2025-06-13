<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String userName = request.getParameter("userName");
	
	String[] schoolNames = request.getParameterValues("schoolName");
	String[] schoolDate1s = request.getParameterValues("schoolDate1");
	String[] schoolDate2s = request.getParameterValues("schoolDate2");
	String[] licenseNames = request.getParameterValues("licenseName");
	String[] licenseDates = request.getParameterValues("licenseDate");
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

<p> 아이디 : <%=  userId%> </p>
<p> 패스워드 : <%=  userPwd%> </p>
<p> 이름 : <%=  userName%> </p>
<hr>
<p> 학력 : </p>
<%
	for(int i = 0; i < schoolNames.length; i++) {
		out.print("<p>" + schoolNames[i] + " : " + schoolDate1s[i] + " ~ " + schoolDate2s[i] + "</p>");
	}
%>
<hr>

<p> 자격증 : </p>
<%
	if(licenseNames != null) {
		for(int i = 0; i < licenseNames.length; i++) {
			out.print("<p>" + licenseNames[i] + " : " + licenseDates[i] + "</p>");
		}
	}
%>
<hr>

</body>
</html>