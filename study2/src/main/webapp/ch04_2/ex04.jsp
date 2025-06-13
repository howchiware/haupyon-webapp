<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3> 파라미터를 getParameterMap()로 받기 </h3>
	
	<div>
		<form name="myForm" action="ex04_ok.jsp" method="post">
			<p>이름: <input type="text" name="name"></p>
			<p>패스워드: <input type="password" name="pwd"></p>
			<p>나이: <input type="text" name="age"></p>
			<p>
				성별:
				<input type="radio" name="gender" value="남"	>남자
				<input type="radio" name="gender" value="여" checked="checked">여자
			</p>
			<p>
				좋아하는 과목:
				<input type="checkbox" name="subject" value="java">자바
				<input type="checkbox" name="subject" value="html">HTML
				<input type="checkbox" name="subject" value="css">CSS
				<input type="checkbox" name="subject" value="javascript">자바스크립트
				<input type="checkbox" name="subject" value="oracle">오라클
			</p>
			<p>
				<button type="submit">보내기</button>
			</p>
		</form>
	</div>

</body>
</html>