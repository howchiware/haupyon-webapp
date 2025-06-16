
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!-- jsp 액션태그 -->
<!-- Calculator vo = new Calculator(); 와 유사 -->
<jsp:useBean id="vo" class="ch05.calc.Calculator" /> <!-- 닫는 태그 꼭 있어야 함 -->

<!-- form 태그 입력 요소의 name 속성과 동일한 Calculator의 필드에 값을 설정  -->
<!-- 
	vo.setNum1(Integer.parseInt(request.getParameter("num1")));
	vo.setNum2(Integer.parseInt(request.getParameter("num2")));
	vo.setOperator(request.getParameter("operator"));
	의 역할을 함
 -->
<jsp:setProperty property="*" name="vo" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
</head>
<body>

	<h3>액션태그 - jsp:usebean</h3>
	<p> <%= vo.toString() %></p>

</body>
</html>