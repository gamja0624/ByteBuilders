<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<C:url var="resPath" value="/resources/" />
<C:url var="staticUrl" value="/resources/" />
<C:url var="context" value="/" />

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인 페이지</title>

<!-- 폰트 추가  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
  href="https://fonts.googleapis.com/css2?family=Gowun+Batang&family=Noto+Sans+KR:wght@100..900&display=swap"
  rel="stylesheet">
<link rel="stylesheet" href="${resPath}css/bootstrap.min.css">
<link rel="stylesheet" href="${staticUrl}css/footer.css">
<link href="${staticUrl}css/userNoticeList.css" rel="stylesheet">  

<style type="text/css">

   {
  	/*  *수정  */
  	font-family: Gowun Batang, merriweather, sans-serif;
  	margin: 0 auto;
  	padding: 0;
  	box-sizing: border-box;
  }
  
  body, html {
  	/* 수정 */
  	height: 100%;
  }
  
  h4 {
    font-size : 12px;
    color: red;
    margin: 10px auto;
  }
  
  .login-container {
  	position: relative;
  	display: flex;
  	justify-content: center;
  	align-items: center;
  	min-height: 100vh;
  	flex-direction: column;
  }
  
  .login-header {
  	width: 100%;
  	height: 200px;
  	background-image: url('${context}resources/img/cloudy.png');
  	background-size: cover;
  	background-position: center;
  	position: absolute;
  	top: 0;
  	left: 0;
  	right: 0;
  }
  
  .login-box {
  	width: 300px;
  	padding: 20px;
  	background-color: #fff;
  	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  	border-radius: 5px;
  	text-align: center;
  	margin-top: 150px;
  }
  
  .login-box h2 {
  	margin-bottom: 20px;
  	font-size: 24px;
  	font-weight: bold;
  }
  
  .login-box input[type="text"], .login-box input[type="password"] {
  	width: 100%;
  	padding: 10px;
  	margin: 10px 0;
  	border: 1px solid #ddd;
  	border-radius: 5px;
  }
  
  .login-box button {
  	width: 100%;
  	padding: 10px;
  	background-color: #777;
  	color: #fff;
  	border: none;
  	border-radius: 5px;
  	cursor: pointer;
  	font-size: 16px;
  	margin-bottom: 10px;
  }
  
  .login-box button:hover {
  	background-color: #555;
  }
  
  .login-box .additional-options {
  	display: flex;
  	justify-content: space-between;
  	margin-top: 10px;
  	font-size: 14px;
  }
  
  .login-box .additional-options a {
  	text-decoration: none;
  	color: black;
  }
  
  .login-box .additional-options a:hover {
  	text-decoration: underline;
  }
</style>
</head>
<body>

  <%@ include file="../../user/navbar/navbar.jsp"%>
  <form action="${context}login"
  method="post">
    <div class="login-container">
      <div class="login-box">
        <h2>로그인</h2>
        <input type="text" 
        name="email"
        placeholder="이메일을 입력해주세요..."> 
        <input
          type="password" 
          name="password"
          placeholder="비밀번호">
          
        <button type="submit">로그인</button>
        
        <C:if test="${loginFailure}">
          <h4>
            아이디 또는 비밀번호가 잘못 되었습니다. 아이디와 비밀번호를 정확히 입력해 주세요.
          </h4>
        </C:if>
  
        <div class="additional-options">
          <a href="#">회원가입</a> <a href="#">비밀번호 찾기</a>
        </div>
      </div>
    </div>
  </form>
</body>
<%@ include file="../../user/footer/footer.jsp"%>
</html>