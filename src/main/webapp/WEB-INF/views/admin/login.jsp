<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<C:url var="context" value="/" />
<C:url var="resPath" value="/resources/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="${resPath}css/adminLogin.css" rel="stylesheet">
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
    <C:if test="${loginFailure}">
      <h4>
        아이디 또는 비밀번호가 잘못 되었습니다. 아이디와 비밀번호를 정확히 입력해 주세요.
      </h4>
    </C:if>
    
   </form>
</body>
</html>
