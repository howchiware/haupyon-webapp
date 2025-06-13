<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	// getParameterMap()은 파라미터를 Map<String, String[]> 으로 반환
	Map<String, String[]> map = request.getParameterMap();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>파라미터를 Map으로 받기: getParameterMap()</h3>
	
	<%
		String name = map.get("name")[0];
		String pwd = map.get("pwd")[0];
		String age = map.get("age")[0];
		String gender = map.get("gender")[0];
		String[] ss = map.get("subject");
		String s = "";
		
		if(ss != null) {
			for(String a : ss) {
				s += a + " ";
			}	
		}
		

	%>
	
	<p>이름: <%= name %></p>
	<p>패스워드: <%= pwd %></p>
	<p>나이: <%= age %></p>
	<p>성별: <%= gender %></p>
	<p>과목: <%= s %></p>
	<hr>
	
	<%
		Iterator<String> it = map.keySet().iterator();
		while(it.hasNext()) {
			String key = it.next(); // 파라미터 이름
			String[] values = map.get(key);
			if(values != null) {
				for(String a : values) {
					out.print("<p>" + key + " : " + a + "</p>");
				}
			}
		}
	%>

</body>
</html>