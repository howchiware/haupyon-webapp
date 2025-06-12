<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>form 데이터 전송 - submit 버튼</h3>
	
	<pre>
		- form 태그 안에 있는 submit 버튼은 서버로 전송할 수 있는 기능이 있다
		- submit 버튼이 form 태그 안에 있을 때만 서버로 전송 가능하다
	</pre>
	
	<%--
		[submit] 버튼 종류
		  1) <button> 확인 </button>
		  2) <button type="submit"> 확인 </button>
		  3) <input type="submit" value="확인">
		  4) <input type="image" src="이미지">
		
		[input 태그의 required, pattern 속성]
		  input 태그가 form 태그 안에 있어야 하고, submit 버튼을 누를 때만 반응한다
		  
		[<button type="reset"> 초기화 </button>]
		  reset 버튼은 form 태그 안에 있어야 누를 때 반응한다 
	 --%>
	 <hr>
	
	<form action="ex03_ok.jsp" method="post">
		<p>이름 : <input type="text" name="name" required="required"> </p>
		<p>나이 : <input type="text" name="age" required="required" pattern="\d+"> </p>
		<p>
			<button>보내기</button> |
			<button type="submit">보내기</button> |
			<input type="submit" value="확인"> |
			<input type="image" src="btn_submit.gif"> |
			<button type="button">일반버튼</button> |
			<button type="reset">초기화</button>
		</p>
	</form>

</body>
</html>