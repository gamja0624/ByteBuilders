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
<style type="text/css">
  .diary-detail {
    height: 800px;
  }
  .title {
    width: 900px;
    margin: 50px auto;
  }
  .container-cover {
    width: 1200px;
    margin: 30px auto;
    height: 700px;
    min-height: 100%;
  }
  .detail-container {
    background-color: #534E4E;
    border-radius: 2%;
    width: 900px;
    height: 600px;
    margin: 0 auto;
  }
  .buttons {
    display: flex;
    flex-direction: row;
    justify-content: center;
  }
  button {
    padding: 10px 15px;
    margin-right: 10px;
    border: none;
    cursor: pointer;
   }
   .buttons-vacant {
      width: 570px;
      color: #534E4E;
   }
  .btn-primary {
    background-color: #7882E2;
    color: #000000;
  }

  .btn-secondary {
    background-color: #D67055;
    color: #000000;
  }
  
  .section {
    background-color: #534E4E;
    padding: 0px 40px;
    display: flex;
    justify-content: center;
    width: 900px;
    height: 500px;
    margin: 0 auto;

  }
  
  .box1 {
    background-color: #FFFFFF;
    width: 440px;
    height: 500px;
    border-radius: 2%;
  }

  .box2 {
    background-color: #FFFFFF;
    width: 440px;
    height: 500px;
    border-radius: 2%;
  }
  .box-vacant {
    width: 8px;
    height: 500px;
    background-color: #534E4E;
  }

</style>
</head>
<body>
  <%@ include file="../../user/navbar/navbar.jsp" %>
  <div class="wrap">
  <div class="diary-detail">
    <div class="title">
      <h1>일기 상세 페이지</h1>
    </div>
  
    <!-- 제목 내용 날짜 이미지  -->
    <div class="container-cover">
    
      <div class="detail-container">
        <!-- 경로 수정하기.  -->
        <!--============================================================================  -->
        <div class="buttons-cover">
          <div class="buttons">
            <div class="buttons-vacant">-</div>
            <button 
              type="button"
              class="btn-primary"
              onclick="location.href='${context}diaryList/${diary.diary_id}/diaryEditForm'">수정하기
            </button>
            <form action="${context}diaryDeleteCheck/${diary.diary_id}">
              <input type="hidden" name="diary_id"
                value="${diary.diary_id}">
              <button type="submit" class="btn-secondary">삭제하기</button>
            </form>
          </div>
        </div>
        <!--============================================================================  -->
        <div class="section">
        
          <div class="box1">
            <!--날짜  -->
            <h3>${diary.diary_date}</h3>
            <!-- 제목  -->
            <h3>${diary.diary_title}</h3>
            <!-- 이미지 -->
            
            <div>${diary.attachment_file}</div>
          </div>
          <div class="box-vacant"></div>
        <!--============================================================================  -->
          <div class="box2">
            <!-- 내용 -->
            <div>${diary.diary_content}</div>
          </div>
        </div>
        <!--============================================================================  -->
      </div>
    </div>
  </div>

  </div>
  <!-- footer  -->
  <%@ include file="../../user/footer/footer.jsp"%>
</body>
</html>