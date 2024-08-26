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
</body>
</html>
