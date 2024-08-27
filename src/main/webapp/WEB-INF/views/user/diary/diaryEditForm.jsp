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

  <div class="wrap">
    <div class="h1-cover">
      <h1>일기 작성</h1>
    </div>
    <div class="diaryFromCover">
      <div class="diaryForm">
      
        <form action="${context}diaryList/${diary.diary_id}/diaryEditForm" method="post">
          <!--  제목 : text -->
          <h3>오늘의 일기</h3>
          <div>
          
           <div class="my-3 row">
            <label for="tilte" class="col-sm-1 col-form-label "> 제 목</label> 
            <div class="col-sm-11">
              <input type="text" id="title" name="diary_title" class="form-control form-border"  value="${diary.diary_title}">
            </div>
          </div>
          </div>
          <!--  주제 : drop box -->
          <div>          
            <span>
              <label for="topics">주 제</label> 
              <select id="topics" name="topics" class="form-border">
                <option value="topic01">일상</option>
                <option value="topic02">리뷰</option>
                <option value="topic03">오늘의 감정</option>
                <option value="topic04">기억</option>
                <option value="topic05">계획</option>
                <option value="topic06">비밀얘기</option>
              </select> 
            </span>
            
            <span>
              <label for="date">날 짜</label> 
              <input type="date" id="date" name="diary_date" value="${diary.diary_date}">
            </span>
          </div>
          <!--  날짜 : date -->
          <!--  첨부파일 : 이미지 -->
           <div class="my-3 row">
            <label for="formFile" class="col-sm-2 col-form-label"> 이미지 </label> 
            <div class="col-sm-10">
              <input  type="file" id="formFile" name="attachment_file" class="form-control form-border"  value="${diary.attachment_file}"> 
            </div>
          </div>
          
          <!-- 일기내용 : text  -->
          <div>
            <label for="content">일기 내용</label>
            <textarea  
              id="exampleFormControlTextarea1" 
              name="diary_content" 
              class="form-control form-border diary-content"
              rows="2"
              >${diary.diary_content}</textarea>
          </div>
  
          <div class="diary-last">
            <label>일기 비공개</label>
            <input type="checkbox" id="is-public" name="is_public" value="${diary.is_public}"
              <C:if test="${diary.is_public}==1">checked</C:if> />
            <button type="submit" class="submit-button" >작성 완료</button>
            <!-- 1이 check -->
          </div>
  
        </form>
  
      </div>
    </div>
  </div>
  <!-- footer  -->
  <%@ include file="../../user/footer/footer.jsp"%>
</body>
</html>