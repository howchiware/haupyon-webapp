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

	<h3>파일 업로드</h3>
	
	<!-- 
		- enctype="multipart/form-data"
		  : 주소 형식으로 인코딩하지 않고 2진 데이터로 전송
		  : 파일의 내용도 전송된다
		  : enctype은 method="post" 에서만 유효하다
	 -->
	
	<form action="ex02_ok.jsp" method="post" enctype="multipart/form-data">
		<p>제목: <input type="text" name="subject"></p>
		<p>파일: <input type="file" name="selectFile"></p>
		<p>
			<button type="submit">등록하기</button>
		</p>
	</form>

</body>
</html>