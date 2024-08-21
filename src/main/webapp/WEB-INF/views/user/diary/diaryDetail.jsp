<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>    
<C:url var="resPath" value="/resources/" />
<C:url var="staticUrl" value="/resources/" />    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="${resPath}css/bootstrap.min.css">
  <link rel="stylesheet" href="${staticUrl}css/footer.css">
<style type="text/css">
  .diaryCover {
    background-color:;
    width: 1200px;  
  }
  
</style>

</head>
<body>

  <div>
    <h1>일기 상세 페이지</h1>
  </div>
 
  <!-- 제목 내용 날짜 이미지  -->
  <div>
    <!--  ========================  -->
    <div>
      <!--날짜  -->
      <h3>${diaryList.diary_date}</h3>
      <!-- 제목  -->
      <h3>${diaryList.diary_title}</h3>
      <!-- 이미지 -->
      <div>${diaryList.attachment_file}</div>
    <!--  ========================  -->
    </div>
    <div>
      <!-- 내용 -->
      <div>${diaryList.diary_content}</div>
    </div>
  
  </div>
  
  
  <!-- footer  -->
  <%@ include file="../../user/footer/footer.jsp" %>
</body>
</html>