<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<C:url var="context" value="/" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <div class="wrap">
    <h1>이용자 목록</h1>
    <table>
      <thead>
        <tr>
          <th>다이어리 이용자 목록</th>
        </tr>     
      </thead>
      <tbody>
       <C:forEach var="diary" items="${diary}">
        <tr>
          <td><a href="${context}diaryDetail/${diary.diary_id}">${diary.user_id}</a></td>
        </tr>
       </C:forEach> 
      </tbody>
    </table>
  </div>
</body>
</html>