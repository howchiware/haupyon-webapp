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

.form-table th, .form-table td { padding: 5px 0; }
.form-table select { width:130px; height:120px; }
.form-table button { display:block; width:80px; }
.form-table textarea { height:60px; width: 98%; }

.left { text-align: left; padding-left: 7px; }
.center { text-align: center; }
.right { text-align: right; padding-right: 7px; }
</style>

<script type="text/javascript">
function itemAdd() {
	const f = document.noteForm;
	const item = f.itemLeft;
	
	item[item.length] = new Option("김자바", "kim"); // text, value
	item[item.length] = new Option("스프링", "spring"); 
	item[item.length] = new Option("서블릿", "servlet"); 
	item[item.length] = new Option("오라클", "oracle"); 
	item[item.length] = new Option("이자바", "lee"); 
	item[item.length] = new Option("홍자바", "hong"); 
	item[item.length] = new Option("나대한", "na"); 
}

// window.onload = () => itemAdd();
window.addEventListener('DOMContentLoaded', () => itemAdd());


const itemMove = pos => {
	const f = document.noteForm;
	
	let source, target;
	
	// source 에 있는 것만 target 으로 보내면 된다
	if(pos === 'left') { 		// right -> left 로 이동
		source = f.itemRight;
		target = f.itemLeft;
	} else { 					// left -> right 로 이동
		source = f.itemLeft;
		target = f.itemRight;
	}
	
	// '김자바'가 넘어가면 '이자바'의 인덱스가 0이 되는데 반복문은 증가하여서 문제가 발생..
	let len = source.length;
	for(let i = 0; i < len; i++ ) {
		if(source.options[i].selected) {
			// target.appendChild(source.options[i]); // appendChild(): target의 자식.. 배우지 않은 것
			target[target.length] = new Option(source.options[i].text, source.options[i].value); // target.length 처음에는 0. text와 value
			source[i] = null; // null은 지우기
			i--;
			len--;
		}
	}	
}


const itemAllMove = pos => {
	
	const f = document.noteForm;
	
	let source, target;
	
	if(pos === 'left') { 	
		source = f.itemRight;
		target = f.itemLeft;
	} else { 					
		source = f.itemLeft;
		target = f.itemRight;
	}

	let len = source.length;
	for(let i = 0; i < len; i++ ) {
			target.appendChild(source.options[0]); // 0번째 보냈음.. 다음 요소는 0번째가 됨... 반복이 된다
												// for..of 사용할 수 없다
	}
	
	
	// selectbox는 선택된 것만 서버로 전송이 된다. 

}

function sendOk() {
	const f = document.noteForm;
	
	if(f.itemRight.length === 0) {
		alert('받는 사람을 먼저 추가해주세요☠️');
		f.itemRight.focus();
		return;
	}
	
	if( ! f.msg.value.trim() ) {
		alert('메시지를 입력하세요');
		f.msg.focus();
		return;
	}
	
	// select 요소를 서버로 전송하기 위해서는 모든 항목을 선택해야 한다
	for(let el of f.itemRight) {
		el.selected = true;
	}
	
	f.action = 'note_ok.jsp';
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
	<table class="table form-table">
		<tr>
		    <td width="150"><span>친구목록</span></td>
		    <td width="100">&nbsp;</td>
		    <td width="150"><span>받는사람</span></td>
		</tr>
		
		<tr>
		    <td class="left">
		        <select name="itemLeft" multiple class="form-select" style="width:130px; height:120px;"></select>
		    </td>
		    <td class="center">
			    <button type="button" class="btn"  style="display:block; width:80px;" onclick="itemMove('right')"> &gt; </button>
			    <button type="button" class="btn"  style="display:block;width:80px;" onclick="itemAllMove('right')"> &gt;&gt; </button>
			    <button type="button" class="btn"  style="display:block;width:80px;" onclick="itemMove('left')"> &lt; </button>
			    <button type="button" class="btn"  style="display:block;width:80px;" onclick="itemAllMove('left')"> &lt;&lt; </button>
		    </td>
		    <td class="left">
		        <select name="itemRight" multiple class="form-select" style="width:130px; height:120px;">
		        </select>
		    </td>
		</tr>
		<tr>
		    <td colspan="3">
		       <span>메시지</span>
		    </td>
		</tr>
		<tr>
		    <td colspan="3" class="left">
		        <textarea name="msg" class="form-control" style="height:60px; width: 98%;"></textarea>
		    </td>
		</tr>
	</table>
	
	<table class="table">
		<tr>
		    <td class="right">
		        <button type="button" class="btn" onclick="sendOk();"> 쪽지보내기 </button>
		    </td>
		</tr>
	</table>
	</form> 

</div>









</body>
</html>