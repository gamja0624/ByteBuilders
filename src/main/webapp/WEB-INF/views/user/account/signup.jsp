<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<C:url var="resPath" value="/resources/" />
<C:url var="staticUrl" value="/resources/" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>회원가입</title>
 <link rel="stylesheet" href="${resPath}css/bootstrap.min.css">
  <link rel="stylesheet" href="${staticUrl}css/footer.css">
<style>
body {
	font-family: Arial, sans-serif;
}

.signup-container {
	width: 300px;
	margin: 50px auto;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.signup-container h2 {
	text-align: center;
	margin-bottom: 20px;
}

.signup-container label {
	display: block;
	margin-bottom: 5px;
	font-weight: bold;
}

.signup-container input[type="text"], .signup-container input[type="password"],
	.signup-container input[type="email"] {
	width: calc(100% - 20px);
	padding: 8px 10px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 5px;
	box-sizing: border-box;
}

.signup-container input[type="checkbox"] {
	margin-right: 10px;
}

.signup-container button {
	width: 100%;
	padding: 10px;
	background-color: #777;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
}

.signup-container button:hover {
	background-color: #555;
}

#checkbox01, #checkbox01 {
    display: inline;
}
</style>
</head>
<body>
  <%@ include file="../navbar/navbar.jsp"%>  
  
  <div class="signup-container">
    <h2>회원 가입</h2>
    <form action="${context}signup" method="post">
      <label for="email">이메일 </label> 
      <input type="email" id="email" name="email" required> 
      
      <label for="phone">전화번호 </label> 
      <input type="text" id="phone" name="phonenumber" placeholder="010-xxxx-xxxx" required> 
      
      <label for="password">비밀번호 </label> 
      <input type="password" id="password" name="password" required> 
      
      <label for="confirm_password">비밀번호 확인 </label> 
      <input type="password" id="confirm_password" name="confirm_password" required>
   
      <div>
        <label for="terms" id="checkbox01">이용약관 동의 </label>
        <input type="checkbox" id="terms" name="terms" required>
      </div>
      
      <div>
        <label for="privacy" id="checkbox02">개인정보 약관 동의 </label>
        <input type="checkbox" id="privacy checkbox02" name="privacy" required>
      </div>
      
      <button type="submit">회원 가입 완료</button>
    </form>
  </div>
</body>
</html>