<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url var="resPath" value="/resources/" />
<c:url var="staticUrl" value="/resources/" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
<link href="${resPath}css/bootstrap.min.css" rel="stylesheet">
<link href="${staticUrl}css/memberList.css" rel="stylesheet">
</head>
<body>
    <!-- 작성자 : 노태윤 -->
    <!-- [관리자] 이용자 관리 -->
    <div class="member-list-title">
        <h1>[관리자] 이용자 목록</h1>
    </div>
    <hr>
    <!-- 이용자 정보가 나오는 테이블 -->
    <div class="membertable">
        <c:choose>
            <c:when test="${empty userList}">
                <p>검색된 이용자가 없습니다.</p>
            </c:when>
            <c:otherwise>
                <table class="table table-striped">
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
                        <c:forEach var="user" items="${userList}">
                            <tr>
                                <td>${user.user_id}</td>
                                <td>${user.email}</td>
                                <td>${user.phonenumber}</td>
                                <td>${user.signup_date}</td>
                                <td>${user.delete_id}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
=======
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

>>>>>>> c8a7e98a1ecd9e5db33a38df51d904fb79cae64e
</body>
</html>