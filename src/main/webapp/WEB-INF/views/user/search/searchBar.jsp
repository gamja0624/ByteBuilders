<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<C:url var="resPath" value="/resources/" />
<C:url var="context" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link href="${resPath}css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

  <!-- 사용자 입장에서 공지 검색 -->
  <h1>Search</h1>
  <form class="d-flex" role="search" action="${context}noticeSearchResults" method="post">
    <input class="form-control me-2" type="text" id="selectKeyword" name="notice" placeholder="search...">
    <button class="btn btn-out-outline-sucess" id="searchButton" type="submit">Search</button>
  </form>

  <!-- 사용자 입장에서 일기 검색 -->
  <a class="navbar-brand">Diary Search</a>
  <nav class="navbar bg-body-tertiary">
    <form class="d-flex" role="search" action="${context}diarySearchResults" method="post">
      <input class="form-control me-2" type="text" id="selectKeyword" name="diary" placeholder="diary search...">
      <button class="btn btn-out-outline-sucess" id="diarysearchButton" type="submit">Search</button>
    </form>
  </nav>

  <!-- 관리자 입장에서 search => 하지만 user 폴더에있다 옮겨야함 admin으로. -->
  <a class="navbar-brand">[관리자] MemberSearch </a>
  <nav class="navbar bg-body-tertiary">
    <form class="d-flex" role="search" action="${context}memberSearchResults" method="get">
      <input class="form-control me-2" type="text" id="selectKeyword" name="user" placeholder="Member search...">
      <button class="btn btn-out-outline-sucess" id="MembersearchButton" type="submit">Search</button>
    </form>
  </nav>

</body>
</html>
