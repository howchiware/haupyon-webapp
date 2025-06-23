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
* { margin: 0; padding: 0; box-sizing: border-box; font-family: 'CookieRun-Regular', sans-serif;}

@font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

.container {
	margin: 30px auto;
}

.memo-box {
	width: 700px;
	height: 560px;
	border: 1px solid black;
	border-radius: 20px;
	margin: 15px auto;
}

.container .memo-box input[name=content] {
	width: 600px;
	height: 400px;
}

.btnDisplay {
	background: white;
	font-size: 15px;
	border-radius: 15px;
	padding: 5px 5px;
}

.back-btn {
	border-style: none;
	background: none;
	margin: 10px 10px;
}

.tdDisplay {
	align-items: center;
}

</style>

<script type="text/javascript">

window.addEventListener('DOMContentLoaded', () => {
	
	const inputEL = document.querySelector('form input[name=content]');
	
	inputEL.addEventListener('keydown', function(evt) {
		if(evt.key === 'Enter') {
			evt.preventDefault();
			
			searchList();
		}
	});
	
});

function sendOk() {
	
	const f = document.memoForm;
	
	if(! f.content.value.trim()) {
		f.content.focus();
		return;
	}
	
	if(! f.memo_date.value.trim()) {
		f.memo_date.focus();
		return;
	}
	
	
	f.action = '${pageContext.request.contextPath}/memo/${mode}.do';
	f.submit();
	
}

</script>

</head>
<body>

	<div class="container">
	
		<div class="memo-box">

			
			<form name="memoForm" method="post">
				<table class="table">
					<tr>
						<td>
							<button class="back-btn" onclick="location.href='${pageContext.request.contextPath}/memo/list.do'">${mode == "update" ? "수정 취소" : "◀" }</button>
							<c:if test="${mode == 'update'}">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
					<tr>
						<td class="tdDisplay">목표 일자: 
							<input type="date" name="memo_date" value="${dto.memo_date}">
						</td>
					</tr>
					<tr>
						<td class="tdDisplay">
							<input type="text" name="content" value="${dto.content}">
						</td>
					</tr>
				</table>
				
				<table class="table">
					<tr>
						<td>
							<button type="button" class="btn btnDisplay" onclick="sendOk();">${mode == "update" ? "메모 수정" : "메모 등록" }</button>
							<button type="reset" class="btn btnDisplay">내용 지우기</button>
							<c:if test="${mode == 'update' }">
								<input type="hidden" name="num" value="${dto.num}">
								<input type="hidden" name="page" value="${page}">
							</c:if>
						</td>
					</tr>
				</table>
				
			</form>
			
		</div>
	
	</div>

</body>
</html>