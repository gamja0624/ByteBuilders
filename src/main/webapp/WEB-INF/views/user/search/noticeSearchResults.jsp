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
<link href="${staticUrl}css/noticeSearchResults.css" rel="stylesheet">
</head>
<body>

  <div class="notice-Search-Results">
    <h1>공지사항 검색 결과</h1>
  </div>
  
  <hr>

  <div class="noticeSearchResultsTable">
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th>공지사항 ID</th>
          <th>공지사항 이름</th>
          <th>공지사항 내용</th>
          <th>공지사항 날짜</th>
        </tr>
      </thead>
      <tbody>
        <C:forEach var="notice" items="${NoticeList}">
          <tr>
            <td>${notice.notice_id}</td>
            <td>${notice.notice_title}</td>
            <td>${notice.notice_content}</td>
            <td>${notice.notice_date}</td>
          </tr>
        </C:forEach>
      </tbody>
    </table>
  </div>

</body>
</html>