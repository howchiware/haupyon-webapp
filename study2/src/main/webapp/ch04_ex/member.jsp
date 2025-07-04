<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>spring</title>
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
.body-container { width: 770px; margin: 30px auto 10px; }

.body-title {
    margin: 0 0 25px 0;
    padding-top: 25px; padding-bottom: 5px;
    color: #424951;
    border-bottom: 1px solid #ddd;
}
.body-title h3 {
    min-width: 300px;
    margin: 0 0 -5px 0;
    padding-bottom: 5px;
    font-size: 23px;
    font-family:"Malgun Gothic", "맑은 고딕", NanumGothic, 나눔고딕, 돋움, sans-serif;
    font-weight: bold;
    display: inline-block;
    border-bottom: 3px solid #424951;
}

.table-form td { padding: 7px 0; }
.table-form tr:first-child { border-top: 2px solid #212529;  }
.table-form tr td:first-child { background: #f8f8f8; text-align: center; width: 130px; font-weight: 500; }
.table-form tr td:nth-child(2) { text-align: left; padding-left: 10px; }

.table-form input[type=text]:focus, .table-form input[type=date]:focus, .table-form input[type=password]:focus {
	border: 1px solid #222; }

.help-block, .block { margin-top: 5px; }
.help-block { display: none; }
.msg-box { text-align: center; color: blue; }
</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.7.2/css/all.css">

<script type="text/javascript">
function isValidDate(date) {
	if(date.length !== 8 && date.length !== 10) return false;
	
	let p = /(\.)|(\-)|(\/)/g;
	date = date.replace(p, "");
	
	let format = /^[12][0-9]{7}$/;
	if(! format.test(date) ) return false;
	
	let y = parseInt( date.substring(0,4) );
	let m = parseInt( date.substring(4,6) );
	let d = parseInt( date.substring(6) );
	
	if(m<1 || m>12) return false;
	
	let lastDay = (new Date(y,m,0)).getDate();
	if(d<1 || d>lastDay) return false;
	
	return true;
}

function memberOk() {
	const f = document.memberForm;
	let s;
	
	if( ! /^[a-zA-Z]\w{4,9}$/.test(f.userId.value) ) {
		alert('아이디는 영문자로 시작하며, 5~10자이내의 영숫자로 구성합니다.')
		f.userId.focus();
		return;
	}
	
	s = f.userPwd.value;
	if( ! /^(?=.*[a-z])(?=.*[!@#$%^&*-=+]|.*[0-9]).{5,10}$/i.test(s) ) {
		alert('패스워드는 5~10자이내로 영문자와 숫자 또는 특수문자로 구성합니다.')
		f.userPwd.focus();
		return;
	}
	
	if( s !== f.userPwd2.value ) {
		alert('패스워드가 일치하지 않습니다.');
		f.userPwd.focus();
		return;
	}

	// 이름은 한글 2~5자 이내
	s = f.userName.value;
	// if( !/^[가-힣]{2,5}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/.test(s)) {
	if( ! /^[가-힣]{2,5}$/.test(s)) {
		alert('이름을 입력하세요');
		f.userName.focus();
		return;
	}
	
	// 생년월일
	if( ! isValidDate(f.birth.value) ) {
		alert('생년월일을 입력하세요');
		f.birth.focus();
		return;
	}
	
	if( ! f.email1.value.trim() ) {
		alert('이메일을 입력하세요');
		f.email1.focus();
		return;
	}
	
	if( ! f.email2.value.trim() ) {
		alert('이메일을 입력하세요');
		f.email2.focus();
		return;
	}
	
	if( ! f.tel1.value ) {
		alert('전화번호 입력하세요');
		f.tel1.focus();
		return;
	}

	if( ! /^\d{3,4}$/.test(f.tel2.value) ) {
		alert('전화번호 입력하세요');
		f.tel2.focus();
		return;
	}
	
	if(! /^\d{4}$/.test(f.tel3.value) ) {
		alert('전화번호 입력하세요');
		f.tel3.focus();
		return;
	}

	f.action = 'member_ok.jsp';
	f.submit();
}

function changeEmail() {
	const f = document.memberForm;
	let s = f.selectEmail.value;
	
	if(s === 'direct') {
		f.email2.value = '';
		f.email2.readOnly = false;
		f.email1.focus();
	} else {
		f.email2.value = s;
		f.email2.readOnly = true;
		f.email1.focus();
	}
}

window.addEventListener('DOMContentLoaded', function(){
	// const inputs = document.memberForm.getElementsByTagName('input');
	const inputs = document.memberForm.querySelectorAll('input');
	
	for(let i=0; i<inputs.length; i++) {
		inputs[i].addEventListener('focus', function () {
			// const box = this.parentElement.getElementsByClassName('help-block')[0];
			const box = this.parentElement.querySelector('.help-block');
			if(box) box.style.display = 'inline-block';
		});
		
		inputs[i].addEventListener('blur', function () {
			// const box = this.parentElement.getElementsByClassName('help-block')[0];
			const box = this.parentElement.querySelector('.help-block');
			if(box) box.style.display = 'none';
		});
	}
});

window.addEventListener('DOMContentLoaded', () => {
	const el = document.querySelector('form input[name=birth]');
	el.addEventListener('keydown', e => e.preventDefault());
});
</script>

</head>
<body>

<div class="body-container">
	<div class="body-title">
	   <h3><i class="fa-solid fa-user-plus"></i> 회원 가입</h3>
	</div>
	
	<form name="memberForm" method="post">
		<div style="padding: 10px 0;">
			<span>* 표가 표시된 부분은 필수 입력사항 입니다.</span>
		</div>
		
		<table class="table table-border table-form">
			<tr>
				<td>아&nbsp;이&nbsp;디 *</td>
				<td>
					<input type="text" name="userId" id="userId" maxlength="10" class="form-control" style="width: 50%;">
					<span id="userIdState" style='display:none;'></span>
					<span class="help-block">아이디는 5~10자 이내 입니다.</span>
				</td>
			</tr>

			<tr>
				<td>패스워드 *</td>
				<td>
					<input type="password" name="userPwd" maxlength="10" class="form-control" autocomplete="off" style="width: 50%;">
					<span class="help-block">패스워드는 5~10자이내 입니다.</span>
				</td>
			</tr>

			<tr>
				<td>패스워드 확인 *</td>
				<td>
					<input type="password" name="userPwd2" class="form-control" maxlength="10" autocomplete="off" style="width: 50%;">
				</td>
			</tr>

			<tr>
				<td>이&nbsp;&nbsp;&nbsp;&nbsp;름 *</td>
				<td>
					<input type="text" name="userName" maxlength="20" class="form-control" style="width: 50%;">
				</td>
			</tr>

			<tr>
				<td>생년월일 *</td>
				<td>
					<input type="date" name="birth" class="form-control" style="width: 50%;">
					<span class="help-block">생년월일은 2000-10-10 형식으로 입력 합니다.</span>
				</td>
			</tr>

			<tr>
				<td>이 메 일 *</td>
				<td>
					<select name="selectEmail" class="form-select" onchange="changeEmail();">
						<option value="">선 택</option>
						<option value="naver.com">네이버 메일</option>
						<option value="gmail.com">지 메일</option>
						<option value="hanmail.net">한 메일</option>
						<option value="outlook.com">마이크로소프트</option>
						<option value="icloud.com">애플</option>
						<option value="direct">직접입력</option>
					</select>
					<input type="text" name="email1" maxlength="30" class="form-control" style="width: 33%;"> @ 
					<input type="text" name="email2" maxlength="30" class="form-control" style="width: 33%;" readonly>
				</td>
			</tr>

			<tr>
				<td>전화번호 *</td>
				<td>
					<select name="tel1" class="form-select">
						<option value="">선 택</option>
						<option value="010">010</option>
						<option value="02">02</option>
						<option value="031">031</option>
						<option value="032">032</option>
						<option value="033">033</option>
						<option value="041">041</option>
						<option value="042">042</option>
						<option value="043">043</option>
						<option value="044">044</option>
						<option value="051">051</option>
						<option value="052">052</option>
						<option value="053">053</option>
						<option value="054">054</option>
						<option value="055">055</option>
						<option value="061">061</option>
						<option value="062">062</option>
						<option value="063">063</option>
						<option value="064">064</option>
						<option value="070">070</option>
					</select>
					<input type="text" name="tel2" maxlength="4" class="form-control" style="width: 33%;"> -
					<input type="text" name="tel3" maxlength="4" class="form-control" style="width: 33%;">
				</td>
			</tr>

			<tr>
				<td>우편번호</td>
				<td>
					<input type="text" name="zip" id="zip" maxlength="7" class="form-control" style="width: 50%;" readonly>
					<button type="button" class="btn" onclick="daumPostcode();">우편번호검색</button>
				</td>
			</tr>

			<tr>
				<td valign="top" style="padding-top: 10px;">주&nbsp;&nbsp;&nbsp;&nbsp;소</td>
				<td>
					<label style="display: block;">
						<input type="text" name="addr1" id="addr1" maxlength="50" class="form-control" readonly style="width: 96%;">
					</label>
					<label style="display: block; margin-top: 5px;">
						<input type="text" name="addr2" id="addr2" maxlength="50" class="form-control" style="width: 96%;">
					</label>
				</td>
			</tr>

			<tr>
				<td>직&nbsp;&nbsp;&nbsp;&nbsp;업</td>
				<td>
					<input type="text" name="job" maxlength="10" class="form-control" style="width: 50%;">
				</td>
			</tr>
		</table>

		<table class="table">
			<tr>
				<td align="center">
					<span>
						<input type="checkbox" name="terms" value="1" onchange="form.btnOk.disabled = !checked">
						약관에 동의하시겠습니까 ?
					</span>
					<span><a href="">약관보기</a></span>
				</td>
			</tr>
			
			<tr>
				<td align="center">
					<button type="button" class="btn" name="btnOk" id="btnOk" disabled onclick="memberOk();"> 회원가입 </button>
					<button type="reset" class="btn"> 다시입력 </button>
					<button type="button" class="btn"> 가입취소 </button>
				</td>
			</tr>
			
			<tr >
				<td align="center">
					<span class="msg-box"></span>
				</td>
			</tr>
		</table>
	</form>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
</script>

</body>
</html>