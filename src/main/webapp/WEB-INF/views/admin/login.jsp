<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="context" value="/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
  <form action="${context}admin/login"
  method="post">
    <div>
      <label>
        아이디
      </label>
      <input type="text"
      name="admin_key"
      >
    </div>
    <div>
      <label>
        비밀번호
      </label>
      <input type="password"
      name="admin_password"
      >
    </div>
    <button 
    type="submit">
      로그인
    </button>
  </form>
</body>
</html>