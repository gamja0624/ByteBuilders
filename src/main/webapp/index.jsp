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
  <style type="text/css">
    .wrap {
      height: 800px;
      min-height: 100%;
    }
    .img-cover {
    background-color:#050505;
    width: 100%;
    height: 400px;
    
  }
  .landingimg {
    width: 100%;
    margin: 0 auto;
    height: 400px;
    
  }
  </style>
</head>
<body>
  <%@ include file="WEB-INF/views/user/navbar/navbar.jsp" %>
  <div class="wrap">
    <div class="img-cover">
      <img class="landingimg" alt="" src="${staticUrl}img/plouzane.jpg">
    </div>  

  <!-- 작성자 : 최은지  -->    
  <!-- footer  -->
  </div>
  <footer class="userFooter">
  <div class="text-center text-white">
    <ul class="nav justify-content-center pb-3 mb-3 mt-5">
      <li class="nav-item">
        <a class="nav-link px-4 text-white" href="${context}qnaForm">문의하기</a>
      </li>
      <li class="nav-item">
        <a class="nav-link px-4 text-white"  href="${context}notice">공지사항</a>
      </li>
      <li class="nav-item">
        <a class="nav-link px-4 text-white" href="${context}about">홈페이지 소개</a>
      </li>
      <li class="nav-item">
        <a class="nav-link px-4 text-white" href="${context}policy">이용약관</a>
      </li>
    </ul>
  </div>

  <div class="text-center text-white"
       style="color:#A7A7A7 !important; ">
    <span> copyright&copy;</span>
    <span>All right reserved Byte Builders</span>
    <span><a href="${context}admin/login"> 관리자 mode </a></span>
  </div>
</footer>
</body>
</html>
