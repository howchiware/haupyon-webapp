<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>


	<!--  받아서 출력만 하라꼬? -->
	
	<h3>폼 예제</h3>
	
	<form action="ex06_ok.jsp" method="post">
		<p>이름: <input type="text" name="name"></p> 
		<p>학번: <input type="text" name="stdId"></p> 
		<p>
			성별: 
			<input type="radio" name="gender" value="M">남자
			<input type="radio" name="gender" value="W" checked="checked">여자
		</p> 
		<p>
			좋아하는 과목:
			<input type="text" name="subject">
			<input type="text" name="subject">
			<input type="text" name="subject">
		</p>
		<p>
			출신도:
			<select name="city">
				<option value="">:: 선택 :: </option>
				<option value="서울">서울시</option>
				<option value="인천">인천시</option>
				<option value="경기">경기도</option>
				<option value="기타지역">기타지역</option>
			</select>
		</p>
		<p>
			취미:
			<select name="hobby" multiple="multiple" size="5">
				<option value="운동">운동하기</option>
				<option value="영화">영화보기</option>
				<option value="게임">게임하기</option>
				<option value="독서">책읽기</option>
				<option value="여행">여행하기</option>
			</select>
		</p>
		<p>
			<button type="submit">등록하기</button>
		</p>
	</form>

</body>
</html>