<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h2>EL(Expression Language)</h2>
	
	<h3>사칙 연산</h3>
	
	<!-- 자동적으로 숫자로 변환한다 -->
	<p><%= 3 + 5 %></p> 						<!-- 앞으로 프로젝트할때는 사용하지 말것... -->
	<p> ${3+5} </p> <!-- 8(Long형) -->
	<p> ${3+"5"} </p> <!-- 8 -->
	<p> ${ "3" + "5"} </p> <!-- 8 -->
	<p> 3 + null 의 결과는 3. null 이 0으로 변경되어 계산된다</p>
	<p>${ 10 / 5 }</p> <!-- 2.0(Double형) -->
	<p>${ 13 / 5 }</p> <!-- 2.6 -->
	<p>${ 13 % 5 }</p> <!-- 3 -->
	<p>${ 13 mod 5 }</p> <!-- 3(%와 같은 기능) -->
	<p>EL에서 "A" + "B" 처럼 문자열을 결합하면 에러가 발생한다</p>
	<hr>
	
	<h3>비교/논리 연산</h3>
	<p>3 == 4: ${ 3 == 4 }, 3 eq 4 : ${ 3 eq 4 }</p>
	<p>3 != 4: ${ 3 != 4 }</p>
	<p>3 &lt; 4: ${ 3 < 4 }, 3 lt 4 : ${ 3 lt 4 }</p>
	<p>3 &gt; 4: ${ 3 > 4 }, 3 gt 4 : ${ 3 gt 4 }</p>
	<p>3 &gt;= 4: ${ 3 >= 4 }, 3 ge 4 : ${ 3 ge 4 }</p>
	<p>empty name: ${ empty name }</p> <!-- empty 는 값이 null, 빈 문자열, 길이가 0인 배열 등은 true -->
	<p> 10 : ${ 10 % 2 == 0 ? "짝수" : "홀수" }</p>
	<hr>
	
	<h3>기타 연산</h3>
	<p>문자열 결합: +=, ${ "서울" += "경기" }</p>
	<p>세미콜론 연산자 - a;b 에서 a는 출력되지 않고 b는 출력</p>
	<p>${1+2; 2+5 }</p>
	
	<p>할당 연산: 할당 연산 자체도 출력</p>
	<p>${ a = 10 } ${ a }</p> <!-- 10 10 -->
	<p>${ a = 10; a }</p> <!-- 10 -->
	
	
	
</body>
</html>