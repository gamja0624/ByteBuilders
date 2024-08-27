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
    <h2 class="fs-1 fw-bold my-3">
        공지사항 등록
    </h2>
    <form action="${context}admin/noticePost"
    method="post">
      <div class="row mb-3">
        <div class="col">
          <label class="form-label fs-5 fw-bold">
            작성자
          </label>
          <input class="form-control-plaintext"
          type="text"
          readonly="readonly"
          value="${admin_key}">
        </div>
        <div class="col">
          <label class="form-label fs-5 fw-bold">
            등록일
          </label> 
          <input class="form-control-plaintext"
          type="text"
          readonly="readonly"
          value="${date}">
        </div>
      </div>
      <div class="mb-3">
        <label class="form-label fs-5 fw-bold">
          공지사항 제목
        </label>
        <input class="form-control" 
        type="text" 
        name="notice_title" 
        placeholder="제목을 입력해주세요..."
        />
      </div>
      <div class="mb-3">
        <label class="form-label fs-5 fw-bold">
          공지사항 내용
        </label>
        <textarea class="form-control"
         rows="10"
         name="notice_content"
         placeholder="내용을 입력해주세요..."></textarea>
      </div>
      <div class="d-grid my-5 gap-2 justify-content-md-end">
        <button class="btn btn-secondary"
        type="submit">
          공지 등록
        </button>
      </div>
    </form>
  </div>
</body>
</html>