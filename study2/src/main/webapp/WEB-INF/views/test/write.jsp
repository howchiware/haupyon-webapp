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

	<form action="${pageContext.request.contextPath}/testFile/write.do" method="post" enctype="multipart/form-data">
		<p>제목: <input type="text" name="subject"></p>
		<p>파일: <input type="file" name="selectFile"></p>
		<p>
			<button type="submit">확인</button>
		</p>
	</form>
	

</body>
</html>