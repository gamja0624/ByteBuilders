<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<C:url var="context" value="/" /> 
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
    h1 {
      width: 1200px;
      margin: 0 auto;
    }
    
    #diary-list {
      width: 800px;
      margin: 20px auto;
      hegiht: auto;
      min-height: 100%;
    
    }
    .diary-row {
      margin : 10px auto;
    }
    .diary-col {
      margin : 10px auto;
    }
  </style>
</head>
<body>
  <%@ include file="../user/navbar/navbar.jsp" %>
  <div class="wrap">
    <div id="diary-list">
      <div style="margin: 30px 0">
        <h1>전체 다이어리 리스트</h1>
      </div>
      
        <div class="row diary-row">
        <C:forEach var="diaryList" items="${diary}">
          <div class="col-3 diary-col"> 
            <div class="card">
              <img class="card-img-top" alt="cover-img" src="${diaryList.attachment_file}">
              <div class="card-body">
                <div class="card-text">
                  <a href="${context}diaryDetail/${diaryList.diary_id}">
                    ${diaryList.diary_title}
                  </a>
                  <div>
                    ${diaryList.diary_date}
                  </div>
                </div>
              </div>
            </div>
           </div>
         </C:forEach>
        </div>
      </div>
    </div>
  <!-- 작성자 : 최은지  -->    
  <!-- footer  -->
  <%@ include file="../user/footer/footer.jsp" %>
</body>
</html>