<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h2>JSTL - functions 태그</h2>
	
	<c:set var="str" value="seoul korea" />
	
	<p>${str}</p>
	<p>${fn:contains(str, 'kor') ? 'kor 존재함' : 'kor 없음'}</p>
	<p>${fn:contains(str, 'KOR') ? 'KOR 존재함' : 'KOR 없음'}</p>
	<p>${fn:containsIgnoreCase(str, 'KOR') ? 'KOR 존재함' : 'KOR 없음'}</p> <!-- IgnoreCase 대소문자 구분안함 -->
	<p>${fn:startsWith(str, 'kor') ? 'kor로 시작함' : 'kor로 시작 안함'}</p>
	<p>${fn:endsWith(str, 'kor') ? 'kor로 종료함' : 'kor로 종료 안함'}</p>
	<p>${fn:indexOf(str, 'kor') }</p>
	<p>${fn:substring(str, 6, 9) }</p>
	<p>-------------------------</p>
	<p>${fn:substringAfter(str, "seoul") }</p>
	<p>${fn:substringBefore(str, "korea") }</p>
	<p>${fn:length(str) }</p>
	<p>${fn:replace(str, "korea", "한국") }</p>
	<p>${fn:toUpperCase(str) }</p>
	

</body>
</html>