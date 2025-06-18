<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring</title>
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

/* container */
.container { width: 750px; margin: 30px auto; }

.title { width:100%; font-size: 16px; font-weight: bold; padding: 13px 0; }

.table-list thead > tr { background: #f8f9fa; }
.table-list td, .table-list th { border: 1px solid #ced4da; }
.table-list td { text-align: center; padding-top: 3px; padding-bottom: 3px; }

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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.7.2/css/all.css">

<script type="text/javascript">
function updateScore(hak) {
	let url = '${pageContext.request.contextPath}/score/update.do';
	let params = 'hak=' + hak + '&page=${page}';
	
	url += '?' + params;
	
	location.href = url;
}

function deleteScore(hak) {
	if( confirm('학생 정보를 삭제 하시겠습니까 ? ')) {
		let url = '${pageContext.request.contextPath}/score/delete.do';
		let params = 'hak=' + hak + '&page=${page}';
		
		url += '?' + params;
		location.href = url;
	}
	
}

function deleteList() {
	const f = document.listForm;
	
	let cnt = f.querySelectorAll('input[name=haks]:checked').length;
	
	if(cnt === 0) {
		alert('삭제할 학생을 먼저 선택하세요');
		return;
	}
	
	if(! confirm('선택된 자료를 삭제하시겠습니까?')) {
		return;
	}
	
	
	f.action = '${pageContext.request.contextPath}/score/deleteList.do';
	f.submit();
	

}

window.addEventListener('DOMContentLoaded', evt => {
	
	const chkAllEL = document.getElementById('chkAll');
	const inputELS = document.querySelectorAll('form input[name=haks]');
	
	chkAllEL.addEventListener('click', e => {
		inputELS.forEach( el => el.checked = chkAllEL.checked );
	});
	
	// 체크박스가 하나라도 해제되면 전체 선택 해제
	for(let el of inputELS) {
		el.addEventListener('click', e => {
			let chkELS = document.querySelectorAll('form input[name=haks]:checked');
			chkAllEL.checked = inputELS.length === chkELS.length; // 선택된 개수가 같을 때만 chkAllEL.checked 적용
		});
	}
	
});
</script>

</head>
<body>

<div class="container">
	<div class="title">
	    <h3><i class="fa-solid fa-graduation-cap"></i> 성적처리</h3>
	</div>
	
	<table class="table">
		<tr>
			<td align="left" width="50%">
				<button type="button" class="btn" onclick="deleteList()">삭제</button>
			</td>
			<td align="right">
				${dataCount}개(${page}/${total_page}페이지)
			</td>
		</tr>
	</table>
		
	<form method="post" name="listForm">
		<table class="table table-list">
			<thead>
				<tr>
					<th width="35">
						<input type="checkbox" name="chkAll" id="chkAll" value="all">
						<input type="hidden" name="page" value="${page}">
					</th>
					<th width="70">학번</th>
					<th width="100">이름</th>
					<th width="100">생년월일</th>
					<th width="60">국어</th>
					<th width="60">영어</th>
					<th width="60">수학</th>
					<th width="60">총점</th>
					<th width="60">평균</th>
					<th>변경</th>
				</tr>
			</thead>
	
			<tbody>
				<c:forEach var="dto" items="${list}"> <!-- list는 컬렉션 -->
	
					<tr>
						<td>
							<input type="checkbox" name="haks" value="${dto.hak}"> <!-- hak이 기본키라서 -->
						</td>
						<td>${dto.hak}</td>
						<td>${dto.name}</td>
						<td>${dto.birth}</td>
						<td>${dto.kor}</td>
						<td>${dto.eng}</td>
						<td>${dto.mat}</td>
						<td>${dto.tot}</td>
						<td>${dto.ave}</td>
						<td>
							<button type="button" onclick="updateScore('${dto.hak}')" class="btn">수정</button>
							<button type="button" onclick="deleteScore('${dto.hak}')" class="btn">삭제</button>
						</td>
					</tr>
				
				</c:forEach>
			</tbody>
	
		</table>
	</form>
	
	<div class="page-navigation">
		${dataCount == 0 ? "등록된 정보가 없습니다." : paging }
	</div>
	
	<table class="table">
		<tr>
			<td width="100">
				&nbsp;
			</td>
			<td align="center">
				&nbsp;
			</td>
			<td align="right" width="100">
				<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/score/write.do';">학생등록</button>
			</td>
		</tr>
	</table>	
</div>

</body>
</html>