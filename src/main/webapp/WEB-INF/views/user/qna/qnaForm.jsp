<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<C:url var="resPath" value="/resources/" />
<C:url var="staticUrl" value="/resources/" />
<C:url var="context" value="/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  .form-cover {
    width: 800px;
    margin: 50px auto;
    justify-content: center;
  }
  h1 {
    margin-top: 100px;
  }
  
  .textarea-style {
    height: 400px;
  }
  .button-cover {
    width: 800px;
    text-align: center;
  }
</style>
<link href="${resPath}css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${staticUrl}css/footer.css">
</head>
<body>
  <%@ include file="../../user/navbar/navbar.jsp" %>
  <div class="wrap">
    <div class="form-cover">
      <h1>문의하기</h1>
      <hr>
        <form action="${context}qnaForm/submit" method="post">
          <div class="mb-3">
            <label for="nonmem_email" class="form-label" >문의자 이메일</label>
            <input class="form-control" id="exampleFormControlInput1" name="nonmem_email">
          </div>
          <div class="mb-3">
            <label for="nonmem_email" >문의제목</label>
            <input class="form-control" id="exampleFormControlInput1" name="nonmem_email" disabled="disabled">
          </div>
          <div class="mb-3">
            <label for="content" class="form-label">문의 내용</label>
            <textarea class="form-control textarea-style" id="exampleFormControlTextarea1" name="inquiry_content"> </textarea>
          </div>
          <div class="button-cover">
            <button type="submit" class="btn btn-outline-secondary"> 문의 완료 </button>
          </div>
        </form>
      </div>
  </div>
  <%@ include file="../../user/footer/footer.jsp"%>
</body>
</html>