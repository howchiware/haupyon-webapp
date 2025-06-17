<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구직 신청서</title>
<style type="text/css">
* { padding: 0; margin: 0; box-sizing: border-box; }

body {
    font-family: "맑은 고딕", sans-serif;
    font-size: 14px;
    color: #333;
    background-color: #f5f5f5;
}

.container {
    width: 800px;
    margin: 20px auto;
    background: white;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.1);
}

.title {
    text-align: center;
    margin-bottom: 30px;
    padding-bottom: 15px;
    border-bottom: 2px solid #007bff;
}

.title h1 {
    color: #007bff;
    font-size: 28px;
}

.form-section {
    margin-bottom: 25px;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 20px;
}

.section-title {
    background: #007bff;
    color: white;
    padding: 8px 15px;
    margin: -20px -20px 15px -20px;
    border-radius: 5px 5px 0 0;
    font-weight: bold;
}

.form-row {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
    padding: 10px 0;
}

.form-row label {
    width: 120px;
    font-weight: bold;
    color: #555;
}

.form-control {
    border: 1px solid #ddd;
    padding: 8px 12px;
    border-radius: 4px;
    font-size: 14px;
}

.form-control:focus {
    outline: none;
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0,123,255,0.3);
}

.btn {
    background: #007bff;
    color: white;
    border: none;
    padding: 8px 16px;
    border-radius: 4px;
    cursor: pointer;
    font-size: 14px;
    margin: 0 5px;
}

.btn:hover {
    background: #0056b3;
}

.btn-danger {
    background: #dc3545;
}

.btn-danger:hover {
    background: #c82333;
}

.btn-success {
    background: #28a745;
}

.btn-success:hover {
    background: #218838;
}

.remove-btn {
    background: #dc3545;
    color: white;
    border: none;
    padding: 5px 10px;
    border-radius: 3px;
    cursor: pointer;
    font-size: 12px;
    margin-left: 10px;
}

.remove-btn:hover {
    background: #c82333;
}

.remove-btn.disabled {
    background: #ccc;
    cursor: not-allowed;
    pointer-events: none;
}

.dynamic-section {
    border: 1px solid #eee;
    padding: 15px;
    margin-bottom: 10px;
    border-radius: 5px;
    background: #fafafa;
}

.add-section {
    text-align: center;
    margin-top: 15px;
}

.submit-section {
    text-align: center;
    margin-top: 30px;
    padding-top: 20px;
    border-top: 1px solid #ddd;
}

.error-message {
    color: #dc3545;
    font-size: 12px;
    margin-top: 5px;
    display: none;
}

input[type="date"]::-webkit-calendar-picker-indicator {
    cursor: pointer;
}
</style>
</head>
<body>

