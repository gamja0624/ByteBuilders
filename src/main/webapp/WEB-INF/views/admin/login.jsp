<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<C:url var="resPath" value="/resources/" />
<C:url var="context" value="/" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자 로그인 페이지</title>
<link href="${resPath}css/bootstrap.css" rel="stylesheet">

<!-- 폰트 추가  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
  href="https://fonts.googleapis.com/css2?family=Gowun+Batang&family=Noto+Sans+KR:wght@100..900&display=swap"
  rel="stylesheet">

<style>
* {
	font-family: Gowun Batang, merriweather, sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body, html {
	height: 100%;
	background-color: #233958;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	flex-direction: column;
}

h1 {
	color: white;
	margin-bottom: 50px;
	white-space: nowrap;
}

h4 {
    color: red;
    margin : 20px;
    white-space: nowrap;
}

.login-container {
	width: 100%;
	max-width: 400px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

.login-box {
	width: 100%;
	padding: 20px;
	background-color: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
  
}

.login-box h2 {
	margin-bottom: 20px;
	font-size: 24px;
	font-weight: bold;
}

.login-box .input-box {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 15px;
}

.login-box .input-box label {
	font-weight: bold;
}

.login-box input[type="text"], 
.login-box input[type="password"] {
	width: calc(100% - 110px);
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
}

.login-box button {
	width: 60%;
	padding:10px;
	background-color: #777;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	font-size: 16px;
	margin-top: 10px;
}

.login-box button:hover {
	background-color: #555;
}
</style>
</head>
<body>
  <div class="login-container">
    <h1>내 마음의 연구소 관리자 페이지 입니다.</h1>
    
    

    <div class="login-box">
      <form action="${context}admin/login"
      method="post">
        <h2>관리자 로그인</h2>
        <div class="input-box">
          <label for="admin-key">관리자 키 :</label> <input type="text"
            name="admin_key" placeholder="관리자 키를 입력하세요"
          >
        </div>
        <div class="input-box">
          <label for="password">비밀번호 :</label> <input type="password"
            name="admin_password" placeholder="비밀번호를 입력하세요"
          >
        </div>
        <div>
          <button type="submit" class="btn btn-outline-dark">로그인</button>
        </div>
      </form>
    </div>
    <C:if test="${loginFailure}">
      <h4>
        아이디 또는 비밀번호가 잘못 되었습니다. 아이디와 비밀번호를 정확히 입력해 주세요.
      </h4>
    </C:if>
  </div>
</body>
</html>