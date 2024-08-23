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
                <th>공지사항 ID</th>
                <th>ADMIN key</th>
                <th>공지사항 이름</th>
                <th>공지사항 내용</th>
                <th>공지사항 날짜</th>
                <th>공지사항 우선순위</th>
            </tr>
        </thead>
        <tbody>
             <C:forEach var="notice" items="${NoticeList}" >
                 <tr>
                    <td>${notice.notice_id}</td>
                    <td>${notice.admin_key}</td>
                    <td>${notice.notice_title}</td>
                    <td>${notice.notice_content}</td>
                    <td>${notice.notice_date}</td> 
                    <td>${notice.notice_priority}</td>
                 </tr>
            </C:forEach> 
        </tbody>
    </table>
    
</body>
</html>