<%@page import="com.util.MyUtil"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%
	request.setCharacterEncoding("utf-8");

	// 파라미터로 넘어온 페이지 번호
	// page: JSP 예약어로 사용 불가
	String pageNum = request.getParameter("page");
	
	int current_page = 1;
	if(pageNum != null) {
		current_page = Integer.parseInt(pageNum);
	}
	
	MyUtil util = new MyUtil();
	
	int dateCount = 965;
	int size = 10;
	int total_page = util.pageCount(dateCount, size);
	
	if(current_page > total_page) {
		current_page = total_page;
	}
	
	String listUrl = "list.jsp";
	String paging = util.paging(current_page, total_page, listUrl);
	
	pageContext.setAttribute("paging", paging);
	
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<style type="text/css">
* { padding: 0; margin: 0; }
*, *::after, *::before { box-sizing: border-box; }

body {
	font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
}

.container {
	width: 700px;
	margin: 30px auto;
}

.page-navigation {
	padding: 20px 0;
	text-align: center;
}

.paginate {
	font-size: 14px;
	text-align: center;
}

.paginate a {
	color: #000;
	font-weight: 600;
	text-decoration: none;
	padding: 3px 7px;
	margin-left: 3px;
	border: 1px solid #ccc;
	vertical-align: middle;
}

.paginate a:hover, .paginate a:active {
	color: #6771ff;
}

.paginate span {
	color: #cb3536;
	font-weight: 600;
	padding: 3px 7px;
	margin-left: 3px;
	border: 1px solid #e28d8d;
	vertical-align: middle;
}

.paginate :first-child {
	margin-left: 0;
}

</style>

</head>
<body>

	<div class="container">
		<h3>페이징 처리 테스트</h3>
		
		<div class="page-navigation">
			${paging}
		</div>
		
	</div>

</body>
</html>