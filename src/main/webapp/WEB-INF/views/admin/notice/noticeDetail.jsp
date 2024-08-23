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