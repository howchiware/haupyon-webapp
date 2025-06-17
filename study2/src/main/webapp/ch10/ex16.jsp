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
	<h3>JSTL - fmt 태그: 숫자, 날짜, 시간을 포맷팅하는 기능과 국제화, 다국어 지원 기능</h3>
	
	<p>default locale: <%= response.getLocale() %></p>
	<p>default locale: ${ pageContext.response.locale }</p>
	<hr>
	
	
	
	<h3>통화기호</h3>
	<p>기본 통화기호: <fmt:formatNumber value="12345.6789" type="currency" /> </p> <!-- ₩12,346 -->
	
	<!-- 미국 -->
	<p> 
		set locale: en_US<br>
		<fmt:setLocale value="en_US"/> 
		currency: <fmt:formatNumber value="12345.6789" type="currency" />
	</p>
	
	<!-- 일본 -->
	<p> 
		set locale: ja_JP<br>
		<fmt:setLocale value="ja_JP"/> 
		currency: <fmt:formatNumber value="12345.6789" type="currency" />
	</p>
	<hr>
	
	<!-- 한국 -->
	<p> 
		set locale: ko_KR<br>
		<fmt:setLocale value="ko_KR"/> 
		currency: <fmt:formatNumber value="12345.6789" type="currency" />
	</p>
	

	
	
	
	<h3>숫자</h3>
	<p>number: <fmt:formatNumber value="12345.6789" type="number" /></p>
	<p>currency: <fmt:formatNumber value="12345.6789" type="currency" /></p>
	<p>currency: <fmt:formatNumber value="12345.6789" type="currency" currencySymbol="￦"/></p>
	<p>percent: <fmt:formatNumber value="0.756" type="percent" /></p> <!-- 76% -->
	<p>pattern: <fmt:formatNumber value="12345.6789" pattern=".0" /></p> <!-- 12345.7 -->
	<p>pattern: <fmt:formatNumber value="12345.6789" pattern="#,##0.0" /></p> <!-- 12,345.7 -->
	<p>pattern: <fmt:formatNumber value="0.6789" pattern="#,##0.0" /></p> <!-- 0.7 -->
	<p>pattern: <fmt:formatNumber value="0.6789" pattern="#,###.0" /></p> <!-- .7 -->
	<hr>
	
	
	<h3>날짜</h3>
	<c:set var="today" value="<%= new java.util.Date() %>" />
	<p>${ today }</p>
	<p>date: <fmt:formatDate value="${today}" type="date"/> </p>
	<p>time: <fmt:formatDate value="${today}" type="time"/> </p>
	<p>both: <fmt:formatDate value="${today}" type="both"/> </p>
	<p>korea KST: <fmt:formatDate value="${today}" type="both" dateStyle="full" timeStyle="full"/> </p>
	
	

</body>
</html>