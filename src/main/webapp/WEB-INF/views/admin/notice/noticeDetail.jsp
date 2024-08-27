<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<C:url var="context" value="/" />
<C:url var="resPath" value="/resources/" />
<!-- 작성자 : 양한재 -->
<!-- 공지사항 상세내용을 보여주는 페이지입니다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${notice.notice_title}</title>
<link href="${resPath}css/bootstrap.min.css" rel="stylesheet">
<<<<<<< HEAD
<link href="${resPath}css/adminNoticeDetail.css" rel="stylesheet">
</head>
<body>
  <div class="wrap">
    <div class="title">
      <h2>
        ${notice.notice_title} 
      </h2>
      <p class="text-end">
        ${notice.notice_date}
      </p>
    </div>
    <hr>
    
    <div class="content text-start">
      ${notice.notice_content}
    </div>
    
=======
<link href="${resPath}css/adminNoticeForm.css" rel="stylesheet">
</head>
<body>
  <div class="content wrap">
    <h2 class="fs-1 fw-bold my-3">
        상세 공지사항
    </h2>
    <form action="${context}admin/noticeEdit/${notice.notice_id}"
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
            value="${notice.notice_date}">
          </div>
        </div>
      <div class="mb-3">
        <label class="form-label fs-5 fw-bold">
          공지사항 제목
        </label>
        <input class="form-control-plaintext" 
        type="text" 
        name="notice_title" 
        value="${notice.notice_title}"
        readonly="readonly"
        />
      </div>
      <div class="mb-3">
        <label class="form-label fs-5 fw-bold">
          공지사항 내용
        </label>
        <textarea class="form-control-plaintext"
        rows ="10" 
        name="notice_content"
        readonly="readonly">${notice.notice_content}
        </textarea>
      </div>
    </form>
>>>>>>> c8a7e98a1ecd9e5db33a38df51d904fb79cae64e
    <div>
      <button class="btn btn-secondary"
      type="button"
      onclick="location.href='${context}admin/notice'">
        목록으로
      </button>
    </div>
  </div>
  

</body>
</html>