<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<C:url var="resPath" value="/resources/" />
<C:url var="staticUrl" value="/resources/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
<link href="${resPath}css/bootstrap.min.css" rel="stylesheet">
<link href="${staticUrl}css/QnAList.css" rel="stylesheet">
</head>
<body>
<!-- 작성자 : 노태윤 -->
<!-- 기능설명 : 모든 QNA 가 나오는 LIST 페이지 입니다. -->
  <div class="QnA-list-title">
    <h1>문의 사항 조회</h1>
  </div>
  <hr>

  <div class="QnAList">
    <table class="table table-striped">
      <thead>
        <tr>
          <th>문의 ID</th>
          <th>유저 ID</th>
          <th>비회원 이메일</th>
          <th>문의 등록 날짜</th>
          <th>문의 내용</th>
        </tr>
      </thead>
      <tbody>
        <C:forEach var="QnA" items="${QnA}">
          <tr>
            <td>${QnA.inquiry_id}</td>
            <td>${QnA.user_id}</td>
            <td>${QnA.nonmem_email}</td>
            <td>${QnA.inquiry_date}</td>
            <td>${QnA.inquiry_content}</td>
          </tr>
        </C:forEach>
      </tbody>
    </table>
  </div>
</body>
</html>