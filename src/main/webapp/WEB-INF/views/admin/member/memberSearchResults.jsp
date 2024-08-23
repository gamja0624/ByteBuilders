<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList</title>
</head>
<body>

    <table>
        <thead>
            <tr>
                <th>이용자 ID</th>
                <th>이메일</th>
                <th>전화번호</th>
                <th>계정 생성일</th>
                <th>탈퇴신청여부</th>
            </tr>
        </thead>
        <tbody>
             <C:forEach var="user" items="${user}" >
                 <tr>
                    <td>${user.user_id}</td>
                    <td>${user.email}</td>
                    <td>${user.phonenumber}</td>
                    <td>${user.signup_date}</td> 
                    <td>${user.delete_id}</td>
                 </tr>
            </C:forEach> 
        </tbody>
    </table>

</body>
</html>