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

	<h3>서블릿 3.0을 이용한 파일 업로드</h3>
	
	
	<p>제목: ${subject}</p>
	<p>클라이언트가 올린 파일명: ${originalFilename}</p>
	<p>서버에 저장된 파일명: ${saveFilename}</p>
	<p>파일 용량: ${fileSize}</p>
	
	<p>
		<c:url var="url" value="/testFile/download.do">
			<c:param name="saveFilename" value="${saveFilename}" />
			<c:param name="originalFilename" value="${originalFilename}" />
		</c:url>
		
		<a href="${url}">다운로드</a>
	</p>

</body>
</html>