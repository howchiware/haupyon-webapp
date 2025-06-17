<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JavaScript 퀴즈 - 할일 목록</title>
<style>
* { margin: 0; padding: 0; box-sizing: border-box; }

body {
    font-family: "맑은 고딕", sans-serif;
    background-color: #f5f5f5;
    padding: 20px;
}

.container {
    max-width: 600px;
    margin: 0 auto;
    background: white;
    border-radius: 10px;
    padding: 30px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.quiz-header {
    text-align: center;
    margin-bottom: 30px;
    padding-bottom: 15px;
    border-bottom: 2px solid #3498db;
}

.quiz-header h1 {
    color: #2c3e50;
    font-size: 24px;
}

.quiz-description {
    background: #e8f4fd;
    padding: 15px;
    border-radius: 8px;
    margin-bottom: 20px;
    border-left: 4px solid #3498db;
}

.todo-form {
    display: flex;
    gap: 10px;
    margin-bottom: 20px;
}

.todo-input {
    flex: 1;
    padding: 10px;
    border: 2px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
}

.todo-input:focus {
    outline: none;
    border-color: #3498db;
}

.btn {
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    transition: all 0.3s;
}

.btn-add {
    background: #27ae60;
    color: white;
}

.btn-add:hover {
    background: #219a52;
}

.btn-remove {
    background: #e74c3c;
    color: white;
    padding: 5px 10px;
    font-size: 12px;
}

.btn-remove:hover {
    background: #c0392b;
}

.todo-list {
    border: 2px solid #ecf0f1;
    border-radius: 8px;
    min-height: 200px;
    padding: 15px;
}

.todo-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 10px;
    margin-bottom: 8px;
    background: #f8f9fa;
    border-radius: 5px;
    border-left: 3px solid #3498db;
}

.todo-text {
    flex: 1;
    font-size: 14px;
    color: #2c3e50;
}

.quiz-task {
    background: #fff3cd;
    border: 1px solid #ffeaa7;
    border-radius: 8px;
    padding: 15px;
    margin-top: 20px;
}

.quiz-task h3 {
    color: #856404;
    margin-bottom: 10px;
}

.task-list {
    list-style: none;
    padding-left: 15px;
}

.task-list li {
    margin-bottom: 5px;
    position: relative;
}

.task-list li:before {
    content: "▸";
    color: #f39c12;
    position: absolute;
    left: -15px;
}
</style>
</head>
<body>

<div class="container">
    <div class="quiz-header">
        <h1>🎯 JavaScript 퀴즈</h1>
        <p>할일 목록(Todo List) 기능 완성하기</p>
    </div>

    <div class="quiz-description">
        <strong>📝 문제:</strong> 아래의 할일 목록에 JavaScript 기능을 추가해주세요!<br>
        현재는 HTML과 CSS만 있어서 버튼을 눌러도 아무 반응이 없습니다.
    </div>

    <div class="todo-form">
        <input type="text" id="todoInput" class="todo-input" placeholder="할일을 입력하세요...">
        <button type="button" id="addBtn" class="btn btn-add">추가</button>
    </div>

    <div class="todo-list" id="todoList">
        <div class="todo-item">
            <span class="todo-text">JavaScript 공부하기</span>
            <button type="button" class="btn btn-remove">삭제</button>
        </div>
        <div class="todo-item">
            <span class="todo-text">HTML/CSS 복습하기</span>
            <button type="button" class="btn btn-remove">삭제</button>
        </div>
    </div>

    <div class="quiz-task">
        <h3>🎯 해야 할 일:</h3>
        <ul class="task-list">
            <li><strong>추가 기능:</strong> 입력창에 텍스트를 입력하고 "추가" 버튼을 누르면 새로운 할일이 목록에 추가되어야 합니다.</li>
            <li><strong>삭제 기능:</strong> 각 할일 옆의 "삭제" 버튼을 누르면 해당 항목이 목록에서 제거되어야 합니다.</li>
            <li><strong>입력 검증:</strong> 빈 텍스트는 추가되지 않도록 해주세요.</li>
            <li><strong>입력창 초기화:</strong> 할일 추가 후 입력창을 비워주세요.</li>
        </ul>
        <br>
        <p><strong>💡 힌트:</strong> addEventListener, createElement, appendChild, remove 등을 사용해보세요!</p>
    </div>
</div>

<script>
// 여기에 JavaScript 코드를 작성해주세요!

// 필요한 기능들:

	const todoInputEL = document.getElementById('todoInput');
	const addListEL = document.getElementById('addBtn');
	const todoEL = document.getElementById('todoList');
	
// 1. 추가 버튼 클릭 이벤트	
addListEL.addEventListener('click', (ev) => {

	
	if(! todoInputEL.value.trim()) {
		alert('할 일을 입력하세요');
		todoInputEL.focus();
		return;
	}

	const newTodoEL = document.createElement('div');
	newTodoEL.className = 'todo-item';
	
	newTodoEL.innerHTML = '<span class="todo-text">' + todoInputEL.value + '</span><button type="button" class="btn btn-remove">삭제</button>';
	
	todoEL.appendChild(newTodoEL);
	
	todoInputEL.value = '';
});





// 2. 삭제 버튼 클릭 이벤트  
todoEL.addEventListener('click', function(ev) {
		
	if(ev.target.classList.contains('btn-remove')) {
		if(confirm('삭제하시겠습니까?')) {
			const todoItem = ev.target.closest('.todo-item');
			todoItem.remove();
		}
		
	}
	
	
	
});




// 3. Enter 키로도 추가 가능하게 만들기 (보너스)
todoInputEL.addEventListener('keypress', (e) => {
    if (e.key === 'Enter') {
        addListEL.click();
    }
});

</script>

</body>
</html>