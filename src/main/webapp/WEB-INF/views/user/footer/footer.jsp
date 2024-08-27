<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<C:url var="context" value="/" /> 

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
  </div>
</footer>


