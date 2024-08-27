<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="staticUrl" value="/resources/" />

<html>
<head>
    <title>일기 상세 보기</title>
    <link href="${resPath}css/bootstrap.min.css" rel="stylesheet">
    <link href="${staticUrl}css/memberDiaryDetail.css" rel="stylesheet">
</head>
<body>
  <!-- 작성자 : 노태윤 -->
  <!-- 기능설명 : 링크 누르면 나오는 diary 상세페이지 -->
  
  <div class="wrap">
      <div class="diary-Detail-Title">
        <h1>${diary.diary_title}</h1>
      </div>
      
      <p class="diarydate">
        <strong>작성 날짜:</strong> ${diary.diary_date}
      </p>
      
      <div class="diarycontent">
        <div>
          <strong>내용:</strong> 
          <div class="diary-content">
             ${diary.diary_content}
          </div>
        </div>
        
        <div>
          <strong>유저 아이디 : ${diary.user_id} </strong> 
        </div>
        
        <div>
          <strong>다이어리 아이디 : ${diary.diary_id} </strong> 
        </div>
        
      </div>
  </div>
  
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>일기 상세 보기</title>
</head>
<body>
<!-- 작성자 : 노태윤 -->
<!-- 기능설명 : 링크 누르면 나오는 diary 상세페이지 -->

    <h1>${diary.diary_title}</h1>
    <p><strong>작성 날짜:</strong> ${diary.diary_date}</p>
    <p><strong>내용:</strong> ${diary.diary_content}</p>
>>>>>>> c8a7e98a1ecd9e5db33a38df51d904fb79cae64e
</body>
</html>
