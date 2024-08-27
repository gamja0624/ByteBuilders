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
<link href="${resPath}css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${staticUrl}css/footer.css">
<style type="text/css">
  .title {
    width: 1000px;
    margin: 30px auto; 
  }
  table {
    width: 1000px;
    margin: 30px auto;
    text-align: center; 
  }
  tr {
    border-bottom: 1px solid #D6D6D6;
    height: 30px;
  }
</style>
</head>
<body>
  <%@ include file="../../user/navbar/navbar.jsp" %>
  <div class="wrap">
    <div class="title">
      <h1>내 문의 목록</h1>
    </div>
    <div>
      <table>
        <thead>
          <tr>
            <th>문의 번호</th>
            <th>문의 제목</th>
            <th>문의 일자</th>
          </tr>     
        </thead>
        <tbody>
         <C:forEach var="QnA" items="${QnA}">
          <tr>
            <td>${QnA.inquiry_id}</td>
            <td><a href="${context}qnaDeatil/${QnA.inquiry_id}"> ${QnA.inquiry_content}</a></td>
            <td>${QnA.inquiry_date}</td>
          </tr>
         </C:forEach> 
        </tbody>
      </table>
      
    </div>
  </div>
  <%@ include file="../../user/footer/footer.jsp"%>
</body>
</html>
