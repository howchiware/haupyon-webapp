<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 옵션 선택</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<style>
* { padding: 0; margin: 0; box-sizing: border-box; }

body {
    font-family: "맑은 고딕", Arial, sans-serif;
    font-size: 14px;
    color: #333;
    background: #f8f9fa;
    padding: 20px;
}

.container {
    max-width: 800px;
    margin: 0 auto;
    background: white;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    overflow: hidden;
}

.header {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 20px;
    text-align: center;
}

.header h2 {
    margin: 0;
    font-size: 24px;
}

.product-info {
    padding: 20px;
    border-bottom: 2px solid #eee;
}

.product-name {
    font-size: 20px;
    font-weight: bold;
    color: #333;
    margin-bottom: 10px;
}

.product-price {
    font-size: 18px;
    color: #e74c3c;
    font-weight: bold;
}

.options-container {
    padding: 20px;
}

.section-title {
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 15px;
    color: #333;
    border-left: 4px solid #667eea;
    padding-left: 10px;
}

.option-row {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 15px;
    padding: 15px;
    background: #f8f9fa;
    border-radius: 8px;
    border: 1px solid #e9ecef;
}

.option-row label {
    font-weight: 500;
    min-width: 60px;
}

.form-select, .form-control {
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 8px 10px;
    font-size: 14px;
    background: white;
}

.form-select {
    min-width: 100px;
}

.form-control {
    width: 80px;
    text-align: center;
}

.btn {
    border: none;
    padding: 8px 15px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    font-weight: 500;
    transition: all 0.3s ease;
}

.btn-add {
    background: #28a745;
    color: white;
}

.btn-add:hover {
    background: #218838;
    transform: translateY(-1px);
}

.btn-remove {
    background: #dc3545;
    color: white;
    min-width: 40px;
}

.btn-remove:hover:not(.disabled) {
    background: #c82333;
    transform: translateY(-1px);
}

.btn-remove.disabled {
    background: #ccc;
    cursor: not-allowed;
    opacity: 0.6;
}

.add-option-container {
    text-align: center;
    margin: 20px 0;
}

.order-container {
    padding: 20px;
    background: #f8f9fa;
    text-align: center;
}

.total-info {
    margin-bottom: 15px;
    font-size: 16px;
    font-weight: bold;
}

.btn-order {
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    color: white;
    padding: 12px 30px;
    font-size: 16px;
    font-weight: bold;
    border-radius: 25px;
    transition: all 0.3s ease;
}

.btn-order:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.2);
}

.flex-gap {
    gap: 10px;
}
</style>
</head>
<body>

<div class="container">
    <div class="header">
        <h2><i class="fas fa-shopping-cart"></i> 상품 주문하기</h2>
    </div>
    
    <div class="product-info">
        <div class="product-name">프리미엄 후드티</div>
        <div class="product-price">29,900원</div>
    </div>
    
    <form name="orderForm">
        <div class="options-container">
            <div class="section-title">옵션 선택</div>
            
            <div class="options-list">
                <div class="option-row">
                    <label>색상:</label>
                    <select name="color" class="form-select">
                        <option value="">선택하세요</option>
                        <option value="black">블랙</option>
                        <option value="white">화이트</option>
                        <option value="gray">그레이</option>
                        <option value="navy">네이비</option>
                    </select>
                    
                    <label>사이즈:</label>
                    <select name="size" class="form-select">
                        <option value="">선택하세요</option>
                        <option value="S">S</option>
                        <option value="M">M</option>
                        <option value="L">L</option>
                        <option value="XL">XL</option>
                    </select>
                    
                    <label>수량:</label>
                    <input type="number" name="quantity" class="form-control" min="1" value="1">
                    
                    <button type="button" class="btn btn-remove disabled">
                        <i class="fas fa-minus"></i>
                    </button>
                </div>
            </div>
            
            <div class="add-option-container">
                <button type="button" class="btn btn-add" id="addOptionBtn">
                    <i class="fas fa-plus"></i> 옵션 추가
                </button>
            </div>
        </div>
        
        <div class="order-container">
            <div class="total-info">
                총 수량: <span id="totalQuantity">1</span>개
            </div>
            <button type="button" class="btn btn-order" onclick="submitOrder()">
                <i class="fas fa-shopping-bag"></i> 주문하기
            </button>
        </div>
    </form>
</div>

<script>
// 초기화
document.addEventListener('DOMContentLoaded', function() {
    updateTotalQuantity();
    
    // 옵션 추가 버튼 이벤트
    document.getElementById('addOptionBtn').addEventListener('click', function() {
        addOptionRow();
    });
    
    // 이벤트 위임으로 삭제 버튼 처리
    document.querySelector('.options-list').addEventListener('click', function(e) {
        if (e.target.closest('.btn-remove') && !e.target.closest('.btn-remove').classList.contains('disabled')) {
            removeOptionRow(e.target.closest('.option-row'));
        }
    });
    
    // 수량 변경 시 총 수량 업데이트
    document.querySelector('.options-list').addEventListener('input', function(e) {
        if (e.target.name === 'quantity') {
            updateTotalQuantity();
        }
    });
});

