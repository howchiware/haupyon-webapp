<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
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
	font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
	font-size: 14px;
	color: #222;
}

a { color: #222; text-decoration: none; cursor: pointer; }
a:active, a:hover { color: #f28011; text-decoration: underline; }

/* form-control */
.btn {
	color: #333;
	border: 1px solid #999;
	background-color: #fff;
	padding: 5px 10px;
	border-radius: 4px;
	font-weight: 500;
	cursor:pointer;
	font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.btn:active, .btn:focus, .btn:hover {
	background-color: #f8f9fa;
	color:#333;
}
.btn[disabled], fieldset[disabled] .btn {
	pointer-events: none;
	cursor: default;
	opacity: .65;
}

.form-control {
	border: 1px solid #999; border-radius: 4px; background-color: #fff;
	padding: 5px 5px; 
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.form-control[readonly] { background-color:#f8f9fa; }

textarea.form-control { height: 170px; resize : none; }

.form-select {
	border: 1px solid #999; border-radius: 4px; background-color: #fff;
	padding: 4px 5px; 
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}
.form-select[readonly] { background-color:#f8f9fa; }

textarea:focus, input:focus { outline: none; }
input[type=checkbox], input[type=radio] { vertical-align: middle; }

/* table */
.table { width: 100%; border-spacing: 0; border-collapse: collapse; }
.table th, .table td { padding-top: 10px; padding-bottom: 10px; }

.table-border thead > tr { border-top: 2px solid #212529; border-bottom: 1px solid #ced4da; }
.table-border tbody > tr { border-bottom: 1px solid #ced4da; }
.table-border tfoot > tr { border-bottom: 1px solid #ced4da; }
.td-border td { border: 1px solid #ced4da; }

/* board */
.board { margin: 30px auto; width: 700px; }

.title { width:100%; font-size: 16px; font-weight: bold; padding: 13px 0; }

.table-list thead > tr { background: #f8f9fa; }
.table-list th, .table-list td { text-align: center; }
.table-list td:nth-child(5n+2) { text-align: left; padding-left: 5px; }

.table-list .num { width: 60px; color: #787878; }
.table-list .subject { color: #787878; }
.table-list .name { width: 100px; color: #787878; }
.table-list .date { width: 100px; color: #787878; }
.table-list .hit { width: 70px; color: #787878; }
.table-list .file { width: 50px; color: #787878; }

/* paginate */
.page-navigation { clear: both; padding: 20px 0; text-align: center; }

.paginate {
	text-align: center;
	white-space: nowrap;
	font-size: 14px;	
}
.paginate a {
	border: 1px solid #ccc;
	color: #000;
	font-weight: 600;
	text-decoration: none;
	padding: 3px 7px;
	margin-left: 3px;
	vertical-align: middle;
}
.paginate a:hover, .paginate a:active {
	color: #6771ff;
}
.paginate span {
	border: 1px solid #e28d8d;
	color: #cb3536;
	font-weight: 600;
	padding: 3px 7px;
	margin-left: 3px;
	vertical-align: middle;
}
.paginate :first-child {
	margin-left: 0;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/paging.js"></script>

<c:url var="listUrl" value="/nbbs/list.do">
	<c:if test="${not empty kwd}">
		<c:param name="schType" value="${schType}" />
		<c:param name="kwd" value="${kwd}" />
	</c:if>
</c:url>

<script type="text/javascript">
window.addEventListener('DOMContentLoaded', () => {
	let page = ${page};
	let pageSize = ${size};
	let dataCount = ${dataCount};
	let url = '${listUrl}'; // 문자라서 홑따옴표 필요
	
	let total_page = pageCount(dataCount, pageSize); // function pageCount()에 넘기기
	let paging = pagingUrl(page, total_page, url); // function pagingUrl()에 넘기기
	
	document.querySelector('.dataCount').innerHTML = dataCount + '개 (' + page + '/' + total_page + ' 페이지)';
	
	document.querySelector('.page-navigation').innerHTML = dataCount === 0 ? '등록된 게시물이 없습니다.' : paging;
});


// 검색키워드 입력란에서 엔터를 누른경우 서버전송 막기
window.addEventListener('DOMContentLoaded', () => {
	const inputEL = document.querySelector('form input[name=kwd]');
	inputEL.addEventListener('keydown', function(evt){
		if(evt.key === 'Enter') {
			evt.preventDefault();
			
			searchList();
		}
	});
});

function searchList() {
	const f = document.searchForm;
	
	if(! f.kwd.value.trim()) {
		return;
	}
	
	// FormData : 키-값으로 저장하며, multipart/form-data 형식으로 데이터를 전송하도록 만들어짐
	// URLSearchParams : URL 쿼리문자열을 쉽게 다루기 위한 내장객체
	
	// form 요소를 FormData로 변환
	const formData = new FormData(f);
	// FormData 객체를 URLSearchParams으로 변환
	// 이름=값&이름=값 형식으로 변환되며 한글등은 인코딩됨
	let params = new URLSearchParams(formData).toString();
	
	let url = '${pageContext.request.contextPath}/nbbs/list.do';
	url += '?' + params;
	location.href = url;
}

</script>
</head>
<body>

<div class="board">
	<div class="title">
	    <h3><span>|</span> 게시판</h3>
	</div>

	<table class="table">
		<tr>
			<td width="50%"><span class="dataCount"></span></td>
			<td align="right">&nbsp;</td>
		</tr>
	</table>
	
	<table class="table table-border table-list">
		<thead>
			<tr>
				<th class="num">번호</th>
				<th class="subject">제목</th>
				<th class="name">작성자</th>
				<th class="date">작성일</th>
				<th class="hit">조회수</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="dto" items="${list}" varStatus="status">
				<tr>
					<td>${dataCount-(page-1)*size-status.index}</td>
					<td>
						<c:url var="url" value="/nbbs/article.do">
							<c:param name="num" value="${dto.num}" />
							<c:param name="page" value="${page}" />
							<c:if test="${not empty kwd}">
								<c:param name="schType" value="${schType}" />
								<c:param name="kwd" value="${kwd}" />
							</c:if>
						</c:url>
						<a href="${url}">${dto.subject}</a>
					</td>
					<td>${dto.name}</td>
					<td>${dto.reg_date}</td>
					<td>${dto.hitCount}</td>
				</tr>
			</c:forEach>	
		<tbody>
		
	</table>
	
	<div class="page-navigation"></div>
	
	<table class="table">
		<tr>
			<td width="100">
				<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/nbbs/list.do';">새로고침</button>
			</td>
			<td align="center">
				<form name="searchForm">
					<select name="schType" class="form-select">
						<option value="all" ${schType=="all"?"selected":""}>제목+내용</option>
						<option value="name" ${schType=="name"?"selected":""}>작성자</option>
						<option value="reg_date" ${schType=="reg_date"?"selected":""}>등록일</option>
						<option value="subject" ${schType=="subject"?"selected":""}>제목</option>
						<option value="content" ${schType=="content"?"selected":""}>내용</option>
					</select>
					<input type="text" name="kwd" value="${kwd}" class="form-control">
					<button type="button" class="btn" onclick="searchList();">검색</button>
				</form>
			</td>
			<td align="right" width="100">
				<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/nbbs/write.do';">글올리기</button>
			</td>
		</tr>
	</table>	
</div>

</body>
</html>