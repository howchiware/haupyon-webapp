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
* { margin: 0; padding: 0; box-sizing: border-box; 
 font-family: 'CookieRun-Regular', sans-serif;}

@font-face {
    font-family: 'CookieRun-Regular';
    src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/CookieRun-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}




.container {
	width: 700px;
	height: 500px;
	border: 1px solid black;
	border-radius: 20px;
	margin: 30px auto;
	position: relative;
}

.table-date {
	
}

.table-list tbody {
	border: 1px solid red;
	padding: 10px 10px;
	margin: 10px 10px;
	
}

.back-btn {
	border-style: none;
	background: none;
	margin: 10px 10px;
}

.container .table .table-td {
	padding: 20px 20px; 
}

.table-bottom {
  position: absolute;
  bottom: 10px;
  left: 0;
  width: 100%;
  text-align: center;
}

.btnDisplay {
	background: white;
	font-size: 15px;
	border-radius: 15px;
	padding: 5px 5px;
}
/* 
.content {
	width: 660px;
}

.table-date {
	width: 430px;
} */
</style>

<script type="text/javascript">

function deleteOk() {
	if( confirm('메모를 삭제하시겠습니까?')) {
		let params = 'num=${dto.num}&${query}';
		let url = '${pageContext.request.contextPath}/memo/delete.do';
		
		url += '?' + params;
		location.href = url;
	}
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
							<button type="button" class="btn back-btn" onclick="location.href='${pageContext.request.contextPath}/memo/list.do';">◀</button>
						</td>
						<td class="table-date">
							${dto.reg_date}
						</td>
					</tr>
					<tr>
						<td class="table-td">목표일자:
							${dto.memo_date}
						</td>
					</tr>					
					<tr>
						<td class="table-td content">
							${dto.content}
						</td>
					</tr>
				</table>
				
				<table class="table table-bottom">
					<tr>
						<td>
							<button type="button" class="btn btnDisplay" onclick="location.href='${pageContext.request.contextPath}/memo/update.do?num=${dto.num}&page=${page}';">메모 수정</button>
							<button type="button" class="btn btnDisplay" onclick="deleteOk();">삭제</button>
						</td>
					</tr>
				</table>
				
			</form>
			
		</div>
	
	</div>


</body>
</html>