<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<C:url var="context" value="/" />
<C:url var="resPath" value="/resources/" />
<C:url var="context" value="/" />
<!DOCTYPE html>
<!-- 작성자 : 양한재 -->
<!-- 공지사항을 작성할 때 쓰는 폼 입니다. -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${resPath}css/bootstrap.min.css" rel="stylesheet">
<link href="${resPath}css/adminNotice.css" rel="stylesheet">
</head>
<body>
  <div class="content wrap">
    <form action="${context}admin/noticePost"
    method="post">
      <div class="mb-3">
        <label class="form-label">
          공지사항 제목:
        </label>
        <input class="form-control" 
        type="text" 
        name="notice_title" 
        placeholder="제목을 입력해주세요..."
        />
      </div>
      <div class="mb-3">
        <label class="form-label">
          공지사항 내용:
        </label>
        <textarea class="form-control"
         rows="10"
         name="notice_content"
         placeholder="내용을 입력해주세요..."></textarea>
      </div>
      <button class="btn btn-secondary"
      type="submit">
        등록하기
      </button>
    </form>
  </div>
</body>
</html>