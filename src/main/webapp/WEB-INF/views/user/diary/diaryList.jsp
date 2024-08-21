<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<c:url var="context" value="/" />    
<c:url var="resPath" value="/resources/" />
<c:url var="staticUrl" value="/resources/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="${resPath}css/bootstrap.min.css">
  <link rel="stylesheet" href="${staticUrl}css/footer.css">
</head>
<body>
  <h1>이용자 다이어리 리스트</h1>
  <!-- 데이터 : 일기 제목, 일기 날짜, 일기 이미지  -->
  <div>
    <table>
      <thead>
        <tr>
          <th>아이디</th>
          <th>제목</th>
          <th>날짜</th>
          <th>이미지</th>
        </tr>
      </thead>    
      <tbody>
        <c:forEach var="diaryList" items="${diary}">
        <tr>
          <td>
              ${diaryList.diary_id} 
          </td>
           <td>
            <a href="${context}/diaryDetail/${diaryList.diary_id}">
              ${diaryList.diary_title}
            </a>
          </td>        
          <td>${diaryList.diary_date}</td>        
          <td>${diaryList.attachment_file}</td>        
        </tr>
        </c:forEach>
      </tbody>
    </table>
      <%@ include file="../../user/footer/footer.jsp" %>
  </div>
</body>
</html>

