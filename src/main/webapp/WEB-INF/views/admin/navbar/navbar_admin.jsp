<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"
%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<C:url var="resPath" value="/resources/" />
<C:url var="staticUrl" value="/resources/" />
<C:url var="context" value="/" />
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>[admin]navbar.jsp</title>
  <link href="${resPath}css/bootstrap.css" rel="stylesheet">
  <style>
    .nav {
      display:flex;
      gap:50px; 
    }
  </style>
</head>
<body>
  <header class="p-3 text-bg-dark">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-between">
        <a class="navbar-brand" href="#"> 
          <img src="${resPath}img/logo3.png" alt="logo" width="30" height="24">
        </a>
        
        <ul class="nav mx-auto">
          <li class="nav-item">
            <a href="#" class="nav-link px-2 text-white">대쉬보드</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link px-2 text-white">회원관리</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link px-2 text-white">일기관리</a>
          </li>
          <li class="nav-item">
            <a href="${context}admin/notice" class="nav-link px-2 text-white">공지사항</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link px-2 text-white">문의답변</a>
          </li>
        </ul>
        
        <div class="text-end">
          <a href="${context}admin/logout" class="btn btn-secondary btn-outline-light me-2">로그아웃</a>
         
        </div>
      </div>
    </div>
  </header>
</body>
</html>
