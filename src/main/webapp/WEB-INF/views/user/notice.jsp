<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<C:url var="resPath" value="/resources/" />
<C:url var="staticUrl" value="/resources/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="${resPath}css/bootstrap.min.css">
  <link rel="stylesheet" href="${staticUrl}css/footer.css">
  <link href="${staticUrl}css/userNoticeList.css" rel="stylesheet">
</head>
<body>
   <%@ include file="../user/navbar/navbar.jsp" %>
  <!-- 작성자 : 노태윤  -->
  <!-- 기능설명 : 사용자입장에서 공지사항 검색,조회 가능한 페이지  -->

    <!-- 사용자 입장에서 공지 검색 -->
      <div class="wrap">
        <div class="navbar my-3 row">
          <h1>공지사항 조회</h1>
          <form class="col-sm-4 nav" role="search" action="${context}noticeSearchResults" method="post" style="display: inline;">
            <input class="form-control me-2 col-sm-3" type="text" id="selectKeyword" name="notice" placeholder="search...">
            <button class="btn btn-out-outline-sucess" id="searchButton" type="submit">Search</button>
          </form>
        </div>
        <div class="noticetable">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>공지사항 번호</th>
                <th>공지사항 제목</th>
                <th>공지사항 날짜</th>
              </tr>
            </thead>
            <tbody>
              <C:forEach var="notice" items="${NoticeList}">
                <tr>
                  <td>${notice.notice_id}</td>
                  <td><a href="">${notice.notice_title}</a></td>
                  <td>${notice.notice_date}</td>
                </tr>
              </C:forEach>
            </tbody>
          </table>
        </div>
      </div>
  <!-- 작성자 : 최은지  -->    
  <!-- footer  -->
  <%@ include file="../user/footer/footer.jsp" %>
</body>
</html>