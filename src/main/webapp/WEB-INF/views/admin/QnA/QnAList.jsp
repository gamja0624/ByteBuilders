<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
</head>
<body>

<table>
        <thead>
            <tr>
                <th>문의 ID</th>
                <th>유저 ID</th>
                <th>비회원 이메일</th>
                <th>문의 등록 날짜</th>
                <th>문의 내용</th>
            </tr>
        </thead>
        <tbody>
             <C:forEach var="QnA" items="${QnA}" >
                 <tr>
                    <td>${QnA.inquiry_id}</td>
                    <td>${QnA.user_id}</td>
                    <td>${QnA.nonmem_email}</td>
                    <td>${QnA.inquiry_date}</td>
                    <td>${QnA.inquiry_content}</td> 
                 </tr>
            </C:forEach> 
        </tbody>
    </table>

</body>
</html>