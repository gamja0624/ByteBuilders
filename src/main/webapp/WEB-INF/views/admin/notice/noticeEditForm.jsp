<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<C:url var="context" value="/" />
<C:url var="resPath" value="/resources/" />
<!DOCTYPE html>
<!-- 작성자 : 양한재 -->
<!-- 공지사항을 수정할 때 쓰는 폼 입니다. -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${resPath}css/bootstrap.min.css" rel="stylesheet">
<link href="${resPath}css/adminNoticeForm.css" rel="stylesheet">
</head>
<body>
  <div class="content wrap">
    <form action="${context}admin/noticeEdit/${notice.notice_id}"
    method="post">
      <div class="mb-3">
        <label class="form-label">
          공지사항 제목:
        </label>
        <input class="form-control" 
        type="text" 
        name="notice_title" 
        value="${notice.notice_title}"
        />
      </div>
      <div class="mb-3">
        <label class="form-label">
          공지사항 내용:
        </label>
        <textarea class="form-control"
        rows ="10" 
        name="notice_content">${notice.notice_content}
        </textarea>
      </div>
      <button class="btn btn-secondary"
      type="submit">
        수정하기
      </button>
    </form>
  </div>
  
</body>
</html>