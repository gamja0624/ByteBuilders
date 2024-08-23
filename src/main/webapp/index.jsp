<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<C:url var="resPath" value="/resources/" />
<C:url var="staticUrl" value="/resources/" />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Home</title>
  <link rel="stylesheet" href="${resPath}css/bootstrap.min.css">
  <link rel="stylesheet" href="${staticUrl}css/footer.css">
</head>
<body>
  <h1>
	 Landing Page
  </h1>

  <!-- 작성자 : 최은지  -->    
  <!-- footer  -->
  
  <footer class="userFooter">
  <div class="text-center text-white">
    <ul class="nav justify-content-center pb-3 mb-3 mt-5">
      <li class="nav-item">
        <a class="nav-link px-4 text-white" href="#">문의하기</a>
      </li>
      <li class="nav-item">
        <a class="nav-link px-4 text-white"  href="#">공지사항</a>
      </li>
      <li class="nav-item">
        <a class="nav-link px-4 text-white" href="#">홈페이지 소개</a>
      </li>
      <li class="nav-item">
        <a class="nav-link px-4 text-white" href="#">이용약관</a>
      </li>
      <li class="nav-item">
        <a class="nav-link px-4 text-white" href="#">개인정보처리방침</a>
      </li>
    </ul>
  </div>

  <div class="text-center text-white"
       style="color:#A7A7A7 !important; ">
    <span> copyright&copy;</span>
    <span>All right reserved Byte Builders</span>
  </div>
</footer>
</body>
</html>
