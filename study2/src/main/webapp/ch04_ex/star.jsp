<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
* { margin: 0; padding: 0; box-sizing: border-box; }
*, *::after, *::before { box-sizing: border-box; }

body { font-size: 14px; font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif; }

a { color: #000; text-decoration: none; cursor: pointer; }
a:active, a:hover { text-decoration: underline; color: #F28011; }

.btn {
	padding: 5px 10px;
	font-size: 14px; font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	color: #333; font-weight: 500;
	border: 1px solid #999; border-radius: 4px;
	background-color: #fff;
	cursor:pointer;
	vertical-align: baseline;
}
.btn:active, .btn:focus, .btn:hover {
	color:#333;
	background-color: #f8f9fa;
}
.btn[disabled], fieldset[disabled] .btn {
	pointer-events: none;
	cursor: default;
	opacity: .65;
}

.form-control {
	padding: 5px 5px; 
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	border: 1px solid #999; border-radius: 4px; background-color: #fff;
	vertical-align: baseline;
}
.form-control[readonly] { background-color:#f8f9fa; }

textarea.form-control { height: 170px; resize : none; }

.form-select {
	padding: 4px 5px; 
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	border: 1px solid #999; border-radius: 4px; background-color: #fff;
	vertical-align: baseline;
}
.form-select[readonly] { background-color:#f8f9fa; }

textarea:focus, input:focus { outline: none; }
input[type=checkbox], input[type=radio] { vertical-align: middle; }

.star-bundle {
	display: grid;
	width: 190px;
	grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
	grid-auto-rows: 40px;
	justify-content: center;
	align-items: center;
	text-align: center;
	font-size: 30px;
}

.rate:hover {
	cursor: pointer;
	scale: 108%;
}
.rate {
	color: #95D9F1;
}

</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.7.2/css/all.css">

<script type="text/javascript">
window.addEventListener('DOMContentLoaded', function(){
	const STAR_COLOR_DEFAULT = '#95D9F1';
	const STAR_COLOR_HOVER = '#63BDE6';
	
	const starBundle = document.querySelector('.star-bundle');
	const stars = document.querySelectorAll('.star-bundle i');
	const ratingInput = document.querySelector('input#rating');	
    
	starBundle.addEventListener('mousemove', handleMouseMove);
	starBundle.addEventListener('mouseleave', handleMouseLeave);
		// mouseleave : 마우스가 특정 HTML 요소를 벗어날 때 발생
		//   자식 요소에 들어갔다 나와도 다시 발생하지 않음 (오직 부모만 감지)
	starBundle.addEventListener('click', handleClick);
    
	let currentRating = 0;
 	
	function handleMouseMove(ev) {
		const starWidth = stars[0].offsetWidth;
		const x = ev.clientX - starBundle.getBoundingClientRect().left;
		const starIndex = Math.floor(x / starWidth);
		const fraction = (x % starWidth) / starWidth;

		let rating = starIndex + (fraction > 0.5 ? 1 : 0.5);
		updateStars(rating); 		
	}
 	
	function handleMouseLeave(ev) {
		updateStars(currentRating);		
	}
 	
	function handleClick(ev) {
		const starWidth = stars[0].offsetWidth;
		// getBoundingClientRect() : 엘리먼트의 크기와 뷰포트에 상대적인 위치 정보를 제공하는 DOMRect 객체를 반환
		const x = ev.clientX - starBundle.getBoundingClientRect().left;
		const starIndex = Math.floor(x / starWidth);
		const fraction = (x % starWidth) / starWidth;

		currentRating = starIndex + (fraction > 0.5 ? 1 : 0.5);
		updateStars(currentRating);
		updateRatingInput(currentRating); 		
	}
 	
	function updateStars(rating) {
		stars.forEach((star, index) => {
			if (index + 0.5 < rating) {
				star.className = 'fa-solid fa-star rate';
			} else if (index < rating) {
				star.className = 'fa-solid fa-star-half-stroke rate';
			} else {
			star.className = 'fa-regular fa-star rate';
			}
		});
	}

	function updateRatingInput(rating) {
		ratingInput.value = rating.toFixed(1); // 2째자리에서 반올림
			// toFixed() : 숫자를 지정한 소수점 자리까지 반올림하여 문자열로 반환
	}
});
</script>

</head>

<body>

<div style="margin: 20px auto; width: 500px;">
	<h2>간단한 별점</h2>
</div>

<div style="margin: 20px auto; width: 500px;">

  <div class="star-bundle">
    <i class="fa-regular fa-star rate"></i>
    <i class="fa-regular fa-star rate"></i>
    <i class="fa-regular fa-star rate"></i>
    <i class="fa-regular fa-star rate"></i>
    <i class="fa-regular fa-star rate"></i>
  </div>

  <div>
  	<form action="star_ok.jsp" method="post">
		<input type="hidden" name="rating" id="rating" value="0">
		<button type="submit" class="btn"> 확인 </button>
	</form>
  </div>
</div>


</body>
</html>