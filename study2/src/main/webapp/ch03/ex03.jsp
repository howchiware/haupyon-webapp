<%@ page contentType="text/html; charset=UTF-8"%>


<%!
	// 선언부: 클래스의 선언부에 포함되는 코드 - 필드, 메소드 등을 정의한다
	int n; // 필드. 필드는 초기화하지 않으면 0
	
	public int sum(int num) {
		int s = 0;
		for(int i = 1; i <= num; i++) {
			s += i;
		}
		return s;
	}
%>

<%
	// 스크립릿(scriptlet): 자바의 메소드 코드 안에 포함되는 코드
	//                  : _jspService() 메소드 안에 포함된다
	
	int a;
	
	// a++; // 에러. 초기화 하지 않았음
	a = 0;
	a++;
	
	n++;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<p>선언부 변수: <%= n %></p>
	<p>스크립릿 변수: <%= a %></p>
	
	<p>
		1~100까지 합: <%= sum(100) %>
	</p>

</body>
</html>