<div class="container">
    <div class="title">
        <h1>🏢 구직 신청서</h1>
        <p>모든 필수 항목(*)을 입력해주세요</p>
    </div>

    <form name="jobForm" method="post">
        <!-- 기본 정보 -->
        <div class="form-section">
            <div class="section-title">기본 정보</div>
            
            <div class="form-row">
                <label>성명 *</label>
                <input type="text" name="name" class="form-control" style="width: 200px;" maxlength="20">
                <div class="error-message">이름은 한글 2-10자로 입력하세요</div>
            </div>
            
            <div class="form-row">
                <label>생년월일 *</label>
                <input type="date" name="birthdate" class="form-control" style="width: 200px;">
                <div class="error-message">생년월일을 선택하세요</div>
            </div>
            
            <div class="form-row">
                <label>연락처 *</label>
                <input type="text" name="phone" class="form-control" style="width: 200px;" placeholder="010-1234-5678" maxlength="13">
                <div class="error-message">연락처를 올바른 형식으로 입력하세요</div>
            </div>
            
            <div class="form-row">
                <label>이메일 *</label>
                <input type="email" name="email" class="form-control" style="width: 300px;" placeholder="example@email.com">
                <div class="error-message">올바른 이메일 형식으로 입력하세요</div>
            </div>
        </div>

        <!-- 경력 사항 -->
        <div class="form-section">
            <div class="section-title">경력 사항</div>
            <div id="experienceContainer">
                <div class="dynamic-section">
                    <div class="form-row">
                        <label>회사명 *</label>
                        <input type="text" name="company" class="form-control" style="width: 250px;" placeholder="회사명">
                        <label style="width: 80px; margin-left: 20px;">직책</label>
                        <input type="text" name="position" class="form-control" style="width: 150px;" placeholder="직책">
                        <button type="button" class="remove-btn experience-remove disabled">삭제</button>
                    </div>
                    <div class="form-row">
                        <label>근무기간 *</label>
                        <input type="date" name="startDate" class="form-control" style="width: 150px;">
                        <span style="margin: 0 10px;">~</span>
                        <input type="date" name="endDate" class="form-control" style="width: 150px;">
                        <label style="width: 100px; margin-left: 20px;">
                            <input type="checkbox" name="current"> 현재 재직중
                        </label>
                    </div>
                </div>
            </div>
            <div class="add-section">
                <button type="button" class="btn" id="addExperience">경력 추가</button>
            </div>
        </div>

        <!-- 기술 스택 -->
        <div class="form-section">
            <div class="section-title">기술 스택</div>
            <div id="skillContainer">
                <div class="dynamic-section">
                    <div class="form-row">
                        <label>기술명 *</label>
                        <input type="text" name="skillName" class="form-control" style="width: 200px;" placeholder="예: JavaScript">
                        <label style="width: 100px; margin-left: 20px;">숙련도</label>
                        <select name="skillLevel" class="form-control" style="width: 120px;">
                            <option value="">선택</option>
                            <option value="beginner">초급</option>
                            <option value="intermediate">중급</option>
                            <option value="advanced">고급</option>
                            <option value="expert">전문가</option>
                        </select>
                        <button type="button" class="remove-btn skill-remove disabled">삭제</button>
                    </div>
                </div>
            </div>
            <div class="add-section">
                <button type="button" class="btn" id="addSkill">기술 추가</button>
            </div>
        </div>

        <!-- 제출 버튼 -->
        <div class="submit-section">
            <button type="button" class="btn btn-success" onclick="submitForm()">신청서 제출</button>
            <button type="reset" class="btn">다시 작성</button>
            <button type="button" class="btn btn-danger">작성 취소</button>
        </div>
    </form>
</div>

<script type="text/javascript">
// 여기에 JavaScript 코드를 작성하세요!



// 문제 요구사항:
// 1. 폼 유효성 검증 함수 구현
//    - 이름: 한글 2-10자
//    - 생년월일: 필수, 현재 날짜보다 과거여야 함
//    - 연락처: 010-1234-5678 형식
//    - 이메일: 올바른 이메일 형식
//    - 경력사항: 회사명 필수, 시작일 < 종료일 (현재 재직중이 아닌 경우)
//    - 기술스택: 기술명 필수, 숙련도 선택 필수

// 2. 동적 요소 추가/삭제 기능 구현
//    - 경력사항 추가/삭제
//    - 기술스택 추가/삭제
//    - 첫 번째 항목은 삭제 불가능 (disabled 처리)

// 3. 이벤트 처리
//    - 현재 재직중 체크박스 클릭 시 종료일 입력 필드 비활성화
//    - 연락처 입력 시 자동으로 하이픈(-) 추가
//    - 날짜 입력 시 키보드 입력 방지

// 4. submitForm() 함수에서 모든 유효성 검증 후 성공 시 alert 표시
function submitForm() {
	
	const f = document.jobForm;
	let p;
	
	p  = /[가-힣]{2,10}/;
	if(! p.test(f.name.value.trim())) {
		alert('이름: 한글 2-10자');
		f.name.focus();
		return;
	}
	
	// 생년월일: 현재 날짜보다 과거?
	p = /^\d{4}-\d{2}-\d{2}$/;
	if(! p.test(f.birthdate.value.trim())) {
		alert('생년월일: 필수');
		f.birthDate.focus();
		return;
	}
	
	const today = new Date();
	const birth = new Date(birthdate.value);
	if(birth >= today) {
		alert(', 현재 날짜보다 과거여야 함');
		return;
	}
	
	

	
	// 방법 3: 간단하지만 실용적인 버전 (추천!)
	const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

	// 사용 예시
	if (!emailPattern.test(email.value)) {
	    alert('올바른 이메일 형식으로 입력하세요');
	    return;
	}
	
	
	// 연락처
	p = /\d{3}-\d{4}-\d{4}/;
	if(! p.test(f.phone.value.trim())) {
		alert('연락처: 010-1234-5678 형식');
		f.phone.focus();
		return;
	}
	
	
	
}

// TODO: 위 요구사항들을 모두 구현해보세요!

</script>

</body>
</html>