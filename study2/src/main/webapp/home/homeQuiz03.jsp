<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>방명록 - 좋아요 기능</title>
  <style>
    body {
      font-family: "맑은 고딕";
      background: #f9f9f9;
      padding: 20px;
    }
    .container {
      max-width: 600px;
      margin: auto;
      background: #fff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }
    .entry {
      padding: 10px;
      border-bottom: 1px solid #eee;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .entry span {
      flex: 1;
    }
    .buttons {
      display: flex;
      gap: 10px;
    }
    .btn {
      padding: 5px 10px;
      border: none;
      cursor: pointer;
      border-radius: 5px;
    }
    .btn-like {
      background-color: #ff7675;
      color: white;
    }
    .btn-delete {
      background-color: #d63031;
      color: white;
    }
  </style>
</head>
<body>

<div class="container">
  <h2>📘 방명록 (좋아요 기능 포함)</h2>
  <input type="text" id="nameInput" placeholder="이름을 입력하세요">
  <button id="addBtn">등록</button>
  <div id="guestbook">
    <div class="entry">
      <span>하은님, 반갑습니다!</span>
      <div class="buttons">
        <button class="btn btn-like">❤️ 좋아요 <span class="like-count">0</span></button>
        <button class="btn btn-delete">삭제</button>
      </div>
    </div>
    <div class="entry">
      <span>지우님, 반갑습니다!</span>
      <div class="buttons">
        <button class="btn btn-like">❤️ 좋아요 <span class="like-count">2</span></button>
        <button class="btn btn-delete">삭제</button>
      </div>
    </div>
  </div>
</div>

<script>
// 여기에 JavaScript 코드를 작성하세요!

const nameInputEL = document.getElementById('nameInput');

const addBtnEL = document.getElementById('addBtn');

const guestbookEL = document.getElementById('guestbook');

const deleteEL = document.querySelector('.btn-delete');

const likeEL = document.querySelector('.like-count');

addBtnEL.addEventListener('click', () => {
	
	if(! nameInputEL.value.trim()) {
		alert('이름을 입력하세요');
		nameInputEL.focus();
		return;
	}
	
	const newList = document.createElement('div');
	newList.className = 'entry';
	newList.innerHTML = '<span>' + nameInputEL.value + '님, 반갑습니다!</span>  <div class="buttons"> '
      +'  <button class="btn btn-like">❤️ 좋아요 <span class="like-count">0</span></button> '
      +'  <button class="btn btn-delete">삭제</button> '
      +' </div>';
      
      
      guestbookEL.appendChild(newList);
	
	nameInputEL.value = '';
	
});

guestbookEL.addEventListener('click', function(e)  {
	
	if(e.target.classList.contains('btn-delete')) {
		if(confirm('삭제하시겠습니까?')) {
			const item = e.target.closest('.entry');
			item.remove();
		}
	}
	
	if(e.target.classList.contains('btn-like')) {
		const count = e.target.querySelector('.like-count');
		count.innerHTML = Number(count.innerText) + 1;
	}
	
});







</script>

</body>
</html>