function addOptionRow() {
    const optionsList = document.querySelector('.options-list');
    const firstRow = optionsList.querySelector('.option-row');
    const newRow = firstRow.cloneNode(true);
    
    // 새 행의 값들 초기화
    newRow.querySelectorAll('select').forEach(select => select.selectedIndex = 0);
    newRow.querySelectorAll('input').forEach(input => input.value = '1');
    
    // 삭제 버튼 활성화
    newRow.querySelector('.btn-remove').classList.remove('disabled');
    
    optionsList.appendChild(newRow);
    
    // 모든 삭제 버튼 활성화 (첫 번째 제외)
    updateRemoveButtons();
    updateTotalQuantity();
}

function removeOptionRow(row) {
    const optionsList = document.querySelector('.options-list');
    const rows = optionsList.querySelectorAll('.option-row');
    
    if (rows.length <= 1) {
        return; // 최소 1개는 유지
    }
    
    row.remove();
    updateRemoveButtons();
    updateTotalQuantity();
}

function updateRemoveButtons() {
    const rows = document.querySelectorAll('.option-row');
    
    rows.forEach((row, index) => {
        const removeBtn = row.querySelector('.btn-remove');
        if (index === 0 || rows.length === 1) {
            removeBtn.classList.add('disabled');
        } else {
            removeBtn.classList.remove('disabled');
        }
    });
}

function updateTotalQuantity() {
    const quantityInputs = document.querySelectorAll('input[name="quantity"]');
    let total = 0;
    
    quantityInputs.forEach(input => {
        const value = parseInt(input.value) || 0;
        total += value;
    });
    
    document.getElementById('totalQuantity').textContent = total;
}

function submitOrder() {
    const form = document.orderForm;
    const rows = document.querySelectorAll('.option-row');
    let totalQuantity = 0;
    
    // 각 옵션 행 검증
    for (let i = 0; i < rows.length; i++) {
        const row = rows[i];
        const color = row.querySelector('select[name="color"]').value;
        const size = row.querySelector('select[name="size"]').value;
        const quantity = parseInt(row.querySelector('input[name="quantity"]').value) || 0;
        
        if (!color) {
            alert(`${i + 1}번째 옵션의 색상을 선택해주세요.`);
            row.querySelector('select[name="color"]').focus();
            return;
        }
        
        if (!size) {
            alert(`${i + 1}번째 옵션의 사이즈를 선택해주세요.`);
            row.querySelector('select[name="size"]').focus();
            return;
        }
        
        if (quantity < 1) {
            alert(`${i + 1}번째 옵션의 수량을 1개 이상 입력해주세요.`);
            row.querySelector('input[name="quantity"]').focus();
            return;
        }
        
        totalQuantity += quantity;
    }
    
    // 전체 수량 검증
    if (totalQuantity > 10) {
        alert('전체 수량은 10개를 초과할 수 없습니다.');
        return;
    }
    
    // 주문 정보 수집 및 표시
    let orderSummary = '주문 내역:\n';
    rows.forEach((row, index) => {
        const color = row.querySelector('select[name="color"]').value;
        const size = row.querySelector('select[name="size"]').value;
        const quantity = row.querySelector('input[name="quantity"]').value;
        
        const colorText = row.querySelector('select[name="color"] option:checked').textContent;
        const sizeText = row.querySelector('select[name="size"] option:checked').textContent;
        
        orderSummary += `${index + 1}. ${colorText} / ${sizeText} / ${quantity}개\n`;
    });
    
    orderSummary += `\n총 수량: ${totalQuantity}개`;
    orderSummary += `\n총 금액: ${(totalQuantity * 29900).toLocaleString()}원`;
    
    alert(orderSummary + '\n\n주문이 완료되었습니다!');
}
</script>

</body>
</html>







<!-- 
상품 옵션(색상, 사이즈)을 동적으로 추가/제거할 수 있어야 함
각 옵션마다 수량을 입력할 수 있어야 함
"추가" 버튼으로 새로운 옵션 행을 추가
"삭제" 버튼으로 옵션 행을 제거 (최소 1개는 유지)
첫 번째 옵션의 삭제 버튼은 비활성화
주문하기 버튼 클릭 시 다음을 검증:

모든 옵션의 색상과 사이즈가 선택되었는지
수량이 1 이상 입력되었는지
전체 수량이 10개를 초과하지 않는지


핵심 구현 포인트:

이벤트 위임 - 동적으로 추가되는 요소들의 이벤트 처리
DOM 조작 - cloneNode(), appendChild(), remove() 활용
폼 유효성 검사 - 여러 조건을 순차적으로 검증
상태 관리 - 버튼 활성화/비활성화, 총 수량 실시간 업데이트
 -->