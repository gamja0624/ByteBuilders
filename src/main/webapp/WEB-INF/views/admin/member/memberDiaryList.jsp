<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<C:url var="resPath" value="/resources/" />
<C:url var="staticUrl" value="/resources/" />
<C:url var="context" value="/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Diary List</title>
<link href="${resPath}css/bootstrap.min.css" rel="stylesheet">
<link href="${staticUrl}css/memberDiaryList.css" rel="stylesheet">
</head>
<body>
  <!-- 작성자 : 노태윤 -->
  <!-- [관리자] 일기 관리 -->

  <div class="diary-list-title">
    <h1>일기 관리</h1>
  </div>
  <hr>
  <!-- 관리자가 회원 검색하는 검색바입니다. -->
  <!-- 관리자 입장에서 일기 검색 -->
  <div class="searchbar">
    <a class="navbar-brand"></a>
    <nav class="navbar bg-body-tertiary">
      <form class="d-flex" role="search" action="${context}admin/diarySearchResults" method="post">
        <input class="form-control me-2" type="text" id="selectKeyword" name="diary" placeholder="diary search...">
        <button class="btn btn-out-outline-sucess" id="diarysearchButton" type="submit">Search</button>
      </form>
    </nav>
  </div>

  <!-- diary 정보가 나오는 테이블입니다.  -->
  <div class="diarytable">
    <table class="table table-striped">
      <thead>
        <tr>
          <th>일기 번호</th>
          <!-- 일기 제목 : 링크로 -> 일기 상세 페이지  -->
          <th>일기 제목</th>
          <th>생성 날짜</th>
          <th>삭제 버튼</th>
        </tr>
      </thead>
      <tbody>
        <C:forEach var="diary" items="${DiaryList}">
          <tr>
            <td>${diary.diary_id}</td>
            <!-- 상세 페이지 이동 -->
            <td><a href="${pageContext.request.contextPath}/memberDiaryDetail?id=${diary.diary_id}">${diary.diary_title}</a></td>
            <td>${diary.create_date}</td>
            <td>
              <!-- 삭제하기 버튼 추가 -->
              <form action="${contextPath}/admin/diaryDelete/${diary.diary_id}" method="post">
                <button type="submit" class="btn btn-danger">삭제하기</button>
              </form>
            </td>
          </tr>
        </C:forEach>
      </tbody>
    </table>
  </div>

</body>
</html>