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

	<h3>jquery AJAX: GET - $.get()</h3>
	
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
			
			let n1 = $('#num1').val();
			let n2 = $('#num2').val();
			let op = $('#oper').val();
			
			let url = 'ex02_ok.jsp';
			
			/* 첫번째 방법
			//
			let params = 'num1=' + n1 + '&num2=' + n2 + '&oper=' + encodeURIComponent(op);	
			// let params = $('form[name=calcForm]').serialize(); // 보낼 객체가 많으면 이 방법이 편하긴 하다
			
			$.get(url, params, function(data) { // $.get(주소, 파라미터, 성공했을 때 던져주는 데이터 값)
				$('#resultLayout').html(data);
			});
			*/
			
			/* 두번째 방법 */
			// 파라미터를 객체({})로 전송하는 경우 encodeURIComponent()로 파라미터를 인코딩하면 안된다
			$.get(url, {num1:n1, num2:n2, oper:op}, function(data) {  // {}는 객체 // num1은 n1이 가지고 있다는 의미
				$('#resultLayout').html(data);
			});
		});
	})
	</script>

</body>
</html>