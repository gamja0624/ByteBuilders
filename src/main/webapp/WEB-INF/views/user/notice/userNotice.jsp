<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<C:url var="resPath" value="/resources/" />
<C:url var="staticUrl" value="/resources/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${resPath}css/bootstrap.min.css" rel="stylesheet">
<link href="${staticUrl}css/userNoticeList.css" rel="stylesheet">
</head>
<body>
<!-- 작성자 : 노태윤  -->
<!-- 기능설명 : 사용자입장에서 공지사항 검색,조회 가능한 페이지  -->
  <div class="user-notice-list">
    <h1>공지사항 조회</h1>
  </div>

  <!-- 사용자 입장에서 공지 검색 -->
  <div class="noticesearchbar">
    <a class="navbar-brand"></a>
    <nav class="navbar bg-body-tertiary">
      <form class="d-flex" role="search" action="${context}noticeSearchResults" method="post">
        <input class="form-control me-2" type="text" id="selectKeyword" name="notice" placeholder="search...">
        <button class="btn btn-out-outline-sucess" id="searchButton" type="submit">Search</button>
      </form>
    </nav>
  </div>
  <hr>
  <div class="noticetable">
    <table class="table table-striped">
      <thead>
        <tr>
          <th>공지사항 ID</th>
          <th>공지사항 이름</th>
          <th>공지사항 날짜</th>
          <th>공지사항 우선순위</th>
        </tr>
      </thead>
      <tbody>
        <C:forEach var="notice" items="${NoticeList}">
          <tr>
            <td>${notice.notice_id}</td>
            <td>${notice.admin_key}</td>
            <td>${notice.notice_title}</td>
            <td>${notice.notice_content}</td>
            <td>${notice.notice_date}</td>
            <td>${notice.notice_priority}</td>
          </tr>
        </C:forEach>
      </tbody>
    </table>
  </div>

</body>
</html>