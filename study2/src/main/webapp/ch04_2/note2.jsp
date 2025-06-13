<%@ page contentType="text/html; charset=UTF-8"%>
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

/* container */
.container { width: 400px; margin: 30px auto; }
.title { width:100%; font-size: 16px; font-weight: bold; padding: 13px 0; }

.note-sub-title, .note-friend-list { display: flex; gap: 3px; }
.note-sub-title label { font-weight: 600; }
.item-title { 
	width: 150px; height: 30px;
	display: flex;
	align-items: center; /* 주축(수직) 가운데 */
}
.item-gap { width: 100px; }

.item-left-list, .item-right-list {
	width: 150px; height: 130px;
	overflow-y: scroll; 
	border: 1px solid #ced4da; list-style: none; }
.item-left-list li, .item-right-list li {
	padding: 2px 7px;
}
.item-left-list li label, .item-right-list label {
	padding-left: 3px;
}
.item-btn {
	width: 100px;
	display: flex; flex-direction:column;
	align-items: center; /* 주축 가운데, 주축이 열이므로 수평 가운데 */
	justify-content: center; }

.item-btn button { display:block; width:80px; }

.note-message { padding-top: 10px; }
.note-message textarea { height:60px; width: 100%; }

</style>

<script type="text/javascript">
function itemAdd() {
	const itemLeft = document.querySelector('.item-left-list');
	let htmlText;
	
	htmlText = '<li><input type="checkbox" name="userId" value="kim"><label>김자바</label></li>';
	itemLeft.insertAdjacentHTML('beforeend', htmlText);
	htmlText = '<li><input type="checkbox" name="userId" value="spring"><label>스프링</label></li>';;
	itemLeft.insertAdjacentHTML('beforeend', htmlText);
	htmlText = '<li><input type="checkbox" name="userId" value="servlet"><label>서블릿</label></li>';;
	itemLeft.insertAdjacentHTML('beforeend', htmlText);
	htmlText = '<li><input type="checkbox" name="userId" value="oracle"><label>오라클</label></li>';;
	itemLeft.insertAdjacentHTML('beforeend', htmlText);
	htmlText = '<li><input type="checkbox" name="userId" value="lee"><label>이자바</label></li>';;
	itemLeft.insertAdjacentHTML('beforeend', htmlText);
	htmlText = '<li><input type="checkbox" name="userId" value="hong"><label>홍자바</label></li>';;
	itemLeft.insertAdjacentHTML('beforeend', htmlText);
	htmlText = '<li><input type="checkbox" name="userId" value="na"><label>나대한</label></li>';;
	itemLeft.insertAdjacentHTML('beforeend', htmlText);
}

// window.onload = () => itemAdd();
window.addEventListener('DOMContentLoaded', () => itemAdd());

window.addEventListener('DOMContentLoaded', function(){
	const btns = document.querySelectorAll('.btn-move');
	for(let btn of btns) {
		btn.addEventListener('click', function(){
			itemMove(this); // e.target으로 작성해도 됨
		});
	}
});

//선택된 option을 좌 또는 우로 이동
const itemMove = btn => {
	const pos = btn.getAttribute('data-move');
	let source, target;
	
	if(pos === "left" || pos === "leftAll") { // right -> left
		source = document.querySelector('.item-right-list');
		target = document.querySelector('.item-left-list');
	} else { // left -> right
		source = document.querySelector('.item-left-list');
		target = document.querySelector('.item-right-list');
	}
	
	if(pos === "left" || pos === "right") {
		const chks = source.querySelectorAll('input[name=userId]:checked');
		for(let chk of chks) {
			let parentLI = chk.parentNode;
			target.appendChild(parentLI);
			
			chk.checked = false; // 선택된 항목 선택 해제
		}
	} else {
		const chks = source.querySelectorAll('input[name=userId]');
		for(let chk of chks) {
			let parentLI = chk.parentNode;
			target.appendChild(parentLI);
			
			chk.checked = false;
		}
	}
};

function sendOk() {
	const f = document.noteForm;
	
	const rightList = document.querySelectorAll('.item-right-list input[name=userId]');


	if(rightList.length === 0) {
		alert('받는 사람을 먼저 추가해주세요☠️');
		f.itemRight.focus();
		return;
	}
	
	if( ! f.msg.value.trim() ) {
		alert('메시지를 입력하세요');
		f.msg.focus();
		return;
	}
	

	for(let el of rightList) {
		el.checked = true;
	}
	

	f.action = 'note2_ok.jsp';
	f.submit();
}

</script>

</head>
<body>

<div class="container">

	<div class="title">
	   <h3><span>|</span> 쪽지 보내기</h3>
	</div>

	<form name="noteForm" method="post">
	<div>
		<div class="note-sub-title">
			<div class="item-title"><label>친구목록</label></div>
			<div class="item-gap"></div>
			<div class="item-title"><label>받는사람</label></div>
		</div>
		
		<div class="note-friend-list">
			<ul class="item-left-list"></ul>
			<div class="item-btn">
			    <button type="button" class="btn btn-move" data-move="right"> &gt; </button>
			    <button type="button" class="btn btn-move" data-move="rightAll"> &gt;&gt; </button>
			    <button type="button" class="btn btn-move" data-move="left"> &lt; </button>
			    <button type="button" class="btn btn-move" data-move="leftAll"> &lt;&lt; </button>
			</div>
			<ul class="item-right-list"></ul>
		</div>
		<div class="note-message">
			<div>
				<textarea name="msg" class="form-control"></textarea>
			</div>
			<div>
				<button type="button" class="btn" onclick="sendOk();"> 쪽지보내기 </button>
			</div>
		</div>
	</div>
	</form>

</div>

</body>
</html>