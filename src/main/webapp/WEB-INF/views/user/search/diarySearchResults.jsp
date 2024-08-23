<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
      <table>
        <thead>
            <tr>
                <th>일기 이름</th>
                <th>일기 생성 날짜</th>
                <th>첨부 파일</th>
            </tr>
        </thead>
        <tbody>
             <C:forEach var="diary" items="${DiaryList}" >
                 <tr>
                    <td>${diary.diary_title}</td>
                    <td>${diary.diary_date}</td>
                    <td>${diary.attachment_file}</td>
                 </tr>
            </C:forEach> 
        </tbody>
    </table>
    
</body>
</html>