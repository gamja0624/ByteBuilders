<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<C:url var="resPath" value="/resources/" />
<C:url var="staticUrl" value="/resources/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList</title>
<link href="${resPath}css/bootstrap.min.css" rel="stylesheet">
<link href="${staticUrl}css/memberList.css" rel="stylesheet">
</head>
<body>
<!-- 작성자 : 노태윤 -->
<!-- 회원정보 리스트 -->

  <div class="member-list-title"><h1>회원 관리</h1></div>

  <!-- 관리자가 회원 검색하는 검색바입니다. -->
  <div class="searchbar">
    <a class="navbar-brand"></a>
    <nav class="navbar bg-body-tertiary">
<<<<<<< HEAD
      <form class="d-flex" role="search" action="${pageContext.request.contextPath}/admin/memberSearchResults" method="get">
        <input class="form-control me-2" type="text" id="selectKeyword" name="user_id" placeholder="회원 검색...">
=======
      <form class="d-flex" role="search" action="${context}memberSearchResults" method="get">
        <input class="form-control me-2" type="text" id="selectKeyword" name="user" placeholder="회원 검색...">
>>>>>>> c8a7e98a1ecd9e5db33a38df51d904fb79cae64e
        <button class="btn btn-out-outline-sucess" id="MembersearchButton" type="submit">Search</button>
      </form>
    </nav>
  </div>

  <!-- 회원 정보가 나오는 테이블입니다. -->
  <div class="membertable">
    <table class="table table-striped">
      <thead>
        <tr>
          <th>이용자 ID</th>
          <th>이메일</th>
          <th>전화번호</th>
          <th>계정 생성일</th>
          <th>탈퇴신청여부</th>
        </tr>
      </thead>
      <tbody>
        <C:forEach var="user" items="${user}">
          <tr>
            <td>${user.user_id}</td>
            <td>${user.email}</td>
            <td>${user.phonenumber}</td>
            <td>${user.signup_date}</td>
            <td>${user.delete_id}</td>
          </tr>
        </C:forEach>
      </tbody>
    </table>
  </div>

</body>
</html>