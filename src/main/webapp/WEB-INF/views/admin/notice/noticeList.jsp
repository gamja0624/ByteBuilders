<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<C:url var="context" value="/" />
<C:url var="resPath" value="/resources/" />
<!DOCTYPE html>
<!-- 작성자 : 양한재 -->
<!-- 공지사항 목록 페이지 -->
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 리스트</title>
<link href="${resPath}css/adminNotice.css" rel="stylesheet">
<link href="${resPath}css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <%@ include file="/WEB-INF/views/admin/navbar/navbar_admin.jsp" %>
  <div class="wrap">
    <h2 class="fs-1 fw-bold my-3">
        공지사항 리스트
    </h2>
    
    <div class="searchbar">
      <form class="d-flex" 
      action="${context}admin/noticeSearchResults" 
      method="get">
        <input class="form-control me-2" 
        type="text" 
        name="notice_title" 
        placeholder="제목을 입력해주세요...">
        <button class="btn btn-secondary"
        type="submit">
          검색하기
        </button>
      </form>  
    </div>
    
    <div class="content my-5">
      <table class="table table-striped table-hover">
      	<tr>
          <th>
            번호
          </th>
          <th>
            제목
          </th>
          <th>
            생성일
          </th>
          <th>
            수정
          </th>
          <th>
            삭제
          </th>
        </tr>
        <C:forEach var="notice" items="${notices}" >
        <tr>
          <td>
            ${notice.notice_id}
          </td>
          <td>
            <a href="${context}admin/notice/${notice.notice_id}">
              ${notice.notice_title}
            </a>
          </td>
          <td>
            ${notice.notice_date}
          </td>
          <td>
            <button class="btn btn-secondary btn-sm"
             type="button"
             onclick="location.href='${context}admin/noticeEdit/${notice.notice_id}'">
             수정하기
            </button>
          </td>
          <td>
            <button class="btn btn-close"
            type="button"
            onclick="location.href='${context}admin/noticeDelete/${notice.notice_id}'">
            </button>
          </td>
        </tr>
        </C:forEach>
      </table>
      <div class="d-grid my-5 gap-2 justify-content-md-end">
        <button class="btn btn-secondary btn-lg" 
         type="button" 
         onclick="location.href='${context}admin/noticePost'"> 
           작성하기 
        </button>
      </div>
    </div>
  </div>
</body>
</html>