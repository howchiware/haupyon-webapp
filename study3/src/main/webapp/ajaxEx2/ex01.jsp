<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>

	<h3>jquery AJAX: GET - $(selector).load(url)</h3>
	
	<form name="calcForm">
		<p>
			<input type="text" name="num1" id="num1" placeholder="Number">
			<select name="oper" id="oper">
				<option value="+">덧셈</option>
				<option value="-">뺼셈</option>
				<option value="*">곱셈</option>
				<option value="/">나눗셈</option>
			</select>
			<input type="text" name="num2" id="num2" placeholder="Number">
			<button type="button" class="btnOk">확인</button>
		</p>
	</form>
	
	<div id="resultLayout"></div>
	
	<script type="text/javascript">
	$(function() {
		$('.btnOk').click(function() {
			/*
			let n1 = $('#num1').val();
			let n2 = $('#num2').val();
			let op = $('#oper').val();
			
			let params = 'num1=' + n1 + '&num2=' + n2 + '&oper=' + encodeURIComponent(op);
			let url = 'ex01_ok.jsp?' + params;
			*/
			
			let params = $('form[name=calcForm]').serialize();
			let url = 'ex01_ok.jsp?' + params;
			
			// AJAX-GET
			$('#resultLayout').load(url);
		});
	})
	</script>

</body>
</html>