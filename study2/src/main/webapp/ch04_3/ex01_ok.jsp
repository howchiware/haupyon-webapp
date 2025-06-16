<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String protocol = request.getProtocol();
	String serverName = request.getServerName();
	int serverPort = request.getServerPort();
	String romoteAddr = request.getRemoteAddr();
	String remoteHost = request.getRemoteHost();
	
	// 주요 헤더 정보
	String agent = request.getHeader("User-Agent");
	String referer = request.getHeader("Referer");
	if(referer == null) {
		referer = "";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>request 요청 정보</h3>
	
	<p>프로토콜: <%= protocol %></p>
	<p>서버 이름: <%= serverName %></p>
	<p>서버 포트번호: <%= serverPort %></p>
	<p>사용자 클라이언트 IP: <%= romoteAddr %></p>
	<p>사용자 컴퓨터 이름: <%= remoteHost %></p>
	<p>메소드: <%= request.getMethod() %></p>
	<p>클라이언트 OS 및 브라우저: <%= agent %></p>
	<p>이전 클라이언트 주소: <%= referer %></p>

</body>
</html>