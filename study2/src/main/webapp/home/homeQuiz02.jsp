<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaScript 퀴즈 - 방명록 기능 구현</title>
<style>
body {
    font-family: "맑은 고딕", sans-serif;
    background-color: #f4f4f4;
    padding: 30px;
}
.container {
    max-width: 700px;
    margin: auto;
    background: white;
    border-radius: 10px;
    padding: 30px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}
h1 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 20px;
}
.form-group {
    display: flex;
    gap: 10px;
    margin-bottom: 20px;
}
input[type="text"] {
    flex: 1;
    padding: 10px;
    font-size: 14px;
    border: 2px solid #ddd;
    border-radius: 5px;
}
button {
    padding: 10px 15px;
    font-size: 14px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
.btn-add {
    background-color: #3498db;
    color: white;
}
.btn-add:hover {
    background-color: #2980b9;
}
.btn-delete {
    background-color: #e74c3c;
    color: white;
    font-size: 12px;
    padding: 5px 10px;
    border-radius: 3px;
    margin-left: 10px;
}
.guestbook {
    border-top: 2px solid #3498db;
    padding-top: 20px;
}
.entry {
    padding: 12px;
    background: #f9f9f9;
    border-left: 5px solid #3498db;
    border-radius: 5px;
    margin-bottom: 10px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.entry span {
    flex: 1;
}
.quiz-task {
    background: #fff3cd;
    border: 1px solid #ffeaa7;
    border-radius: 8px;
    padding: 15px;
    margin-top: 30px;
}
</style>
</head>
<body>

<div class="container">
    <h1>📘 방명록</h1>
    <div class="form-group">
        <input type="text" id="nameInput" placeholder="이름을 입력하세요">
        <button type="button" id="addBtn" class="btn-add">등록</button>
    </div>

    <div id="guestbook" class="guestbook">
        <div class="entry">
            <span>김하은님, 환영합니다!</span>
            <button class="btn-delete">삭제</button>
        </div>
        <div class="entry">
            <span>이준서님, 반갑습니다!</span>
            <button class="btn-delete">삭제</button>
        </div>
    </div>

    <div class="quiz-task">
        <h3>🎯 구현할 기능</h3>
        <ul>
            <li><strong>등록 기능:</strong> 이름 입력 후 "등록" 버튼을 누르면 새로운 방명록 항목이 추가되어야 합니다.</li>
            <li><strong>삭제 기능:</strong> 각 항목의 "삭제" 버튼을 누르면 해당 항목이 삭제되어야 합니다.</li>
            <li><strong>입력 검증:</strong> 빈 입력은 등록되지 않도록 하세요.</li>
            <li><strong>입력창 초기화:</strong> 등록 후 입력창은 자동으로 비워져야 합니다.</li>
        </ul>
        <p><strong>💡 힌트:</strong> createElement, innerText, appendChild, remove, trim 등을 활용하세요.</p>
    </div>
</div>

<script>
// 여기에 JavaScript 코드를 작성하세요!

const nameInputEL = document.getElementById('nameInput');
const addBtnEL = document.getElementById('addBtn');
const guestbookEL = document.getElementById('guestbook');
addBtnEL.addEventListener('click', () => {
	
	if(! nameInputEL.value.trim()) {
		alert('이름을 입력하세요');
		nameInputEL.focus();
		return;
	}
	
	const newGuest = document.createElement('div');
	newGuest.className = 'entry';
	newGuest.innerHTML = '<span>' + nameInputEL.value + '님, 반갑습니다!</span>  <button class="btn-delete">삭제</button>';
	
	guestbookEL.appendChild(newGuest);
	
	nameInputEL.value= '';
	
});




guestbookEL.addEventListener('click', function(ev) {
	
	if(ev.target.classList.contains('btn-delete')) {
		if(confirm('삭제하시겠습니까?')) {
			const todoItem = ev.target.closest('.entry');
			todoItem.remove();
		}
		
	}
	
});
	



</script>

</body>
</html>
