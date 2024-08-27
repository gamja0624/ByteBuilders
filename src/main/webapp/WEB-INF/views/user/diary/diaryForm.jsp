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
  <link rel="stylesheet" href="${resPath}css/bootstrap.min.css">
  <link rel="stylesheet" href="${staticUrl}css/footer.css">
  <link rel="stylesheet" href="${staticUrl}css/diary.css">
</head>
<body>
  <div class="h1-cover">
    <h1>일기 작성</h1>
  </div>
  <div class="diaryFromCover">
    <div class="diaryForm">
    
      <!-- form 으로 이동  -->
      <form action="${context}diaryForm/save" method="post" enctype="multipart/form-data">
        <!--  제목 : text -->
        <h3>오늘의 일기</h3>
        <div>
        
         <div class="my-3 row">
          <label for="tilte" class="col-sm-1 col-form-label "> 제 목</label> 
          <div class="col-sm-11">
            <input type="text" id="title" name="diary_title" class="form-control form-border" >
          </div>
        </div>
        </div>
        <!--  주제 : drop box -->
        <div>          
          <span>
            <label for="topics">주 제</label> 
            <select id="topics" name="topic_id" class="form-border">
              <C:forEach var="topic" items="${topics}">
                <option value="${topic.topic_id}">${topic.content}</option>
              </C:forEach>
            </select> 
          </span>
          
          <!--  날짜 : date -->
          <span>
            <label for="date">날 짜</label> 
            <input type="date" id="date" name="diary_date">
          </span>
          
          
        </div>
        <!--  첨부파일 : 이미지 -->
         <div class="my-3 row">
          <label 
            for="formFile" 
            class="col-sm-2 col-form-label"> 이미지 </label> 
          <div class="col-sm-10">
            <input 
              type="file" 
              accept="image/*"
              id="formFile" 
              name="formFile" 
              class="form-control form-border">
          </div>
        </div>
        
        <!-- 일기내용 : text  -->
        <div>
          <label for="content">일기 내용</label>
          <textarea  
            id="exampleFormControlTextarea1" 
            name="diary_content" 
            class="form-control form-border diary-content"
            rows="2"></textarea>
        </div>

        <div class="diary-last">
          <label>일기 비공개</label>
          <input type="checkbox"
          name="is_public" >
          <button 
            type="submit"  
            id="is-public"  
            class="submit-button">작성 완료</button>
        </div>

      </form>

    </div>
  </div>
  <!-- footer  -->
  <%@ include file="../../user/footer/footer.jsp"%>
</body>
</html>