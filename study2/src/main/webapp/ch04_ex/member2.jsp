<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.7.2/css/all.css">
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
.body-container { width: 700px; margin: 30px auto 10px; }

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

.member-form .input-session { margin-bottom: 15px; }
.member-form .input-title { font-size: 13px; color: #212121; line-height: 180%; }
.member-form .input-title { font-size: 14px; color: #212121; }

.member-form .input-box { border: 1px solid #212529; padding: 10px 10px; clear: both; }
.member-form .input-box p { padding: 3px 0; }
.member-form .input-box label { display:inline-block; width: 110px; }
.member-form .input-box span{ display: inline-block; }

.member-form .member-confirm { line-height: 150%; text-align: center; }

.member-form input[type=text]:focus, .member-form input[type=date]:focus, .member-form input[type=password]:focus {
	border: 1px solid #222; }

.schoolRemoveBtn, .licenseRemoveBtn {
	width: 40px; text-align: center; cursor: pointer; display: inline-block; }
.disabled-btn {
    pointer-events: none;
    opacity: 0.5;
    cursor: not-allowed;
}
</style>

<script type="text/javascript">
window.addEventListener('DOMContentLoaded', ev => {
	// document.querySelector('span.schoolRemoveBtn').style.display = 'none';
	// document.querySelector('span.licenseRemoveBtn').style.display = 'none';
	document.querySelector('span.schoolRemoveBtn').classList.add('disabled-btn');
	document.querySelector('span.licenseRemoveBtn').classList.add('disabled-btn');
	
	const schoolAddBtnEL = document.querySelector('.schoolAddBtn');
	
	schoolAddBtnEL.addEventListener('click', ev => {
		// document.querySelectorAll('span.schoolRemoveBtn').forEach( item => item.style.display = '' )
		document.querySelectorAll('span.schoolRemoveBtn').forEach( item => item.classList.remove('disabled-btn') )
		
		const divEL = ev.target.closest('.input-box').firstElementChild;
		const pNode = divEL.querySelector(':first-child').cloneNode(true);
		
		pNode.querySelectorAll('input').forEach( item => item.value = '' );
		divEL.appendChild(pNode);
	});
	
	document.querySelector('div.education-input').addEventListener('click', ev => {
		// console.log(ev.target); // <i> 태그
		
		if(ev.target.parentElement.matches(".schoolRemoveBtn")) {
			const divEL = ev.target.closest('div');
			if( divEL.querySelectorAll('p').length <= 1) {
				return;
			}
			
			ev.target.closest('p').remove();
			
			if( divEL.querySelectorAll('p').length <= 1) {
				document.querySelector('span.schoolRemoveBtn').classList.add('disabled-btn');
			}
		}
	});
	
});

window.addEventListener('DOMContentLoaded', ev => {
	const licenseAddBtnEL = document.querySelector('.licenseAddBtn');
	
	licenseAddBtnEL.addEventListener('click', ev => {
		// document.querySelectorAll('span.licenseRemoveBtn').forEach( item => item.style.display = '' )
		document.querySelectorAll('span.licenseRemoveBtn').forEach( item => item.classList.remove('disabled-btn') )
		
		const divEL = ev.target.closest('.input-box').firstElementChild;
		const pNode = divEL.querySelector(':first-child').cloneNode(true);
		
		pNode.querySelectorAll('input').forEach( item => item.value = '' );
		divEL.appendChild(pNode);
	});
	
	document.querySelector('div.license-input').addEventListener('click', ev => {
		
		if(ev.target.parentElement.matches(".licenseRemoveBtn")) {
			const divEL = ev.target.closest('div');
			if( divEL.querySelectorAll('p').length <= 1) {
				return;
			}
			
			ev.target.closest('p').remove();
			
			if( divEL.querySelectorAll('p').length <= 1) {
				document.querySelector('span.licenseRemoveBtn').classList.add('disabled-btn');
			}
		}
	});	
});

window.addEventListener('DOMContentLoaded', () => {
	const el = document.querySelector('form input[type=date]');
	el.addEventListener('keydown', e => e.preventDefault());
});
</script>

</head>
<body>

<div class="body-container">
    <div class="body-title">
        <h3><i class="fa-solid fa-user-plus"></i> 회원가입 </h3>
    </div>

    <div>
        <form name="memberForm" method="post">
            <div class="member-form">
            
                <div class="input-session basic-input">
                    <div class="input-title"><h4>기본 입력 사항</h4></div>
                    <div class="input-box">
                        <p>
                            <label>아이디 </label>
                            <input type="text" name="userId" class="form-control" style="width: 82%;" placeholder="아이디 입력">
                        </p> 
        
                        <p>
                            <label>패스워드 </label>
                            <input type="password" name="userPwd" class="form-control" style="width: 82%;" autoComplete="off" placeholder="패스워드 입력">
                        </p> 

                        <p>
                            <label>이름 </label>
                            <input type="text" name="userName" class="form-control" style="width: 82%;" placeholder="이름 입력">
                        </p> 
                    </div>
                </div>

                <div class="input-session education-input">
                    <div class="input-title"><h4>학력 사항</h4></div>
                    <div class="input-box">
                        <div>
                            <p>
                                 <input type="text" name="schoolName" class="form-control" style="width: 27%;"
                                    placeholder="학교명을 입력하세요">
                                 <input type="date" name="schoolDate1" class="form-control" style="width: 27%;"
                                    placeholder="입학날짜를 입력하세요"> ~ 
                                 <input type="date" name="schoolDate2" class="form-control" style="width: 27%;"
                                    placeholder="졸업날짜를 입력하세요">
                                 <span class="schoolRemoveBtn" style="float: right;"><i class="far fa-minus-square"></i></span>
                            </p>
                        </div>
                        <div style="text-align: center; margin-top: 10px;">
                             <button type="button" class="btn schoolAddBtn">추가</button>
                        </div>
                    </div>
                </div>
         
                <div class="input-session license-input">
                    <div class="input-title"><h4>자격증</h4></div>
                    <div class="input-box">
                        <div>
                            <p>
                                <input type="text" name="licenseName" class="form-control" style="width: 27%;"
                                   placeholder="자격증명을 입력하세요">
                                <input type="date" name="licenseDate" class="form-control" style="width: 27%;"
                                   placeholder="자격증취득날짜를 입력하세요">
                                 <span class="licenseRemoveBtn" style="float: right;"><i class="far fa-minus-square"></i></span>
                            </p>
                        </div>
                        <div style="text-align: center; margin-top: 10px;">
                             <button type="button" class="btn licenseAddBtn">추가</button>
                        </div>
                    </div>
                </div>

                <div class="member-confirm">
                    <button type="button" class="btn" onclick="sendOk();"> 회원가입 </button>
                    <button type="reset" class="btn"> 다시입력 </button>
                    <button type="button" class="btn"> 가입취소 </button>
                </div>

            </div>
        </form>
    </div>  
</div>

<script type="text/javascript">
function sendOk() {
	const f = document.memberForm;
	
	/*
	if( ! /^[a-zA-Z]\w{4,9}$/.test(f.userId.value) ) {
		alert("아이디는 영문자로 시작하며, 5~10자이내의 영숫자로 구성합니다.")
		f.userId.focus();
		return;
	}
	
	if( ! /^(?=.*[a-z])(?=.*[!@#$%^&*-=+]|.*[0-9]).{5,10}$/i.test(f.userPwd.value) ) {
		alert("패스워드는 5~10자이내로 영문자와 숫자 또는 특수문자로 구성합니다.")
		f.userPwd.focus();
		return;
	}
	
	if( ! /^[가-힣]{2,5}$/.test(f.userName.value)) {
		alert("이름을 입력하세요");
		f.userName.focus();
		return;
	}
	*/
	
	let inputELS, inputDate1ELS, inputDate2ELS;
	
	inputELS = document.querySelectorAll('form input[name=schoolName]');
	for(let el of inputELS) {
		if( ! el.value.trim() ) {
			alert('학교명은 필수 입니다.');
			el.focus();
			return;
		}
	}
	
	inputDate1ELS = document.querySelectorAll('form input[name=schoolDate1]');
	inputDate2ELS = document.querySelectorAll('form input[name=schoolDate2]');
	
	for(let i = 0; i < inputDate1ELS.length; i++)  {
		if( ! inputDate1ELS[i].value || ! inputDate2ELS[i].value ) {
			alert('날짜 입력은 필수 입니다.');
			inputDate1ELS[i].focus();
			return;
		}
		
		if( (new Date(inputDate1ELS[i].value)).getTime() >= (new Date(inputDate2ELS[i].value)).getTime() ) {
			alert('시작 날짜는 종료날짜 보다 같거나 클수 없습니다.');
			inputDate1ELS[i].focus();
			return;
		}
	}
	
	inputELS = document.querySelectorAll('form input[name=licenseName]');
	inputDate1ELS = document.querySelectorAll('form input[name=licenseDate]');
	for(let i = inputELS.length -1 ; i >= 0; i--)  {
		let licenseName = inputELS[i].value.trim();
		let licenseDate = inputDate1ELS[i].value;
		
		if( (licenseName && ! licenseDate) || ( ! licenseName && licenseDate)) {
			alert('자격증명 또는 취득 날짜를 입력 하지 않았습니다. ');
			inputELS[i].focus();
			return;
		}
		
		if( ! licenseName && ! licenseDate ) {
			inputELS[i].closest('p').remove();
		}
	}

	f.action = 'member2_ok.jsp';	
	f.submit();
}
</script>


</body>
</html>
