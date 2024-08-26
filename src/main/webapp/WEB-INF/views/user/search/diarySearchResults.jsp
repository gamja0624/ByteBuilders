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
<link href="${staticUrl}css/diarySearchResults.css" rel="stylesheet">
</head>
<body>
  <!-- 작성자 : 노태윤 -->
  <!-- 기능 설명: 관리자 입장에서 일기 검색 페이지입니다 -->
  <div class="diary-list-title">
    <h1>[관리자]일기 조회</h1>
  </div>
  <hr>
  <div class="adminDiaryList">
    <table class="table table-striped">
      <thead>
        <tr>
          <th>일기 이름</th>
          <th>일기 생성 날짜</th>
          <th>첨부 파일</th>
        </tr>
      </thead>
      <tbody>
        <C:forEach var="diary" items="${DiaryList}">
          <tr>
            <td>${diary.diary_title}</td>
            <td>${diary.diary_date}</td>
            <td>${diary.attachment_file}</td>
          </tr>
        </C:forEach>
      </tbody>
    </table>
  </div>
</body>
</html>