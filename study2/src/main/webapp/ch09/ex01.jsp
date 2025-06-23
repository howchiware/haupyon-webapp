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
		- form 태그의 enctype 속성
		  : method 가 post 에서만 가능
		  : enctype을 생략하면 application/x-www-form-urlencoded
		
		- application/x-www-form-urlencoded
		  : 파라미터를 주소 형식으로 인코딩
		    이름1=값1&이름2=값2
		  : 파일을 서버로 전송하면 파일의 내용은 전송되지 않고 이름만 전송된다 
	 -->
	
	<form action="ex01_ok.jsp" method="post">
		<p>제목: <input type="text" name="subject"></p>
		<p>파일: <input type="file" name="selectFile"></p>
		<p>
			<button type="submit">등록하기</button>
		</p>
	</form>

</body>
</html>