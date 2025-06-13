<%@ page contentType="text/html; charset=UTF-8"%>
 
<%-- <%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String text = request.getParameter("text");
%>  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<style type="text/css">


</style>




</head>
<body>


	<div class="container">
		<form name="questForm" action="quest.jsp" method="post">
			<table class="main-table">
				<tr>
					<th>작성자</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="text"></textarea></td>
				</tr>
			</table>
			<table class="main-btn">
				<tr>
					<td><button type="button" onclick="addGuests();">등록하기</button></td>
					<td><button type="reset">다시입력</button></td>
				</tr>
			</table>
		</form>
	</div>
	
	
	<div class="sub-container">
		<form name="book" action="quest.jsp" method="post">
			<table class="guestbook">
				<tr>
					<td id="guestName"></td>
					<td id="guestTime">날짜시간</td>
					<td id="guestDelete">|삭제</td>
				</tr>
				<tr>
					<td colspan="3" id="guestArea"></td>
				</tr>
			</table>
		</form>
	</div>


<script type="text/javascript">

	const guestbookEL = document.querySelector('.sub-container');
	guestbookEL.style.display = 'none';
	

	const nameEL = document.querySelector('input[name=name]').value;
	const textEL = document.querySelector('textarea[name=text]').value;

	
	function addGuests() {
		const guestbookEL = document.querySelector('.sub-container');
		
		const nameEL = document.querySelector('input[name=name]').value;
		const textEL = document.querySelector('textarea[name=text]').value;
		
		document.getElementById('guestName').textContent = nameEL;
		document.getElementById('guestArea').textContent = textEL;

		document.querySelector('input[name=name]').value;

		guestbookEL.style.display = 'block';
	}
	
	

	
</script>
</body>
</html>