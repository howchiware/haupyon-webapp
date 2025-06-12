<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>form 데이터 전송 - submit 버튼 : 유효성 검사</h3>
	
	<!-- 
		- form 태그 안의 submit 버튼을 클릭하면 submit 이벤트가 발생
		- submit 버튼을 사용하는 유효성 검사는 form 태그의 submit 이벤트 핸들러(onsubmit)에서 한다
		- submit 이벤트 핸들러(onsubmit)에 return false를 반환하면 서버에 전송되지 않는다
		- 주의: submit 이벤트 핸들러 스크립트에 에러가 있어도 서버로 전송되므로 스크립트 에러 잡기가 어렵다
	 -->
	 
	<form name="frm" action="ex04_ok.jsp" method="post" onsubmit="return check2();">
		<p>이름 : <input type="text" name="name"> </p>
		<p>나이 : <input type="text" name="age"> </p>
		<p>
			<button type="submit">보내기</button>
			<button type="reset">초기화</button>
		</p>
	</form>
	
	<script type="text/javascript">
		function check2() {
			const f = document.frm;
			
			if(! f.name.value.trim()) {
				alert('이름~')
				f.name.focus();
				return false;
			}
			
			if(! /^\d{1,3}$/.test(f.age.value)) {
				alert('나이~')
				f.age.focus();
				return false;
			}
			
			return true;
		}
	</script>
	
	<hr>




	<form name="myForm" action="ex04_ok.jsp" method="post">
		<p>이름 : <input type="text" name="name"> </p>
		<p>나이 : <input type="text" name="age"> </p>
		<p>
			<button type="submit">보내기</button>
			<button type="reset">초기화</button>
		</p>
	</form>
	
	<script type="text/javascript">
		function check() {
			const f = document.myForm;
			
			if(! f.name.value.trim()) {
				f.name.focus();
				return false;
			}
			
			if(! /^\d{1,3}$/.test(f.age.value)) {
				f.age.focus();
				return false;
			}
			
			// 주의
			//  : submit 버튼에서 f.submit(); 처럼 form의 submit()을 호출하면 서버에 두 번 전송이 된다.
			
			return true;
			
		}
		
		window.addEventListener('load', () => {
			document.myForm.addEventListener('submit', e => {
				if(! check() ) { // 유효성 검사에서 문제가 있다면, 이벤트를 취소시킨다
					e.preventDefault();
				}
				
			});
		});
	
	</script>

</body>
</html>