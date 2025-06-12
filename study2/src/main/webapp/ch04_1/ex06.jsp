<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<%--
		- form 태그 안에 <input type="text">가 하나만 존재하고 다른 <textarea>나 <input type="date"> 등 다른 input 입력 요소가 없는 경우에
		  <input type="text"> 에서 엔터를 치면 서버로 전송된다(submit 이벤트 발생)
		  
		- 서버로 전송하지 못하게 하는 방법
		  : required 추가
		  : <input type="text"> 를 하나 더 만들고 sytle="display:none;" 으로 설정
		  : submit 버튼을 사용하지 않는 경우
		    <form .. onsubmit="return false">
	 --%>

	<form name="searchForm" action="ex06_ok.jsp" method="post">
		<p>
			<select name="condition">
				<option value="all" >제목+내용</option>
				<option value="name" >이름</option>
				<option value="regDate" >등록일</option>
			</select>
			<input type="text" name="keyword" placeholder="검색값">
			<input type="text" style="display: none;">
			<button type="button" onclick="searchList();">검색</button>
		</p>
	</form>
	
	<script type="text/javascript">
	 function searchList() {
		const f = document.searchForm;
		
		if(! f.keyword.value.trim()) {
			alert('검색값을 입력하세요');
			f.keyword.focus();
			return;
		}
		f.submit();
	}
	</script>

</body>
</html>