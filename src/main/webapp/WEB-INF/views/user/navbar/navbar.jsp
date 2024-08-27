<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<C:url var="resPath" value="/resources/" />
<C:url var="staticUrl" value="/resources/" />
<C:url var="context" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[user]navbar.jsp</title>
<link href="${resPath}css/bootstrap.css" rel="stylesheet">

<!-- 폰트 추가  -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gowun+Batang&family=Noto+Sans+KR:wght@100..900&display=swap"
rel="stylesheet">
<style>
  body {                    /* body 추가 */
    font-family: Gowun Batang, merriweather, sans-serif;
    margin: 0 auto;
  }
  .nav-item {
    margin-right: 50px; 
  }
</style>
</head>
<body>
  <header class="p-3 text-bg-dark">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-between">
        <a class="navbar-brand" href="${context}"> 
          <img src="resources/img/logo3.png" alt="Logo" width="30" height="24">
        </a>
        
        <ul class="nav ms-auto">
          <li class="nav-item">
            <a href="${context}alldiaries" class="nav-link px-2 text-white">모두의 일기</a>
          </li>
          <li class="nav-item">
            <a href="${context}notice" class="nav-link px-2 text-white">공지사항</a>
          </li>
        </ul>
        
        <div class="text-end">
          <a href="${context}login" class="btn btn-outline-light me-2">로그인</a>
          <a href="${context}signup" class="btn btn-light">회원가입</a>
        </div>
      </div>
    </div>
  </header>
</body>
</html>