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
</head>
<body>
  <h1> 전체 다이어리 리스트</h1> 
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
        <C:forEach var="diaryList" items="${diary}">
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
        </C:forEach>
      </tbody>
    </table>
  </div>
  <!-- 작성자 : 최은지  -->    
  <!-- footer  -->
  <%@ include file="../user/footer/footer.jsp" %>
</body>
</html>