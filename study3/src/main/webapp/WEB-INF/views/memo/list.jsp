<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>    


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

* { margin: 0; padding: 0; box-sizing: border-box; }

@font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
    font-family: 'CookieRun-Regular', sans-serif;
}

.container {
	width: 700px;
	height: 560px;
	border: 1px solid black;
	border-radius: 20px;
	margin: 30px auto;
}

.container .title {
	text-align: center;
	background: #e9fbe9;
	height: 50px;
	border-radius: 20px;
}


.table a {
	text-decoration: none;
	color: inherit;
}

.title span {
	font-size: 27px;
}

.container .table {
	margin: 15px;
}

.container .table .first {
	font-size: 18px;	
	font-weight: 500;
	color: #474747;
}

.container .table .first a {
	display: inline-block;
	width: 650px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
}

.container .table .first:hover {
	text-decoration: none;
}

.container .table .last {
	font-size: 13px;
	text-decoration: none;
	color: #c6c6c6;
}

.container .table .last td {
	padding-bottom: 10px;
}

.container .page-navigation .table {
	margin: 10px auto;
	
}

.btn {
	border-style: none;
	background: none;
}


</style>

</head>
<body>

	<div class="container">
		
		<div class="title">
			<span>📝메모장</span>
		</div>
		
		<table class="table table-list">
			<tbody>
				<c:forEach var="dto" items="${list}" varStatus="status">
					<tr class="first">
						<td><a href="${articleUrl}&num=${dto.num}">${dto.content}</a></td>
					</tr>
					<tr class="last">
						<td>${dto.reg_date}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div class="page-navigation">
		
			<table class="table sub-table">
				<tr>
					<td class="page">
						${dataCount == 0 ? "등록된 게시물이 없습니다." : paging} 
					</td>
				</tr> 
				<tr>
					<td>${dataCount}개</td>
				</tr>
				<tr>
					<td>
						<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/memo/write.do'">🖋️</button>
					</td>
				</tr>
			</table>
			
			

		</div>
		
	</div>

</body>
</html>