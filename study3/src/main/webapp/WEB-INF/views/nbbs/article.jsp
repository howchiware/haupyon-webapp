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

.table-article { margin-top: 20px; }
.table-article tr > td { padding-left: 5px; padding-right: 5px; }
</style>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.7.2/css/all.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myModal.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/myModal.js"></script>

<script type="text/javascript">
function pwdInputModal(mode) {
	const titleEL = document.querySelector('.popup-body-title');
	if(mode === 'update') {
		titleEL.textContent = '데이터 수정';
	} else if( mode === 'delete') {
		titleEL.textContent = '데이터 삭제';
	}
	
	const f = document.pwdForm;
	f.mode.value = mode;
	
	modalOpen('.modal-container');
}

window.addEventListener('load', e => {
	const btnConfirm = document.querySelector('.modal-confirm');
	btnConfirm.addEventListener('click', () => {
		// 확인 버튼
		
		modalClose('.modal-container');
	});
});
</script>

</head>
<body>

<div class="board">
	<div class="title">
	    <h3><span>|</span> 게시판</h3>
	</div>
	
	<table class="table table-border table-article">
		<thead>
			<tr>
				<td colspan="2" align="center">
					${dto.subject}
				</td>
			</tr>
		</thead>
		
		<tbody>
			<tr>
				<td width="50%">
					이름 : ${dto.name}
				</td>
				<td align="right">
					${dto.reg_date} | 조회 ${dto.hitCount}
				</td>
			</tr>
			
			<tr>
				<td colspan="2" valign="top" height="200">
					${dto.content}
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					이전글 : 
					<c:if test="${not empty prevDto}">
						<a href="${pageContext.request.contextPath}/nbbs/article.do?${query}&num=${preDto.num}">${prevDto.subject}</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					다음글 : 
					<c:if test="${not empty nextDto}">
						<a href="${pageContext.request.contextPath}/nbbs/article.do?${query}&num=${nextDto.num}">${nextDto.subject}</a>
					</c:if>
				</td>
			</tr>
		<tbody>
	</table>
	
	<table class="table">
		<tr>
			<td width="50%">
				<button type="button" class="btn" onclick="pwdInputModal('update');">수정</button>
				<button type="button" class="btn" onclick="pwdInputModal('delete');">삭제</button>
			</td>
			<td align="right">
				<button type="button" class="btn" onclick="location.href='${pageContext.request.contextPath}/nbbs/list.do?${query}';">리스트</button>
			</td>
		</tr>
	</table>
</div>

<div class="popup-wrap modal-container">
	<div class="popup-content">
		<div class="popup-header">
			<h3 class="popup-title">패스워드</h3>
			<button type="button" class="btn-popup btn-icon popup-close" > <i class="fa-solid fa-xmark"></i> </button>
     		</div>
		<div class="popup-body">
			<h4 class="popup-body-title" style="text-align: center;">데이터 수정</h4>
			<p style="text-align: center; padding: 15px 5px 15px; "> 게시글의 패스워드를 입력 하세요 </p>
			
			<form name="pwdForm" method="post" style="text-align: center;">
				<input type="password" name="pwd" class="form-control" style="width: 250px;">
				<input type="hidden" name="num" value="${dto.num}">
				<input type="hidden" name="schType" value="${schType}">
				<input type="hidden" name="kwd" value="${kwd}">
				<input type="hidden" name="page" value="${page}">
				<input type="hidden" name="mode">
			</form>
		</div>
		<div class="popup-footer">
			<button class="btn-popup popup-close modal-close">닫기</button>
			<button class="btn-popup confirm modal-confirm">확인</button>
		</div>
	</div>
</div>

</body>
</html>