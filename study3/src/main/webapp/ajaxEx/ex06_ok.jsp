<%@page import="org.json.JSONArray"%>
<%@page import="org.json.JSONObject"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String content = request.getParameter("content");
	

	// JSON 형식-1: {"이름1":"값1","이름2":"값2"}
	// JSON 형식-2: {"이름":[{"이름1":"값1","이름2":"값2"},{"이름1":"값1","이름2":"값2"}]}
	// JSON 형식-3: [{"이름1":"값1","이름2":"값2"},{"이름1":"값1","이름2":"값2"}]
	
	/*		
	StringBuilder sb = new StringBuilder();
	sb.append("{");
	sb.append("\"name\":\"" + name + "\"");
	sb.append(", \"content\":\"" + content + "\"");
	sb.append("}");
	out.print(sb.toString());
	*/
	
	JSONObject job = new JSONObject();
	job.put("dataCount", 5);
	
	JSONArray jar = new JSONArray();
	for(int n=1; n<=5; n++) {
		JSONObject ob = new JSONObject();
		ob.put("num", n);
		ob.put("name", (char)(n+64)+ "-" + name);
		ob.put("content", (char)(n+64)+ "-"+content);
		jar.put(ob);
	}
	
	job.put("list", jar);
	
	out.print(job.toString());
	
	
%>
